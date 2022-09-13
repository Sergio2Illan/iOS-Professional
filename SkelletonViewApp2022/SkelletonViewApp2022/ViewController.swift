//
//  ViewController.swift
//  SkelletonViewApp2022
//
//  Created by Sergio Illan Illan on 13/9/22.
//

import UIKit
import SkeletonView

class ViewController: UIViewController, UITableViewDelegate, SkeletonTableViewDataSource {
    
    
    
    //MARK: Variables
    
    @IBOutlet weak var tableView: UITableView!
    private let dataName: [String] = ["Sergio I","Francisco I","Alberto I","José I","Silvia B","Diego L","Curro L"]
    private let dataCity: [String] = ["Madrid","Toledo","Navarra","Sevilla","Llanes","Tokyo","Italia"]
    private var dataPrueba = [String]()
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        getDataFromServer()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setSkeleton()
        
        
    }
    
    
    // MARK: Methods
    
    
    private func setSkeleton(){
        tableView.isSkeletonable = true
        tableView.showAnimatedSkeleton(usingColor: .lightGray, transition: .crossDissolve(0.25))
    }
    
    private func setUI() {
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = 120
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func getDataFromServer(){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.dataPrueba.append(contentsOf: self.dataName)
            for data in self.dataCity{
                self.dataPrueba.append(data)
            }
            self.tableView.stopSkeletonAnimation()
            self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
            self.tableView.reloadData()
        }
    }
    
    
    //MARK: Delegate Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return MyTableViewCell.id
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyTableViewCell.id, for: indexPath) as! MyTableViewCell
        
        if !dataName.isEmpty {
            cell.myText.text = dataPrueba[indexPath.row]
            cell.imagen.image = UIImage(systemName: "star")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataPrueba.count
    }

}

