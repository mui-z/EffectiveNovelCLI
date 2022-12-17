//
//  Created by osushi on 2022/12/17.
//

import Foundation
import SwiftCLI
import XCTest
import Path

@testable import EffectiveNovelKit

class CacheTest: XCTestCase {
	let HOME_PREFIX = Path.home
	
	override func setUp() {
		_ = try! Task.capture(bash: "mkdir ~/.novel")
	}
	
	override func tearDown() {
		_ = try! Task.capture(bash: "rm -rf ~/.novel")
	}
	
	// MARK: - Tests
	
	func test_getCacheList() {
		_ = try! Task.capture(bash: "touch ~/.novel/hoge.ens")
		
		let list = Cache.getCacheList()
		XCTAssertEqual(1, list.count)
	}
	
	func test_delete() {
		_ = try! Task.capture(bash: "touch ~/.novel/hoge.ens")
		_ = try! Task.capture(bash: "touch ~/.novel/fuga.ens")
		
		if Cache.delete(target: "hoge.ens") {
			let list = Cache.getCacheList()
			print(list)
			XCTAssertEqual([Path.home.string + "/.novel/fuga.ens"], list)
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
