//
//  WebViewController.swift
//  StateAdvisor
//
//  Created by Juan Vasquez on 12/4/19.
//  Copyright © 2019 Juan Vasquez. All rights reserved.
//

import Foundation
import WebKit

class WebViewController: UIViewController, WKUIDelegate{
    var city: City?
    var state: State?
    
    @IBOutlet var web: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        web = WKWebView(frame: .zero, configuration: webConfiguration)
        web.uiDelegate = self
        view = web
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://en.wikipedia.org/wiki/\(city!.name),_\(state!.name)")
        let myRequest = URLRequest(url: myURL!)
        web.load(myRequest)
    }
    
}
