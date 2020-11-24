//
//  LogInViewController.swift
//  SW-Hackerton
//
//  Created by 문지수 on 2020/11/24.
//

import UIKit

import RxSwift
import RxCocoa

class LogInViewController: UIViewController {
    
    @IBOutlet weak var logoLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var nameTxtField: UITextField!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var logInBtn: UIButton!
    
    private let viewModel = LogInViewModel()
    private let disposeBag = DisposeBag()
    private let errorLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        bindViewModel()
        
        nameTxtField.underLine()
        passwordTxtField.underLine()
    
        passwordTxtField.isSecureTextEntry = true

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.navigationBar.isHidden = true
//    }
    
    private func bindViewModel() {
        let input = LogInViewModel.Input(userName: nameTxtField.rx.text.orEmpty.asDriver(), userPw: passwordTxtField.rx.text.orEmpty.asDriver(), doneTap: logInBtn.rx.tap.asSignal())
        let output = viewModel.transform(input)
        
        output.isEnabled.drive(logInBtn.rx.isEnabled).disposed(by: disposeBag)

        
        output.result.emit( onNext: {[unowned self] error in
            view.addSubview(errorLabel)
            errorLabel.text = error
            errorLabel.translatesAutoresizingMaskIntoConstraints = false
            errorLabel.topAnchor.constraint(equalTo: nameTxtField.bottomAnchor).isActive = true
            errorLabel.leadingAnchor.constraint(equalTo: nameTxtField.leadingAnchor).isActive = true
            errorLabel.textColor = .red
            
        },onCompleted: { [unowned self] in
            self.nextView(identifire: "main")
        }).disposed(by: disposeBag)
    }

}

extension UIViewController {
    func nextView(identifire: String) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: identifire)
        navigationController?.pushViewController(viewController!, animated: true)
    }
    
    func setButton(_ button: UIButton) {
        var gradientLayer: CAGradientLayer!
        
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = button.bounds
        gradientLayer.colors = UIColor.customRed.cgColor as! [Any]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = 20
        
        button.layer.insertSublayer(gradientLayer, at: 0)
        button.layer.cornerRadius = 20
        button.tintColor = .white
    }
}

extension UITextField {
    func underLine() {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.blue.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
    }
}

