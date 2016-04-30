//
//  ViewController.swift
//  vivaxy
//
//  Created by vivaxy on 16-04-30.
//  Copyright © 2016年 vivaxy. All rights reserved.
//

import UIKit;

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad();
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL (string: "http://vivaxy.github.io");
        let requestObj = NSURLRequest(URL: url!);
        webView.loadRequest(requestObj);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
        // Dispose of any resources that can be recreated.
    }


}

