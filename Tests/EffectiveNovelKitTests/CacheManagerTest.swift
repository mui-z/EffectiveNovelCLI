//
//  Created by osushi on 2022/12/17.
//

import Foundation
import SwiftCLI
import XCTest

@testable import EffectiveNovelKit

class CacheCheckerTest: XCTestCase {
	
	override func setUp() {
		_ = try! Task.capture(bash: "mkdir ~/.novel")
		_ = try! Task.capture(bash: "touch ~/.novel/hoge.ens")
	}
	
	override func tearDown() {
		_ = try! Task.capture(bash: "rm -rf ~/.novel")
	}
	
	func test_getCacheList() {
		let list = Cache.getCacheList()
		
		XCTAssertEqual(1, list.count)
	}
	
	func test_clearCache() {
		Cache.clearCache()
		let list = Cache.getCacheList()
		XCTAssertEqual([], list)
	}
}
