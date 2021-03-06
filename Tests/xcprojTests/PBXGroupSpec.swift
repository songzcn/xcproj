import Foundation
import XCTest
import xcproj

final class PBXGroupSpec: XCTestCase {

    var subject: PBXGroup!

    override func setUp() {
        super.setUp()
        self.subject = PBXGroup(children: ["333"],
                                sourceTree: .group,
                                name: "name")
    }

    func test_init_initializesTheGroupWithTheRightProperties() {
        XCTAssertEqual(subject.children, ["333"])
        XCTAssertEqual(subject.sourceTree, .group)
        XCTAssertEqual(subject.name, "name")
        XCTAssertEqual(subject.usesTabs, nil)
        XCTAssertEqual(subject.indentWidth, nil)
        XCTAssertEqual(subject.tabWidth, nil)
    }

    func test_isa_returnsTheCorrectValue() {
        XCTAssertEqual(PBXGroup.isa, "PBXGroup")
    }

    func test_equals_returnsTheCorretValue() {
        let another = PBXGroup(children: ["333"],
                               sourceTree: .group,
                               name: "name")
        XCTAssertEqual(subject, another)

        let withUsesTabs = PBXGroup(children: ["333"],
                                    sourceTree: .group,
                                    name: "name",
                                    usesTabs: 1)
        XCTAssertFalse(withUsesTabs == subject)
    }

    private func testDictionary() -> [String: Any] {
        return [
            "children": ["child"],
            "name": "name",
            "sourceTree": "absolute"
        ]
    }
}
