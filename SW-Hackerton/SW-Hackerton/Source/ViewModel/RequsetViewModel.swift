//
//  RequsetViewModel.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/24.
//

import Foundation

import RxSwift
import RxCocoa
import NSObject_Rx

class RequestViewModel: ViewModelType {
    
    private let disposeBag = DisposeBag()
    
    
    struct Input {
        let loadData: Signal<Void>
        //let team: Driver<String>
//        let selectIndexPath: Signal<Void>
    }
    struct Output {
        let result: Signal<String>
        let loadApplyList: PublishRelay<[MainModel]>
    }
    
    func transform(_ input: Input) -> Output {
        let api = MainAPI()
        let result = PublishSubject<String>()
        let loadApplyList = PublishRelay<[MainModel]>()
//        let info = Signal.combineLatest(input.selectIndexPath,RequestViewModel.loadApplyList.asSignal() )
        
        input.loadData.asObservable().subscribe(onNext: {[weak self] (_) in
            guard let self = self else { return }
            api.postRequset().subscribe(onNext: { response, statusCode in
                print(statusCode)
                switch statusCode {
                case .ok:
                print(response)
                    if let response = response {
                        loadApplyList.accept(response)
                    }
                case .serverError:
                    result.onNext("어휴 집가고 싶다")
                default:
                    print("Default")
                }
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
        
        return Output(result: result.asSignal(onErrorJustReturn: "실패"), loadApplyList: loadApplyList)
    }
}
