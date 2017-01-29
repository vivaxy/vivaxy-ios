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
    
    override func loadView() {
    
        let webConfiguration = WKWebViewConfiguration()
        webConfiguration.applicationNameForUserAgent = "vivaxy"
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        let url = URL (string: "https://vivaxy.github.io");
        let requestObj = URLRequest(url: url!);
        webView.load(requestObj);
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        print(navigationAction);
        if navigationAction.targetFrame == nil {
            webView.load(navigationAction.request)
        }
        return nil
    }
}
