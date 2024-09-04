//
//  VerifyTextField.swift
//  BasicCodeVerify
//
//  Created by Saadet Şimşek on 04/09/2024.
//

import UIKit

class VerifyTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .lightGray
        layer.cornerRadius = 10
        tintColor = .clear
        layer.borderColor = UIColor.purple.cgColor
        textColor = .purple
        font = UIFont.boldSystemFont(ofSize: 40)
        textAlignment = .center
        
    }
}

extension VerifyTextField: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.borderWidth = 0
    }
}
