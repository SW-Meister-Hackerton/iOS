//
//  MainViewController.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/24.
//

import UIKit

import RxSwift
import RxCocoa

class MainViewController: UIViewController {
    
    @IBOutlet weak var nowRoomLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    private let viewModel = RequestViewModel()
    private let loadData = BehaviorRelay<Void>(value: ())
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        bindViewModel()
        registerCell()
    }
    
    func bindViewModel() {
        let input = RequestViewModel.Input(loadData: loadData.asSignal(onErrorJustReturn: ()))
        let output = viewModel.transform(input)
        
        output.loadApplyList
            .bind(to: tableView.rx.items(cellIdentifier: "MainCell", cellType: MainCell.self)) {(row, repository, cell) in
                print(repository)
                cell.roomName?.text = repository.room
            }.disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func registerCell() {
        tableView.rowHeight = 80
    }
    
}

extension UIColor {
    static var customBlue: UIColor {
        return UIColor(red: 19, green: 78, blue: 245, alpha: 1)
    }
    
    static var customRed: UIColor {
        return UIColor(red: 228, green: 49, blue: 34, alpha: 1)
    }
}

