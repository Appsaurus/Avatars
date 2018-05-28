//
//  AvatarImageURLBuilder.swift
//  Avatars
//
//  Created by Brian Strobach on 5/27/18.
//

import Foundation

public class AvatarImageURLProvider{
	func urlString(size: Int) -> String{
		assertionFailure(String(describing: self) + " is abstract. You must implement " + #function)
		return ""
	}
	public func url(size: Int = 300) -> URL{
		return URL(string: urlString(size: size))!
	}
}
