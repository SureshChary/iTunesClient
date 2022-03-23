//
//  UIViewController+Extension.swift
//  iTunesClient
//
//  Created by safwan on 22/03/2022.
//

import UIKit

extension UIViewController {
    /// this function showing alert with message
    /// - Parameter message: the message body
    func showError(with message: String) {
        let alert = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        )
        alert.addAction(okAction)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
