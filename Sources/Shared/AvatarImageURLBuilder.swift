//
//  AvatarImageURLBuilder.swift
//  Avatars
//
//  Created by Brian Strobach on 5/27/18.
//

import Foundation

public protocol AvatarImageURLProvider{
	func urlString(size: Int) -> String
	func url(size: Int) -> URL
}
public extension AvatarImageURLProvider{

	public func url(size: Int = 300) -> URL{
		return URL(string: urlString(size: size))!
	}
}
