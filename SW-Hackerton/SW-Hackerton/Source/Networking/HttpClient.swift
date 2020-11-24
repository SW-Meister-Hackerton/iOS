//
//  HttpClient.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/24.
//

import Foundation

import Alamofire
import RxSwift
import RxAlamofire

class HttpClient {
    let baseURI = "http://172.30.1.48:8787" 
    
    typealias HttpResult = Observable<(HTTPURLResponse, Data)>

    func get(path: String, param: [String: Any], headers: HTTPHeaders) -> DataRequest {
        return AF.request(baseURI + path, method: .get, parameters: param, encoding: JSONEncoding.prettyPrinted, headers: headers, interceptor: nil)
    }
    
    func put(path: String, param: [String: Any], headers: HTTPHeaders) -> DataRequest {
        return AF.request(baseURI + path, method: .put, parameters: param, encoding: JSONEncoding.prettyPrinted, headers: headers, interceptor: nil)
    }

    func post(api: MrsURL, params: [String: Any]?) -> HttpResult {
        return requestData(.post, baseURI + api.path(), parameters: params, encoding: JSONEncoding.prettyPrinted, headers: api.header(), interceptor: nil)
    }
   
    func delete(path: String, param: [String: Any], headers: HTTPHeaders) -> DataRequest {
        return AF.request(baseURI + path, method: .delete, parameters: param, encoding: JSONEncoding.prettyPrinted, headers: headers, interceptor: nil)
    }
}
enum Header {
    case token, noToken
    
    func header() -> [String:String] {
        switch self {
        case .token:
            guard let token = Token.token else { return [:] }
            return ["Content-Type": "application/json", "Authorization": token]

        case .noToken:
            return ["Content-Type": "application/json"]
        }
    }
}

struct Token {
    static var token: String? {
        get {
            return UserDefaults.standard.string(forKey: "Token")

        }
        set {
            UserDefaults.standard.set(newValue, forKey: "Token")

        }
    }
}

enum StatusCode: Int {
    case fail = 0
    case ok = 200
    case unauthorized = 401
    case overlap = 409
    case JWTdeadline = 403
    case noHere = 404
    case wrongType = 422
    case badReqeust = 400
    case serverError = 500

}
