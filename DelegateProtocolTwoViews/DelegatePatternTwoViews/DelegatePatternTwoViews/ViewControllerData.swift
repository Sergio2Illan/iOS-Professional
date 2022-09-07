//
//  ViewControllerData.swift
//  DelegatePatternTwoViews
//
//  Created by Sergio Illan Illan on 7/9/22.
//

import UIKit

class ViewControllerData: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var sendDataButton: CustomButton!
    @IBOutlet weak var dataTextField: UITextField!
    var delegate: retriveDataProtogol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    private func setUI(){
        view.backgroundColor = .green
    }

    @IBAction func didTapSendDataButton(_ sender: Any) {
        guard let data = dataTextField.text else { return }
        delegate?.retrieveData(data: data)
        dismiss(animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dataTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
