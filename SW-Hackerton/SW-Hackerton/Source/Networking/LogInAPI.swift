//
//  LogInAPI.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/24.
//

import Foundation

import RxSwift

class LogInAPI {
    private let httpClient = HttpClient()

    func postLogIn(_ userName: String, _ userPw: String) -> Observable<StatusCode> {
        httpClient.post(api: .LogIn, params: ["name": userName, "password": userPw]).map { (response, data) -> StatusCode in
                print(response.statusCode)
                switch response.statusCode {
                case 200:
                    guard let data = try? JSONDecoder().decode(LogInModel.self, from: data) else { return .serverError}
                Token.token = data.token
                    return .ok
                    
                case 500:
                    return .serverError
                
                default:
                    return .fail
                }
        }
    }
}
