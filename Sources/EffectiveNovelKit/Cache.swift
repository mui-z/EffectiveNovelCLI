//
//  Created by osushi on 2022/12/17.
//

import Foundation
import SwiftCLI
import Path
import Rainbow

public struct Cache {
	static let CACHE_DIR_NAME = ".novel"
	static let SCRIPT_EXTENSION = ".ens"
}

extension Cache {
	public static func getCacheList() -> [String] {
		let path = Path.home/CACHE_DIR_NAME
		return path.ls()
			.files
			.filter { $0.string.contains(SCRIPT_EXTENSION) }
			.map { $0.string.components(separatedBy: "/").last! }
			.map { $0.replacingOccurrences(of: SCRIPT_EXTENSION, with: "") }
	}
	
	public static func delete(target: String) -> Bool {
		do {
			_ = try Task.capture(bash: "rm ~/.novel/\(target)\(SCRIPT_EXTENSION)")
			return true
		} catch {
			print(("ERROR: " + error.localizedDescription).red)
			return false
		}
	}
	
	public static func clear() {
		_ = try! Task.capture(bash: "rm -rf ~/.novel/*")
	}
}
