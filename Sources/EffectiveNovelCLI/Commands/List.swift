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

//    @VariadicKey("-d", "--delete", description: "remove local effective novel.")
//    var deleteList: [String]
//
//    // FIXME: -da option replacing.
//    @Flag("-a", "--delete-all", description: "remove local effective novel fall file.")
//    var isDeleteAll: Bool

    func execute() throws {
//        // TODO: Move to Kit Target
		Cache.clear()
		
    }
	
	private func showList() {
		
		print("")
	}
}
