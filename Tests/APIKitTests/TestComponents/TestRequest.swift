import Foundation
import APIKit

struct TestRequest: JSONRequest {
    var absoluteURL: URL? {
        let urlRequest = try? buildURLRequest()
        return urlRequest?.url
    }

    // MARK: Request
    typealias Response = Any

    init(
        host: String = "example.com",
        pathPrefix: String = "",
        path: String = "/",
        method: HTTPMethod = .get,
        parameters: Any? = [:],
        headerFields: [String: String] = [:],
        interceptURLRequest: @escaping (URLRequest) throws -> URLRequest = { $0 }
    ) {
        self.host = host
        self.path = path
        self.pathPrefix = pathPrefix
        self.method = method
        self.parameters = parameters
        self.headerFields = headerFields
        self.interceptURLRequest = interceptURLRequest
    }

    let host: String
    let method: HTTPMethod
    let path: String
    let pathPrefix: String
    let parameters: Any?
    let headerFields: [String: String]
    let interceptURLRequest: (URLRequest) throws -> URLRequest

    func intercept(urlRequest: URLRequest) throws -> URLRequest {
        return try interceptURLRequest(urlRequest)
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return object
    }
}
