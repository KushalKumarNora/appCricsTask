//
//  HistoryViewController.swift
//  AppClicsTask
//
//  Created by kushalkumar nora on 22/09/20.
//  Copyright © 2020 Demo. All rights reserved.
//


import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var person = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let inQNib = UINib(nibName: "HistoryCell", bundle: nil)
        self.tableView.register(inQNib, forCellReuseIdentifier: "HistoryCell")
        
        
        self.person = coreDataModel.shareInstance.getDataCore().reversed()
        self.tableView.reloadData()
        
        
    }
    
    @IBAction func didSelectExit(_ sender: Any) {
        
        let vc = BaseVC.vcFactory("Main", SBVC: "ViewController") as! ViewController
        
        if let topVCs = UIApplication.topViewController() {
            topVCs.navigationController?.pushViewController(vc, animated: false)
        }
        
    }
    
}
extension HistoryViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return person.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let historyCell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell") as? HistoryCell else {
            return HistoryCell()
        }
        historyCell.nameLbl.text = "Name : \( person[indexPath.row].name ?? "")"
        historyCell.answer1Lbl.text = "Answer : \(person[indexPath.row].favCricketr ?? "")"
        historyCell.answer2Lbl.text = "Answer : \( person[indexPath.row].flagColour ?? "")"
        historyCell.timeLbl.text = "GAME 1 : \(person[indexPath.row].date!)"
        
        return historyCell
        
    }
    
}

