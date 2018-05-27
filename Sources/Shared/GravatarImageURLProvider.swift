//
//  Gravatar.swift
//  Fakery
//
//  Created by Brian Strobach on 5/26/18.
//

import Foundation

// MARK: - QueryItemConvertible
private protocol QueryItemConvertible {
	var queryItem: URLQueryItem {get}
}

// MARK: -
public struct GravatarImageURLProvider: AvatarImageURLProvider {
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

	public func urlString(size: Int) -> String {
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
	public static func gravatar(emailAddress: String) -> GravatarImageURLProvider{
		return GravatarImageURLProvider(emailAddress: emailAddress)
	}
}
