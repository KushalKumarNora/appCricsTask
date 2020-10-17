//
//  Constant.swift
//  MoviesFlixApp
//
//  Created by kushalkumar nora on 09/06/20.
//  Copyright © 2020 Demo. All rights reserved.
//

import Foundation

typealias CompletionJSONResponseHandler = (_ success: Bool, [String: AnyObject]?) -> Void
typealias CompletionHandler = (_ success: Bool, AnyObject?) -> Void
typealias PaginationCompletionHandler = (_ success: Bool, _ fetchedItemCount:Int, AnyObject?) -> Void

struct StoryBoardConst {
    
     static let mainSB = "Main";
    static let paginationViewController = "PaginationViewController"
    static let detailViewController = "DetailViewController"
    static let viewController = "ViewController"
   
    
}
