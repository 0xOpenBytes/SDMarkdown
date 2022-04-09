import XCTest
import ScreenData
@testable import SDMarkdown

final class SDMarkdownTests: XCTestCase {
    func testReadme() throws {
        let readme = SomeScreen(
            title: "SDMarkdown",
            someView: .vstack(
                [
                    .label(title: "Convert ScreenData into Markdown", font: .footnote)
                ]
            )
        )
        
        print(readme.markdown)
    }
}
