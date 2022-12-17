//
// Created by osushi on 2022/09/25.
//

import Foundation
import SwiftCLI
import Rainbow

class List: Command {
    let name = "list"
    let shortDescription = "cached list view"

    @VariadicKey("-d", "--delete", description: "remove local effective novel.")
    var deleteList: [String]

    // FIXME: -da option replacing.
    @Flag("-a", "--delete-all", description: "remove local effective novel fall file.")
    var isDeleteAll: Bool

    func execute() throws {
//        // TODO: Move to Kit Target
//        if isDeleteAll {
//            do {
//                _ = try Task.capture(bash: "rm -rf ~/.ens/*").stdout
//                print("cache files delete successful.".green)
//            } catch {
//                print("delete failed. manually clean, rm ~/.ens".red)
//                throw error
//            }
//        } else if !deleteList.isEmpty {
//            do {
//                try deleteList.forEach { file in
//                    _ = try Task.capture(bash: "rm -rf ~/.ens/\(file)").stdout
//                    print("~/.ens/\(file) delete successful.")
//                }
//                print("deleting all caches finished".green)
//            } catch {
//                print("delete failed. manually clean, rm ~/.ens/delete-file-name".red)
//                throw error
//            }
//        } else {
//            do {
//                let result = try Task.capture(bash: "ls ~/.ens").stdout
//                print(result.isEmpty ? "file not found." : result.green)
//            } catch {
//                print("could not find files. Does cache dir ~/.ens exist?".red)
//                throw error
//            }
//        }
    }
}
