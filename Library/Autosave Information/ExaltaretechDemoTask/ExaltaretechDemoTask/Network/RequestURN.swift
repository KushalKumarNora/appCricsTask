//
//  RequestURN.swift
//  MoviesFlixApp
//
//  Created by kushalkumar nora on 09/06/20.
//  Copyright © 2020 Demo. All rights reserved.
//

import Foundation
import Alamofire

protocol RequestURN {
    var url: String { get }
    var urn: String { get }
    var method: HTTPMethod { get }
    var isValid: Bool { get }
}

protocol PageRequestURN : RequestURN {
    var pageIndex: Int { get }
    var maxItemsPerPage: Int { get }
    var lastLoadedPageItemCount : Int { get }
    var shouldLoadMoreItems: Bool { get }
    var body: [String: AnyObject] { get }
}

class PageRequestURNModel: PageRequestURN {
    
    var body: [String : AnyObject] {
        return [:]
    }
    
    var maxItemsPerPage: Int {
       return 20
    }
 
    var pageIndex: Int = 0
    var lastLoadedPageItemCount: Int = -1
    
    var url: String {
        return ""
    }
    
    var urn: String {
        return ""
    }
    
    var shouldLoadMoreItems: Bool {
        if lastLoadedPageItemCount == 0 { return false }
        if lastLoadedPageItemCount == -1 { return true } // First time
        return maxItemsPerPage == lastLoadedPageItemCount
    }
}


extension RequestURN {
    
    var url: String {
        return ""
    }
    
    var urn: String {
        return ""
    }
    
  
    var isValid: Bool {
        return urn.isEmpty
    }
    var method: HTTPMethod {
        return HTTPMethod.post
    }
    
    var headers: [String: String] {
        return ["Authorization": ""]
    }
   
}
