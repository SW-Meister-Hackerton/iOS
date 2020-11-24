//
//  DetailViewModel.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/25.
//

import Foundation

import RxSwift
import RxCocoa

//class DetailViewModel: ViewModelType {
//    struct Input {
//        let accept: Driver<Int>
//        let buttonSelect: Signal<Void>
//    }
//    struct Output {
//        let result: Signal<String>
//        
//
//    }
//    func transform(_ input: Input) -> Output {
//        let api = MainAPI()
//        let result = PublishSubject<String>()
//        
////        input.buttonSelect.asObservable().subscribe(onNext: {[weak self] (_) in
////            guard let self = self else { return }
////            api.postRequestList().subscribe(onNext: { response, statusCode in
////                print(statusCode)
////                switch statusCode {
////                case .ok:
////                    if
////
////                }
////            })
////        })
//        input.buttonSelect.asObservable().subscribe(onNext: { [weak self] (_) in
//            
//        })
//        
//        return Output(result: result.asSignal(onErrorJustReturn: "실패"))
//    }
//
//}
