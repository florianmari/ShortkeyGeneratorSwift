import Foundation

class ShortkeyGeneratorTests {
    
    let shortkey = ShortkeyGenerator()
    
    func testGenerateShortkey() {
        do {
            let shortkeyGenerated = try shortkey.generate()
            if shortkeyGenerated.count == 11 {
                print("Test Generate Shortkey succeeds")
            } else {
                print("Test Generate Shortkey failed")
            }
        } catch {
            print("Test Generate Shortkey failed")
        }
    }
    
    func testReplaceUnwantedBytesChars_WithCorrectString() {
        let replacedUnwantedBytesStringResult = shortkey.replaceUnwantedBytesChars("654sd64dsf=")
        if replacedUnwantedBytesStringResult == "654sd64dsf" {
            print("Test Replace Unwanted Chars with Correct String succeeds")
        } else {
            print("Test Replace Unwanted Chars with Correct String failed")
        }
    }
    
    func testReplaceUnwantedBytesChars_WithUncorrectString() {
        let replacedUnwantedBytesStringResult = shortkey.replaceUnwantedBytesChars("64//dfsdf+fd")
        if replacedUnwantedBytesStringResult == "64__dfsdf-f" {
            print("Test Replace Unwanted Chars with Correct String succeeds")
        } else {
            print("Test Replace Unwanted Chars with Correct String failed")
        }
    }
}

let tests = ShortkeyGeneratorTests()
tests.testGenerateShortkey()
tests.testReplaceUnwantedBytesChars_WithCorrectString()
tests.testReplaceUnwantedBytesChars_WithUncorrectString()
