//
//  DetailMainViewController.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/24.
//

import UIKit
import RxSwift
import RxCocoa

class DetailMainViewController: UIViewController {
    
    @IBOutlet weak var roomImage: UIImageView!
    @IBOutlet weak var roomNameLbl: UILabel!
    @IBOutlet weak var roomName: UILabel!
    @IBOutlet weak var teamNameLbl: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var reasonView: UIView!
    @IBOutlet weak var teamNumLbl: UILabel!
    @IBOutlet weak var teamNum: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var refusalBtn: UIButton!
    @IBOutlet weak var acceptanceBtn: UIButton!
    @IBOutlet weak var boardImage: UIImageView!
    @IBOutlet weak var boardLbl: UILabel!
    @IBOutlet weak var beamImage: UIImageView!
    @IBOutlet weak var beamLbl: UILabel!

    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        reasonView.layer.borderWidth = 2
        reasonView.layer.borderColor = UIColor.black.cgColor
        reasonView.layer.cornerRadius = 10
        
        refusalBtn.layer.borderWidth = 2
        refusalBtn.layer.borderColor = UIColor.customRed.cgColor
        refusalBtn.layer.cornerRadius = 15
        
        acceptanceBtn.layer.borderColor = UIColor.customBlue.cgColor
        acceptanceBtn.layer.borderWidth = 2
        acceptanceBtn.layer.cornerRadius = 15
    
        acceptanceBtn.rx.tap.subscribe(onNext: { _ in
            let alert = UIAlertController(title: "성공", message: "수락되었습니다", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "다음", style: .default) { (action) in
                self.popView(identifire: "main")
            }
            alert.addAction(okAction)
            self.present(alert, animated: false, completion: nil)
        }).disposed(by: disposeBag)
        
        refusalBtn.rx.tap.subscribe(onNext: { _ in
            let alert = UIAlertController(title: "거절", message: "거절되었습니다", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "다음", style: .default) { (action) in
                self.popView(identifire: "main")
            }
            alert.addAction(okAction)
            self.present(alert, animated: false, completion: nil)
        }).disposed(by: disposeBag)
    }
}
