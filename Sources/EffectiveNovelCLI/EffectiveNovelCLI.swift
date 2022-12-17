import SwiftCLI
import Rainbow
import Foundation

public class EffectiveNovelCLI {
    public init() {}
    public func run() -> Never {
        Rainbow.enabled = Term.isTTY

        let cli = CLI(name: "nov", version: "0.0.1", description: "Effective Novel CLI reader")

        cli.commands = [
            Read(),
            List(),
        ]

        cli.goAndExit()
    }
}
