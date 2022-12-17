//
//  Created by osushi on 2022/12/17.
//

import Foundation
import SwiftCLI
import Path

struct Cache {
	static let CACHE_DIR_NAME = ".novel"
	static let SCRIPT_EXTENSION = ".ens"
}

extension Cache {
	static func getCacheList() -> [String] {
		let path = Path.home/CACHE_DIR_NAME
		return path.ls()
			.files
			.filter {
				$0.string.contains(SCRIPT_EXTENSION)
			}
			.map(\.string)
	}
	
	static func clearCache() {
		_ = try! Task.capture(bash: "rm -rf ~/.novel/*")
	}
}
