import Foundation

/// `SessionTaskError` represents an error that occurs while task for a request.
public enum SessionTaskError: LocalizedError {
    /// Error of `URLSession`.
    case connectionError(Error)

    /// Error while creating `URLRequest` from `Request`.
    case requestError(Error)

    /// Error while creating `Request.Response` from `(Data, URLResponse)`.
    case responseError(Error)

    public var errorDescription: String? {
        switch self {
        case .connectionError(let error),
             .requestError(let error),
             .responseError(let error):
            return error.localizedDescription
        }
    }
}
