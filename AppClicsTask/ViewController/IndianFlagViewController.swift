//
//  IndianFlagViewController.swift
//  AppClicsTask
//
//  Created by kushalkumar nora on 22/09/20.
//  Copyright © 2020 Demo. All rights reserved.
//

import UIKit

import UIKit

class IndianFlagViewController: BaseVC {
    
    var name : String = ""
    var playerName:String = ""
    let flagColour = ["White","Yellow","Orange","Green"]
    
    @IBOutlet weak var tableView: UITableView!
    var selectedFlagArr : [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didSelectFinish(_ sender: Any) {
        
        
        
        let formattedArray = (selectedFlagArr.map{String($0)}).joined(separator: ",")
        let currentTime = Date().string(format: "MMM d, h:mm a")
        
        
        if name.isEmpty || playerName.isEmpty || formattedArray == "" {
            self.showAlert("Alert", message: "Please select any one of answer.")
            
        } else {
            let dict = ["name":name ,"flagColour":formattedArray ,"favCricketr":playerName,"date": currentTime ]
            
            coreDataModel.shareInstance.saveData(object: (dict ))
            let vc = BaseVC.vcFactory("Main", SBVC: "ViewController") as! ViewController
            
            if let topVCs = UIApplication.topViewController() {
                topVCs.navigationController?.pushViewController(vc, animated: false)
            }
            
        }
        
    }
    
    @IBAction func didSelectHistory(_ sender: Any) {
        
        let formattedArray = (selectedFlagArr.map{String($0)}).joined(separator: ",")
        
        let currentTime = Date().string(format: "MMM d, h:mm a")
        
        if name.isEmpty || playerName.isEmpty || formattedArray == "" {
            self.showAlert("Alert", message: "Please select any one of answer.")
            
        }else{
            
            let dict = ["name":name ,"flagColour":formattedArray ,"favCricketr":playerName,"date": currentTime ]
            
            coreDataModel.shareInstance.saveData(object: (dict))
            let vc = BaseVC.vcFactory("Main", SBVC: "HistoryViewController") as! HistoryViewController
            
            if let topVCs = UIApplication.topViewController() {
                topVCs.navigationController?.pushViewController(vc, animated: false)
            }
            
        }
        
        
    }
}

extension IndianFlagViewController: UITableViewDelegate, UITableViewDataSource {

 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return flagColour.count
 }

 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let indianFlagCell = tableView.dequeueReusableCell(withIdentifier: "IndianFlagCell") as? IndianFlagCell else {
        return IndianFlagCell()
    }
    indianFlagCell.nameLbl.text = flagColour[indexPath.row]

    return indianFlagCell
 }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        if cell.accessoryType == UITableViewCell.AccessoryType.checkmark
        {
            
            cell.accessoryType = UITableViewCell.AccessoryType.none
            selectedFlagArr.remove(at: indexPath.row)
            
        }
        else{
            
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            selectedFlagArr.append(flagColour[indexPath.row])
            
        }
        
    }

}
    
extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
