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
            verifyFields.append(verifyTextfield)
            fieldStack.addArrangedSubview(verifyTextfield)
        }
        addSubview(fieldStack)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            fieldStack.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            fieldStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            fieldStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            fieldStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
            
        ])
    }
}


