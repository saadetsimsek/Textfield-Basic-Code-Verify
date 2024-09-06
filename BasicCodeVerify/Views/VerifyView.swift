//
//  VerifyView.swift
//  BasicCodeVerify
//
//  Created by Saadet Şimşek on 04/09/2024.
//

import UIKit

class VerifyView: UIView {
    var fieldStack = UIStackView()
    var verifyFields = [VerifyTextField]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        verifyTextFieldConfiguration()
        setConstraints()
        verifyFields[0].becomeFirstResponder()
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func verifyTextFieldConfiguration(){
     //   fieldStack.backgroundColor = .blue
        fieldStack.translatesAutoresizingMaskIntoConstraints = false
        fieldStack.spacing = 5
        fieldStack.distribution = .fillEqually
        
        for number in 0...4{
            let verifyTextfield = VerifyTextField()
            verifyTextfield.tag = number
            verifyTextfield.fieldDelegate = self
            verifyFields.append(verifyTextfield)
            fieldStack.addArrangedSubview(verifyTextfield)
        }
        addSubview(fieldStack)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            fieldStack.topAnchor.constraint(equalTo: topAnchor),
            fieldStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            fieldStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            fieldStack.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
}

extension VerifyView: FieldsProtocol {
    func activeNextField(tag: Int) {
        
        if tag != verifyFields.count - 1 {
            verifyFields[tag + 1].becomeFirstResponder()
        }
        else{
            //check
            print("Check")
        }
    }
    
    func activePreviousFields(tag: Int) {
        if tag != 0 {
            verifyFields[tag - 1].becomeFirstResponder()
        }
    }
    
    
}
