// TODO: documentation

import Foundation
#if canImport(Combine)
import Combine

@available(iOS 13, *)
public protocol DecodableRequest: RawJSONRequest {
    associatedtype Error: Swift.Error, Decodable
    associatedtype Decoder: TopLevelDecoder where Decoder.Input == Data
    var decoder: Decoder { get }
}

@available(iOS 13, *)
public extension DecodableRequest {
    func intercept(object: Data, urlResponse: HTTPURLResponse) throws -> Data {
        guard 200..<300 ~= urlResponse.statusCode else {
            let parsedError = try? decoder.decode(Error.self, from: object)
            throw parsedError ?? NSError(
                domain: "",
                code: -1,
                userInfo: [NSLocalizedDescriptionKey: HTTPURLResponse.localizedString(forStatusCode: urlResponse.statusCode).capitalized(with: .current)]
            )
        }
        return object
    }
}

@available(iOS 13, *)
public extension DecodableRequest where Response: Decodable {
    func response(from object: Data, urlResponse: HTTPURLResponse) throws -> Response {
        try decoder.decode(Response.self, from: object)
    }
}

@available(iOS 13, *)
public extension DecodableRequest where Response == Void {
    func response(from object: Data, urlResponse: HTTPURLResponse) throws -> Response { () }
}

@available(iOS 13, *)
public protocol DecodableJSONRequest: DecodableRequest where Decoder == JSONDecoder {}

@available(iOS 13, *)
public extension DecodableJSONRequest {
    var decoder: Decoder { JSONDecoder() }
}
#endif
