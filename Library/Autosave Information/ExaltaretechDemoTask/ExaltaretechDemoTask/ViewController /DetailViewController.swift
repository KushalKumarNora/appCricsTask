//
//  DetailViewController.swift
//  ExaltaretechDemoTask
//
//  Created by kushalkumar nora on 17/10/20.
//  Copyright © 2020 Demo. All rights reserved.
//

import UIKit

class DetailViewController: BaseVC {
    @IBOutlet weak var dogImg: UIImageView!
    
    @IBOutlet weak var desriptionLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    var dict :[DogCeoModelRes]? = []
    override func viewDidLoad() {
        super.viewDidLoad()
        if let profilePicture = dict![0].message {
                   dogImg.sd_setImage(with: URL(string: profilePicture), placeholderImage: UIImage(named: "placeHolderImg"))
               }
        
        nameLbl.text = dict![0].name
        desriptionLbl.text = dict![0].description
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
