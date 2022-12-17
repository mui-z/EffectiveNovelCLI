//
//  Created by osushi on 2022/12/17.
//

import Foundation
import SwiftCLI
import XCTest
import Path

@testable import EffectiveNovelKit

class CacheTest: XCTestCase {
	
	override func setUp() {
		_ = try! Path.mkdir(Path.home/".novel")(nil)
	}
	
	override func tearDown() {
		_ = try! Task.capture(bash: "rm -rf ~/.novel")
	}
	
	// MARK: - Tests
	
	func test_getCacheList() {
		_ = try! Task.capture(bash: "touch ~/.novel/hoge.ens")
		
		let list = Cache.getCacheList()
		XCTAssertEqual(["hoge"], list)
	}
	
	func test_delete() {
		_ = try! Task.capture(bash: "touch ~/.novel/hoge.ens")
		_ = try! Task.capture(bash: "touch ~/.novel/fuga.ens")
		
		if Cache.delete(target: "hoge") {
			let list = Cache.getCacheList()
			XCTAssertEqual(["fuga"], list)
		} else {
			XCTFail()
		}
	}
	
	func test_clear() {
		_ = try! Task.capture(bash: "touch ~/.novel/hoge.ens")
		
		Cache.clear()
		let list = Cache.getCacheList()
		XCTAssertEqual([], list)
	}
}
