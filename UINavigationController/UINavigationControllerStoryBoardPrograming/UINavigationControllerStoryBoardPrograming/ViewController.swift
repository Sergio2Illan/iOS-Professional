//
//  ViewController.swift
//  UINavigationControllerStoryBoardPrograming
//
//  Created by Sergio Illan Illan on 7/9/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
    }
    
    private func setUI(){
        view.backgroundColor = .cyan
        navigationItem.title = "Home"
        let button = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(nextView))
        navigationItem.rightBarButtonItem = button
    }

    @objc private func nextView(){
        let detail = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailView")
        
        navigationController?.pushViewController(detail, animated: true)
    }

}

