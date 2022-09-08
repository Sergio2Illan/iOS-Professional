//
//  Extensions.swift
//  UITableViewCustomCellStoryboard
//
//  Created by Sergio Illan Illan on 8/9/22.
//

import UIKit

extension UIViewController {
    
    func showAlert(title: String, message: String, view: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okButton = UIAlertAction(title: "Accept", style: .default) { done in
            print("\(done)")
            
        }
        
        alert.addAction(okButton)
        view.present(alert, animated: true)
    }
    
}
