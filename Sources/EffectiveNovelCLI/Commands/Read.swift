//
// Created by osushi on 2022/09/25.
//

import Foundation
import SwiftCLI

class Read: Command {

    let name = "read"
    let shortDescription = "read novel"

    @Param
    var url: String

    func execute() throws {

    }
}
