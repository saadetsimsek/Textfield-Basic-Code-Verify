//
//  VerifyView.swift
//  BasicCodeVerify
//
//  Created by Saadet Şimşek on 04/09/2024.
//

import UIKit

protocol VerifyProtocol: AnyObject{
    func verify()
}

class VerifyView: UIView {
    
    weak var verifyDelegate: VerifyProtocol?
    
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
    
    func getFieldsCode() -> String {
        var fieldsCode = ""
        verifyFields.forEach {
            fieldsCode.append($0.text ?? "")
        }
        return fieldsCode
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
            verifyDelegate?.verify()
        }
    }
    
    func activePreviousFields(tag: Int) {
        if tag != 0 {
            verifyFields[tag - 1].text = ""
            verifyFields[tag - 1].becomeFirstResponder()
        }
    }
    
    
}
