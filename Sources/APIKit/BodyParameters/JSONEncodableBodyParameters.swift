import Foundation

/// `JSONEncodableBodyParameters` encodes data to JSON object for HTTP body and states its content type is JSON.
public struct JSONEncodableBodyParameters<E: Encodable>: BodyParameters {
    /// The Encodable JSON object to be serialized.
    public let object: E

    public let dateEncodingStrategy: JSONEncoder.DateEncodingStrategy

    /// Returns `JSONEncodableBodyParameters` that is initialized with JSON object and writing options.
    public init(object: E, dateEncodingStrategy: JSONEncoder.DateEncodingStrategy) {
        self.object = object
        self.dateEncodingStrategy = dateEncodingStrategy
    }

    // MARK: - BodyParameters

    /// `Content-Type` to send. The value for this property will be set to `Accept` HTTP header field.
    public var contentType: String {
        return "application/json"
    }

    public func buildEntity() throws -> RequestBodyEntity {
        let encoder = JSONEncoder()
        if #available(iOS 11.0, *) {
            encoder.outputFormatting = .sortedKeys
        }
        encoder.dateEncodingStrategy = dateEncodingStrategy
        let objectData = try encoder.encode(object)
        return .data(objectData)
    }
}
