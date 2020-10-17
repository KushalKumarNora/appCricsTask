//
//  ViewController.swift
//  ExaltaretechDemoTask
//
//  Created by kushalkumar nora on 17/10/20.
//  Copyright © 2020 Demo. All rights reserved.
//

import UIKit

class ViewController: BaseVC {

    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfUsername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didSelectLoginBtn(_ sender: Any) {
        
        if tfUsername.text?.isEmpty ?? true && tfPassword.text?.isEmpty ?? true {
            self.showAlert("Alert", message: "Please enter valid credential.")
        }
        
        let vc = BaseVC.vcFactory("Main", SBVC: "PaginationViewController") as! PaginationViewController
        
        if let topVCs = UIApplication.topViewController() {
            topVCs.navigationController?.pushViewController(vc, animated: false)
        }
    }
    
}

