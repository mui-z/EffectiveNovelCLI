//
// Created by osushi on 2022/09/25.
//

import Foundation
import SwiftCLI
import Rainbow
import EffectiveNovelKit

class List: Command {
    let name = "list"
    let shortDescription = "cached list view"

    func execute() throws {
		let list = Cache.getCacheList()
		print("cached title".bold)
		
		list
			.forEach { title in
				print(title)
			}
		
		print("-------------------")
		print("total: \(list.count)")
    }
}
