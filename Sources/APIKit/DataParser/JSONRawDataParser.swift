import Foundation

/// `JSONRawDataParser` response JSON raw data.
public class JSONRawDataParser: DataParser {
    // MARK: - DataParser

    public init() {}

    /// Value for `Accept` header field of HTTP request.
    public var contentType: String? {
        return "application/json"
    }

    /// Return `Data` as-is, received from the request.
    public func parse(data: Data) throws -> Data {
        return data
    }
}
