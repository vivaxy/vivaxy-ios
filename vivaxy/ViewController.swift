//
//  ViewController.swift
//  vivaxy
//
//  Created by vivaxy on 16-04-30.
//  Copyright © 2016年 vivaxy. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    var webView: WKWebView!
    var progressView: UIProgressView!
    
    override func loadView() {
    
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.applicationNameForUserAgent = "vivaxy"
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.allowsLinkPreview = true;
        webView.allowsBackForwardNavigationGestures = true
        view = webView

    }

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL (string: "https://vivaxy.github.io");
        let requestObj = URLRequest(url: url!);
        webView.load(requestObj);
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        return nil
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            print(webView.estimatedProgress)
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    deinit { webView.removeObserver(self, forKeyPath: "estimatedProgress") }
}
