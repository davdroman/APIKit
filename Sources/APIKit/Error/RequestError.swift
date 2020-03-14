import Foundation

/// `RequestError` represents a common error that occurs while building `URLRequest` from `Request`.
public enum RequestError: Error {
    /// Indicates the `URL` formed by a type that conforms `Request` is invalid.
    case invalidURLComponents(URLComponents)

    /// Indicates `URLRequest` built by `Request.buildURLRequest` is unexpected.
    case unexpectedURLRequest(URLRequest)
}
