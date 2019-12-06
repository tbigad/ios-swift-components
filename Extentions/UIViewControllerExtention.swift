//
//  UIViewControllerExtention.swift
//
//  Created by Pavel N on 11/21/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit

public extension UIViewController {

    func showAlertMessage(title:String, message:String, handle: @escaping (()->Void)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "OK button"), style: .default, handler: { _ in
            handle()
        }))
        present(alert, animated: true, completion: nil)
    }

    func HideKeyboard() {
        let Tap:UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dissmissKeyboard))
        view.addGestureRecognizer(Tap)
    }
    
    @objc func dissmissKeyboard() {
        view.endEditing(true)
    }
}
