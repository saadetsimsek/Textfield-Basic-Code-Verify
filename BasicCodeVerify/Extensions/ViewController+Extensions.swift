//
//  ViewController+Extensions.swift
//  BasicCodeVerify
//
//  Created by Saadet Şimşek on 07/09/2024.
//

import UIKit

extension UIViewController {
    
    func showAlert(){
        let alertConstroller = UIAlertController(title: "Error",
                                                 message: nil,
                                                 preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertConstroller.addAction(okAction)
        present(alertConstroller, animated: true)
    }
}
