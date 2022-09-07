//
//  ViewController.swift
//  DelegatePatternTwoViews
//
//  Created by Sergio Illan Illan on 7/9/22.
//

import UIKit

class ViewController: UIViewController, retriveDataProtogol {
    
    

    @IBOutlet weak var goNextButton: CustomButton!
    @IBOutlet weak var titleView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()

        // Do any additional setup after loading the view.
    }
    
    private func setView(){
        view.backgroundColor = .magenta
        titleView.text = "Bienvenido"
    }


    @IBAction func didGoNextViewTouch(_ sender: Any) {
        
        let dataView = ViewControllerData(nibName: "ViewControllerData", bundle: nil)
        dataView.delegate = self
        dataView.modalTransitionStyle = .coverVertical
        dataView.modalPresentationStyle = .fullScreen
        present(dataView, animated: true)
        
    }
    
    func retrieveData(data: String) {
        titleView.text = "Bienvenido \(data)"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
