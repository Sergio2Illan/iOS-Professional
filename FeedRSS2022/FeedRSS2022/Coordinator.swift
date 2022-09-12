//
//  Coordinator.swift
//  FeedRSS2022
//
//  Created by Sergio Illan Illan on 12/9/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController {get set}
    func start()
}
