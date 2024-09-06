//
//  VerifyTextField.swift
//  BasicCodeVerify
//
//  Created by Saadet Şimşek on 04/09/2024.
//

import UIKit

protocol FieldsProtocol: AnyObject {
    func activeNextField(tag: Int)
    func activePreviousFields(tag: Int)
}

class VerifyTextField: UITextField {
    
    weak var fieldDelegate: FieldsProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
        delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        backgroundColor = .systemGray5
        keyboardType = .numberPad
        layer.cornerRadius = 10
        tintColor = .clear
        layer.borderColor = UIColor.purple.cgColor
        textColor = .purple
        font = UIFont.boldSystemFont(ofSize: 40)
        textAlignment = .center
        
    }
    
    override func deleteBackward() {
        fieldDelegate?.activePreviousFields(tag: tag)
    }
}

extension VerifyTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text, let textRange = Range(range, in: text) {
               let updatedText = text.replacingCharacters(in: textRange, with: string)
               textField.text = updatedText
           }
    //    text = string
        
        if range.length == 0 {
            fieldDelegate?.activeNextField(tag: tag)
            resignFirstResponder()
        }
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        layer.borderWidth = 2
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        layer.borderWidth = 0
    }
}
