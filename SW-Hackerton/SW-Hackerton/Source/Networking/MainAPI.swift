//
//  MainAPI.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/24.
//

import Foundation

import RxSwift

class MainAPI {
    private let httpClinet  = HttpClient()
    
    func postRequset() -> Observable<([MainModel]?,StatusCode)> {
        httpClinet.post(api: .requestList, params: nil).map { (response, data) -> ([MainModel]?,StatusCode) in
            switch response.statusCode {
            case 200:
                guard let data = try? JSONDecoder().decode([MainModel].self, from: data) else {
                    return (nil, .fail)
                }
                return (data, .ok)
                
            case 500:
                return (nil, .serverError)
            default:
                return (nil, .fail)
            }
        }
    }
    

    
    func postRequestList() -> Observable<([MainModel]?,StatusCode)> {
        httpClinet.post(api: .requestList, params: nil).map { (response, data) -> ([MainModel]?, StatusCode) in
            print(response.statusCode)
            switch response.statusCode {
            case 200:
                guard let data = try? JSONDecoder().decode([MainModel].self, from: data) else { return (nil, .fail)}
                return (data, .ok)
            case 500:
                return (nil, .serverError)
            default:
                return (nil, .fail)
            }
        }
    }
    
}
