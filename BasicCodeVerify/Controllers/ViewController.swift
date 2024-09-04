//
//  ViewController.swift
//  BasicCodeVerify
//
//  Created by Saadet Şimşek on 30/08/2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let verifyView = VerifyView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(verifyView)
        setConstraits()
        
    }
    
    private func setConstraits(){
        NSLayoutConstraint.activate([
            verifyView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            verifyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verifyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            verifyView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }


}

