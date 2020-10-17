//
//  DogCeoModel.swift
//  ExaltaretechDemoTask
//
//  Created by kushalkumar nora on 17/10/20.
//  Copyright © 2020 Demo. All rights reserved.
//

import Foundation

struct DogCeoModel {
    
    var url: String {
     return "https://dog.ceo/api/breeds/image/random"
    }
}

extension DogCeoModel:RequestURN{
    
}



struct DogCeoModelRes {
    var message:String?
    var name:String?
    var description:String?
    

    
}
