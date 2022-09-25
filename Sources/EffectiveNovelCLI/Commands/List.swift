//
// Created by osushi on 2022/09/25.
//

import Foundation
import SwiftCLI

class List: Command {
    let name = "list"
    let shortDescription = "cached list view"

    @VariadicKey("-d", "--delete", description: "remove local effective novel.")
    var deleteList: [String]

    @Flag("-a", "--delete-all", description: "remove local effective novel fall file.")
    var isDeleteAll: Bool

    func execute() throws {
        if isDeleteAll {
            do {
                _ = try Task.capture(bash: "rm -rf ~/.ens/*").stdout
                print("cache files delete successful.")
            } catch {
                print("delete failed. manually clean, rm ~/.ens")
            }
        } else if !deleteList.isEmpty {
            do {
                try deleteList.forEach { file in
                    _ = try Task.capture(bash: "rm -rf ~/.ens/\(file)").stdout
                    print("~/.ens/\(file) delete successful.")
                }
            } catch {
                print("delete failed. manually clean, rm ~/.ens/delete-file-name")
            }
        } else {
            do {
                let result = try Task.capture(bash: "ls ~/.ens").stdout
                print(result.isEmpty ? "file not found." : result)
            } catch {
                print("could not find files. Does cache dir ~/.ens exist?")
                throw error
            }
        }
    }
}
