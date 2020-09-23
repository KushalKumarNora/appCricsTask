//
//  ViewController.swift
//  AppClicsTask
//
//  Created by kushalkumar nora on 22/09/20.
//  Copyright © 2020 Demo. All rights reserved.
//

import UIKit


class ViewController: BaseVC {
    
    
   

    @IBOutlet weak var tfName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func didSelectNext(_ sender: Any) {
        if tfName.text!.isEmpty{
              self.showAlert("Alert", message: "Please Enter Name")
        }else{
            
            let vc = BaseVC.vcFactory("Main", SBVC: "CricketViewController") as! CricketViewController
            vc.name = self.tfName.text!
            if let topVCs = UIApplication.topViewController() {
                topVCs.navigationController?.pushViewController(vc, animated: false)
            }
        }
    }
    

}

