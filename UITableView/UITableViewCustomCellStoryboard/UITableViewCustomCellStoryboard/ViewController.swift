//
//  ViewController.swift
//  UITableViewCustomCellStoryboard
//
//  Created by Sergio Illan Illan on 8/9/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let dataName: [String] = ["Sergio I","Francisco I","Alberto I","José I","Silvia B","Diego L","Curro L"]
    let dataCity: [String] = ["Madrid","Toledo","Navarra","Sevilla","Llanes","Tokyo","Italia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // MARK: Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataName.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomTableViewCell
        cell.dataName.text = dataName[indexPath.row]
        cell.dataCity.text = dataCity[indexPath.row]
        cell.dataImage.image = UIImage(named: "me")
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert(title: "Aviso", message: "Se pulsa la celda \(dataName[indexPath.row]) que se encuentra en \(dataCity[indexPath.row])", view: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }

}

