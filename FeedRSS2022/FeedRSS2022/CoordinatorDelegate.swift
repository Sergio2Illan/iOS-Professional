//
//  CoordinatorDelegate.swift
//  FeedRSS2022
//
//  Created by Sergio Illan Illan on 12/9/22.
//

import UIKit

protocol CoordinatorDelegate {
    static func instantiate() -> Self
}


/**Esto sera accsible siempre que sea una subclase de un viewcontroller si no es asi lo tendran que implementar de cero**/

extension CoordinatorDelegate where Self: UIViewController {
    
    static func instantiate() -> Self{
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: id) as! Self
        
    }
}
