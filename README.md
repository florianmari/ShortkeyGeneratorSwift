# Swift Shortkey Generator

This tiny library helps you to generate for you server or client side swift application short YouTube like IDs (e.g. `R-aF2RGNTaY`). Shortkeys are fixed lenght and URL-safe.

## Use

Example usage:

```swift
do {
            let shortkey = try generateRandomBase64Bytes()
            return shortkey
        } catch {
            throw error
        }
```

Shortkeys are random generated bytes string then encoded in Base64. They are supposed to use on exposed IDs in API to prevent enumeration, evaluation of items numbers...