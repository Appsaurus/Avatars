//
//  AdorableAvatars.swift
//  Fakery
//
//  Created by Brian Strobach on 5/24/18.
//

import Foundation

public enum AdorableAvatarVersion{
	case original, new
}
public class AdorableAvatarImageURLProvider: AvatarImageURLProvider{
	public var userIdentifier: String
	public var version: AdorableAvatarVersion
    public init(userIdentifier: String, version: AdorableAvatarVersion = .new) {
        self.userIdentifier = userIdentifier
		self.version = version
    }

	public func urlString(size: Int = 300) -> String {
		return "https://api.adorable.io/avatar\(version == .new ? "s" : "")/\(size)/\(userIdentifier)"
	}
}


extension AvatarImageURLProvider{
	public static func adorableAvatar(userIdentifier: String, version: AdorableAvatarVersion = .new) -> AdorableAvatarImageURLProvider{
		return AdorableAvatarImageURLProvider(userIdentifier: userIdentifier, version: version)
	}
}
