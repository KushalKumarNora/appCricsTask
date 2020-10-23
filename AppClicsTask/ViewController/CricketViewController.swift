//
//  CricketViewController.swift
//  AppClicsTask
//
//  Created by kushalkumar nora on 22/09/20.
//  Copyright © 2020 Demo. All rights reserved.
//



import UIKit


class CricketViewController: BaseVC{
    
    @IBOutlet weak var barBtn: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var name :String = ""
    let arrPlayer : [String] = ["Sachin Tendulkar","Virat Kolli", "Adam Gilchirst","Jacques Kallis"]
    let alphabet : [String] = ["A)","B)","C)","D)"]
    let arrPerson = [Person]()
    var selectedIndex:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        self.barBtn?.target = self.revealViewController()
        self.barBtn?.action  = #selector(SWRevealViewController.revealToggle(_:))
        
    }
    
    @IBAction func didSelectBarBtn(_ sender: Any) {
      
    }
    @IBAction func didSelectNext(_ sender: Any) {
        
        if selectedIndex == nil{
            self.showAlert("Alert", message: "Please Select Any One Of answer.")
        }else{
            let vc = BaseVC.vcFactory("Main", SBVC: "IndianFlagViewController") as! IndianFlagViewController
            vc.name = self.name
            vc.playerName = arrPlayer[selectedIndex!]
            
            if let topVCs = UIApplication.topViewController() {
                topVCs.navigationController?.pushViewController(vc, animated: false)
            }
        }
    }
    
}

extension CricketViewController: UITableViewDelegate, UITableViewDataSource {

 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrPlayer.count
 }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cricketCell = tableView.dequeueReusableCell(withIdentifier: "CricketCell") as? CricketCell else {
            return CricketCell()
        }
        cricketCell.nameLbl.text = "\(alphabet[indexPath.row]) \(arrPlayer[indexPath.row])"
        
        
        if(indexPath.row == selectedIndex)
        {
            cricketCell.accessoryType =  UITableViewCell.AccessoryType.checkmark
        }
        else
        {
            cricketCell.accessoryType =  UITableViewCell.AccessoryType.none
        }
        return cricketCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row;
        tableView.reloadData()
       
    }


}
