import Foundation

class ShortkeyGenerator {
    enum Error: Swift.Error {
        case randomBase64BytesGenerationFailed
    }
    
    func generateRandomBase64Bytes() throws -> String {
        var encodedString = Data(count: 8)
        let result = encodedString.withUnsafeMutableBytes {
            SecRandomCopyBytes(kSecRandomDefault, 8, $0.baseAddress!)
        }
        if result == errSecSuccess {
            return replaceUnwantedBytesChars(encodedString.base64EncodedString())
        }
        throw Error.randomBase64BytesGenerationFailed
    }
    
    func replaceUnwantedBytesChars(_ encodedString: String) -> String {
        var pureEncodedString = encodedString.replacingOccurrences(of: "/", with: "_")
        pureEncodedString = pureEncodedString.replacingOccurrences(of: "+", with: "-")
        pureEncodedString = String(pureEncodedString.dropLast()) // Last character with base64 is '=' sign
        return pureEncodedString
    }
    
    func generate() throws -> String {
        do {
            let shortkey = try generateRandomBase64Bytes()
            return shortkey
        } catch {
            throw error
        }
    }
}