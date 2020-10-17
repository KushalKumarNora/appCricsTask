//
//  PaginationViewController.swift
//  ExaltaretechDemoTask
//
//  Created by kushalkumar nora on 17/10/20.
//  Copyright © 2020 Demo. All rights reserved.
//

import UIKit
import SDWebImage


class PaginationViewController: BaseVC {

    @IBOutlet weak var tableView: UITableView!
    
     var dataArray :[DogCeoModelRes]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        self.tableView.tableFooterView = UIView()
        let inQNib = UINib(nibName: "DogCell", bundle: nil)
        self.tableView.register(inQNib, forCellReuseIdentifier: "DogCell")
        
        for item in 1...10 {
           self.callApiForDogCeoListList()
        }
        
    }
    
   
        //MARK:- API Call
    func callApiForDogCeoListList(){
        let model = DogCeoModel()
        
        DogCeoManger.sharedInstance.callAPi(model: model) { (success, response) in
            
            
            if success {
                
                if response != nil {
                    self.dataArray?.append(DogCeoModelRes(message: (response!["message"] as! String) ,name: "Bailey",description: "Dogs are often called man's best friend because they fit in with human life. Man refers to humankind and not just guys (Old English). Dogs can serve people in many ways. For example, there are guard dogs, hunting dogs, herding dogs, guide dogs for blind people, and police dogs. There are also dogs that are trained to smell for diseases in the human body or to find bombs or illegal drugs. These dogs sometimes help police in airports or other areas. Sniffer dogs (usually beagles) are sometimes trained for this job. Dogs have even been sent by Russians into outer space, a few years before any human being. The first dog sent up was named Laika, but she died within a few hours." ))
                }
                
                self.tableView.reloadData()
            }
            
        }
    }
    func converStringTOJson(data:String)-> [String:Any] {
            
                let dataStr = data.data(using: .utf8)!
                do {
                    if let json = try JSONSerialization.jsonObject(with: dataStr, options: []) as? [String: Any] {
                        return json
                    }
                }catch let error as NSError {
                    print("Failed to load: \(error.localizedDescription)")
                    return[:]
                }
            
            return [:]
        }
   

}

extension PaginationViewController : UITableViewDelegate, UITableViewDataSource {
 
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataArray!.count
    
 }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let dogCell = tableView.dequeueReusableCell(withIdentifier: "DogCell") as? DogCell else {
            return DogCell()
        }
        dogCell.titleLbl.text = dataArray![indexPath.row].name
        dogCell.descriptionLbl.text = dataArray![indexPath.row].description
        if let profilePicture = dataArray![indexPath.row].message {
            dogCell.userImg.sd_setImage(with: URL(string: profilePicture), placeholderImage: UIImage(named: "placeHolderImg"))
        }
        return dogCell
        
    }
    
  func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 180.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = BaseVC.vcFactory("Main", SBVC: "DetailViewController") as! DetailViewController
        vc.dict = dataArray
        if let topVCs = UIApplication.topViewController() {
            topVCs.navigationController?.pushViewController(vc, animated: false)
        }
    }

 }

extension UIImage {

    public static func loadFrom(url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }

}
