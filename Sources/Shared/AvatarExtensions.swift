//
//  AvatarExtensions.swift
//  Avatars
//
//  Created by Brian Strobach on 5/27/18.
//

import Foundation

extension String{
	public static func avatarImageURLString(size: Int = 300, provider: AvatarImageURLProvider) -> String{
		return provider.urlString(size: size)
	}
}

extension URL{
	public static func avatarImageURL(size: Int = 300, provider: AvatarImageURLProvider) -> URL{
		return URL(string: .avatarImageURLString(size: size, provider: provider))!
	}
}
