import XCTest
import SwiftTestUtils
import Avatars

class SharedTests: BaseTestCase {


	//MARK: Linux Testing
	static var allTests = [
		("testLinuxTestSuiteIncludesAllTests", testLinuxTestSuiteIncludesAllTests),
		("testGravatarURLProvider", testGravatarURLProvider),
		("testAdorableAvatarURLProvider", testAdorableAvatarURLProvider)
	]

	func testLinuxTestSuiteIncludesAllTests(){
		assertLinuxTestCoverage(tests: type(of: self).allTests)
	}

	let testUsername = "beau"
	let size = 300

	public func testGravatarURLProvider() throws{
		let testEmail = "\(testUsername)@automattic.com"
		let gravatarURL: URL = .avatarImageURL(size: size, provider: .gravatar(emailAddress: testEmail))
		XCTAssertEqual("https://secure.gravatar.com/avatar/22bd03ace6f176bfe0c593650bcf45d8?d=mm&r=pg&s=\(size)", gravatarURL.absoluteString)
		let gravatarData = try? Data(contentsOf: gravatarURL)
		XCTAssertNotNil(gravatarData)
	}

	public func testAdorableAvatarURLProvider() throws{
		let adorableAvatarURL: URL = .avatarImageURL(size: size, provider: .adorableAvatar(userIdentifier: testUsername))
		XCTAssertEqual("https://api.adorable.io/avatars/\(size)/\(testUsername)", adorableAvatarURL.absoluteString)
		let adorableAvatarData = try? Data(contentsOf: adorableAvatarURL)
		XCTAssertNotNil(adorableAvatarData)
	}
}
