//
//  ViewController.swift
//  FeedRSS2022
//
//  Created by Sergio Illan Illan on 9/9/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, XMLParserDelegate, CoordinatorDelegate {
    
    

    @IBOutlet private weak var tableView: UITableView!
    //@IBOutlet weak var celda: UITableViewCell!
    private var posts = [Post]()
    private var parser: XMLParser = XMLParser()
    private var titulo = String()
    private var link = String()
    private var nombre = String()
    var delegate: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        parseData()
        
    }
    
    
    // MARK: Methods
    
    private func setUI(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView() //Eliminate Empty cells
    }
    
    private func parseData(){
        guard let url = URL(string: "https://www.cfeapps.com/feed") else { return }
        guard let parser = XMLParser(contentsOf: url) else { return }
        parser.delegate = self
        parser.parse()
    }
    
    // MARK: Delegate Methods ParseXML
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        nombre = elementName
        
        if elementName == "item" {
            titulo = String()
            link = String()
             
        }
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if !data.isEmpty {
            if nombre == "title" {
                titulo += data
            } else if  nombre == "link" {
                link += data
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "item" {
            
            
            let dataPost = Post(titulo: titulo, link: link)
//            print("\(titulo) -- \(link)")
            posts.append(dataPost)
        }
    }
    
    
    
    // MARK: Delegate Methods UITableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detail = storyboard?.instantiateViewController(withIdentifier: "DetailView") as! DetailController
//        detail.contenidoWeb = posts[indexPath.row].link
//        present(detail, animated: true)
        
        delegate?.goToDetailView(data: posts[indexPath.row].link)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let tituloPost = posts[indexPath.row].titulo
        cell.textLabel?.text = tituloPost
        
        
        return cell
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "detailView" {
//            print("dddd")
//            guard let selectedCell = tableView.indexPathForSelectedRow?.row else {return}
//            let position = posts[selectedCell]
//            let detalle = segue.destination as! DetailController
//            detalle.contenidoWeb = position.link
//        }
//    }

}

