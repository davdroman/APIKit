import Foundation

/// `URLEncodedQueryParameters` serializes form object for HTTP URL query.
public struct URLEncodedQueryParameters: QueryParameters {
    /// The parameters to be url encoded.
    public let parameters: [String: Any]

    /// Returns `URLEncodedQueryParameters` that is initialized with parameters.
    public init(parameters: [String: Any]) {
        self.parameters = parameters
    }

    /// Generate url encoded `String`.
    public func encode() -> String? {
        guard !parameters.isEmpty else {
            return nil
        }
        return URLEncodedSerialization.string(from: parameters)
    }
}
