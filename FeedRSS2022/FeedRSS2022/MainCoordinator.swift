//
//  MainCoordinator.swift
//  FeedRSS2022
//
//  Created by Sergio Illan Illan on 12/9/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() { //Seteamos la primera instancia en este caso el ViewController
        let vc = ViewController.instantiate()
        vc.delegate = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func goToDetailView(data: String){
        let detail = DetailController.instantiate()
        detail.contenidoWeb = data
        detail.delegate = self
        navigationController.pushViewController(detail, animated: true)
    }
    
    
}
