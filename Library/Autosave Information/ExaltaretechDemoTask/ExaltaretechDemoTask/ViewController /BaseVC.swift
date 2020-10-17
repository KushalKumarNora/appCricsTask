//
//  BaseVC.swift
//  ExaltaretechDemoTask
//
//  Created by kushalkumar nora on 17/10/20.
//  Copyright © 2020 Demo. All rights reserved.
//

import Foundation
import UIKit

class BaseVC: UIViewController {
    
    var alertVC: UIAlertController?
    
    
    func showAlert(_ title: String?,
                   message: String?,
                   defaultBtnTitle: String? = nil,
                   defaultAction: ((UIAlertAction) -> Void)? = nil,
                   destructiveBtnTitle: String? = nil,
                   destructiveAction: ((UIAlertAction) -> Void)? = nil) {
        
        let alertVC = UIAlertController.init(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let defaultTitle = defaultBtnTitle ?? "Ok"
        alertVC.addAction(UIAlertAction.init(title: defaultTitle, style: .cancel, handler: defaultAction))
        
        if let _ = destructiveAction {
            let destructiveTitle = destructiveBtnTitle ?? "Cancel"
            alertVC.addAction(UIAlertAction.init(title: destructiveTitle, style: .destructive, handler: destructiveAction))
        }
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
    class func vcFactory(_ SB: String, SBVC: String) -> UIViewController {
        return UIStoryboard(name: SB, bundle: nil).instantiateViewController(withIdentifier: SBVC)
    }
    
   
    
}
