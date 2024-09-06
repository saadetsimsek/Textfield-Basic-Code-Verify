//
//  ViewController.swift
//  BasicCodeVerify
//
//  Created by Saadet Şimşek on 30/08/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let verifyView = VerifyView()
    
    private let accesCode = "12345"
    
    private lazy var verifyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.setTitle("Verify", for: .normal)
        button.tintColor = .blue
        button.layer.cornerRadius = 10
        button.addTarget(self,
                         action: #selector(verifyButtonTapped),
                         for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(verifyButton)
        verifyView.verifyDelegate = self
        view.addSubview(verifyView)
        setConstraits()
        
    }
    
    @objc private func verifyButtonTapped(){
        
        let fieldsCode = verifyView.getFieldsCode()
        
        if fieldsCode == accesCode {
            let vc = SecondViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
        else{
            showAlert()
        }
    }
    
    private func setConstraits(){
        NSLayoutConstraint.activate([
            verifyView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verifyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verifyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verifyView.heightAnchor.constraint(equalToConstant: 100),
            
            verifyButton.topAnchor.constraint(equalTo: verifyView.bottomAnchor, constant: 15),
            verifyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verifyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verifyButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


}
//MARK: - VerifyProtocol

extension ViewController: VerifyProtocol {
    func verify() {
        verifyButtonTapped()
    }
    
    
}
