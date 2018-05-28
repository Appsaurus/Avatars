//
//  Gravatar.swift
//  Fakery
//
//  Created by Brian Strobach on 5/26/18.
//
//  Adapted from original implementation at: https://github.com/Alamofire/AlamofireImage/blob/master/Example/Gravatar.swift

//  Copyright (c) 2015-2018 Alamofire Software Foundation (http://alamofire.org/)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import Foundation


// MARK: - QueryItemConvertible
private protocol QueryItemConvertible {
	var queryItem: URLQueryItem {get}
}

// MARK: -
public class GravatarImageURLProvider: AvatarImageURLProvider {
	public enum DefaultImage: String, QueryItemConvertible {
		case http404 = "404"
		case mysteryMan = "mm"
		case identicon = "identicon"
		case monsterID = "monsterid"
		case wavatar = "wavatar"
		case retro = "retro"
		case blank = "blank"

		var queryItem: URLQueryItem {
			return URLQueryItem(name: "d", value: rawValue)
		}
	}

	public enum Rating: String, QueryItemConvertible {
		case g = "g"
		case pg = "pg"
		case r = "r"
		case x = "x"

		var queryItem: URLQueryItem {
			return URLQueryItem(name: "r", value: rawValue)
		}
	}

	public let email: String
	public let forceDefault: Bool
	public let defaultImage: DefaultImage
	public let rating: Rating

	private let baseURL = URL(string: "https://secure.gravatar.com/avatar")!

	public init(
		emailAddress: String,
		defaultImage: DefaultImage = .mysteryMan,
		forceDefault: Bool = false,
		rating: Rating = .pg)
	{
		self.email = emailAddress
		self.defaultImage = defaultImage
		self.forceDefault = forceDefault
		self.rating = rating
	}

	public override func urlString(size: Int) -> String {
		let url = baseURL.appendingPathComponent(email.md5)
		var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
		var queryItems = [defaultImage.queryItem, rating.queryItem]
		if forceDefault {
			queryItems.append(URLQueryItem(name: "f", value: "y"))
		}
		queryItems.append(URLQueryItem(name: "s", value: "\(size)"))
		components.queryItems = queryItems
		return components.string!
	}
}

extension AvatarImageURLProvider{
	public static func gravatar(emailAddress: String,
								defaultImage: GravatarImageURLProvider.DefaultImage = .mysteryMan,
								forceDefault: Bool = false,
								rating: GravatarImageURLProvider.Rating = .pg) -> GravatarImageURLProvider{
		return GravatarImageURLProvider(emailAddress: emailAddress,
										defaultImage: defaultImage,
										forceDefault: forceDefault,
										rating: rating)
	}
}
