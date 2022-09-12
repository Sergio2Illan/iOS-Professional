//
//  DetailController.swift
//  FeedRSS2022
//
//  Created by Sergio Illan Illan on 9/9/22.
//

import UIKit
import WebKit

class DetailController: UIViewController, WKNavigationDelegate {

    @IBOutlet private weak var web: WKWebView!

    @IBOutlet weak var activity: UIActivityIndicatorView!
    var contenidoWeb: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    

    private func configView(){
        
        guard let url = contenidoWeb else {return}
        let urlObtenida = URL(string: url)
        
        guard let finalUrl = urlObtenida else {return}
        let request = URLRequest(url: finalUrl)
        
        web.load(request)
        web.navigationDelegate = self
    }
    
    
    // MARK: Delegate Methods
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        activity.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activity.stopAnimating()
        activity.hidesWhenStopped = true
    }
    

}
