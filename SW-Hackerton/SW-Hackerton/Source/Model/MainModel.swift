//
//  MainModel.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/24.
//

import Foundation


struct MainModel: Codable {
    let team: String
    let room: String
    let date: String
    let reason: String
    let accept: Int
}
