//
//  HttpClient.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/24.
//

import Foundation

import Alamofire
import RxAlamofire

class HttpClient {
    let baseURI = "" //baseURI 주면 넣기

    func get(path: String, param: [String: Any], headers: HTTPHeaders) -> DataRequest {
        return AF.request(baseURI + path, method: .get, parameters: param, encoding: JSONEncoding.prettyPrinted, headers: headers, interceptor: nil)
    }
    
    func put(path: String, param: [String: Any], headers: HTTPHeaders) -> DataRequest {
        return AF.request(baseURI + path, method: .put, parameters: param, encoding: JSONEncoding.prettyPrinted, headers: headers, interceptor: nil)
    }
    
    func post(path: String, param: [String: Any], headers: HTTPHeaders) -> DataRequest {
        return AF.request(baseURI + path, method: .post, parameters: param, encoding: JSONEncoding.prettyPrinted, headers: headers, interceptor: nil)
    }
    
    func delete(path: String, param: [String: Any], headers: HTTPHeaders) -> DataRequest {
        return AF.request(baseURI + path, method: .delete, parameters: param, encoding: JSONEncoding.prettyPrinted, headers: headers, interceptor: nil)
    }
}

enum StatusCode: Int {
    case ok = 200
    case unauthorized = 401
    case overlap = 409
    case JWTdeadline = 403
    case noHere = 404
    case wrongType = 422
    case badReqeust = 400

}
