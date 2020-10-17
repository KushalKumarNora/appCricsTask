//
//  DogCeoManger.swift
//  ExaltaretechDemoTask
//
//  Created by kushalkumar nora on 17/10/20.
//  Copyright © 2020 Demo. All rights reserved.
//

import Foundation
import Foundation
class DogCeoManger: NSObject {
    static let sharedInstance = DogCeoManger()
    fileprivate override init() {} //This prevents others from using the default '()' initializer for this class.
    
    func callAPi(model: DogCeoModel, completionHandler: @escaping CompletionHandler) {
        APIManager.requestGET(model).responseJSON {
            (response) in
            
            switch response.response?.statusCode {
            case 200:
                if let jsonResponse = response.result.value {
                
                    completionHandler(true, jsonResponse as AnyObject)
                    return
                }else {
                    completionHandler(false, nil)
                    return
                }

            default:
                completionHandler(false, nil);
                return
            }
        }
        
    }
}
