import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AdditionalSwiftTests.allTests),
    ]
}
#endif
