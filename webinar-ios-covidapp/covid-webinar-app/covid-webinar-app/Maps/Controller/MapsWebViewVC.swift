//
//  MapsWebViewVC.swift
//  covid-webinar-app
//
//  Created by IRFAN TRIHANDOKO on 03/04/20.
//  Copyright © 2020 Muhammad Arif. All rights reserved.
//

import UIKit
import WebKit

class MapsWebViewVC: UIViewController {
    
    @IBOutlet weak var embedView: UIView!
    @IBOutlet weak var progressView: UIActivityIndicatorView!
    
    private var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configWebView()
    }
}

extension MapsWebViewVC: WKNavigationDelegate {
    
    func configWebView() {
        progressView.isHidden = false
        progressView.startAnimating()
        
        let config = WKWebViewConfiguration()
        webView = WKWebView(frame: self.embedView.bounds, configuration: config)
        webView.navigationDelegate = self
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let urlRequest = URLRequest(url: URL(string: "https://covid19.warsono.id/maps/jabar?embed=1")!)
        webView.load(urlRequest)
        embedView.addSubview(webView)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        progressView.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.stopAnimating()
    }
}
