//
//  MrsURL.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/24.
//

import Foundation

import Alamofire

enum MrsURL {
    case LogIn
    case info

    func path() -> String {
        switch self {
        case .LogIn:
            return "/teacher_login"
        case .info:
            return "/teacher_info"

        }
    }
    func header() -> HTTPHeaders? {
        switch self {
        default:
            return nil
        }
    }
}
