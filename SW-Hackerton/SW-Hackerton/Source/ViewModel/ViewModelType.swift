//
//  ViewModelType.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/23.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(_ input: Input) -> Output
}
