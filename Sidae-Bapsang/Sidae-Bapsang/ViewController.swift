//
//  ViewController.swift
//  Sidae-Bapsang
//
//  Created by zaehorang on 2023/10/04.
//

import UIKit


class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.global().async {
            CrawlManager.crawlStudentUnionMenu()
        }
        
//        CrawlManager.crawlName()
    }
}




