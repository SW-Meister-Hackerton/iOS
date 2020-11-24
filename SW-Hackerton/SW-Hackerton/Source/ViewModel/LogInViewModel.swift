//
//  LogInViewModel.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/24.
//

import Foundation

import RxSwift
import RxCocoa

class LogInViewModel: ViewModelType {
    
    private let disposeBag = DisposeBag()
        
    struct Input {
        let userName: Driver<String>
        let userPw: Driver<String>
        let doneTap: Signal<Void>
    }
    struct Output {
        let isEnabled: Driver<Bool>
        let result: Signal<String>
    }
    
   
    
    func transform(_ input: Input) -> Output {
        let api = LogInAPI()
        let result = PublishSubject<String>()
        let info = Driver.combineLatest(input.userName, input.userPw)
        let isEnabled = info.map { !$0.0.isEmpty && !$0.1.isEmpty}
        
        input.doneTap.withLatestFrom(info).asObservable().subscribe(onNext: { (userName, userPw) in
            api.postLogIn(userName, userPw).subscribe(onNext: { (response) in
                print(response)
                switch response {
                case .ok: result.onCompleted()
                case .serverError: result.onNext("로그인 실패")
                default: print("오잉")
                }
            }).disposed(by:self.disposeBag)
        }).disposed(by: disposeBag)
        
        return Output(isEnabled: isEnabled.asDriver(), result: result.asSignal(onErrorJustReturn: "로그인 실패"))
    }
}
