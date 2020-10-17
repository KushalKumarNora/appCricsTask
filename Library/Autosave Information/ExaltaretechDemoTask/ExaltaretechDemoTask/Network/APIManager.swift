//
//  APIManager.swift
//  MoviesFlixApp
//
//  Created by kushalkumar nora on 09/06/20.
//  Copyright © 2020 Demo. All rights reserved.
//

import Foundation
import Alamofire

private var networkReachabilityManager = NetworkReachabilityManager()!

class APIManager: SessionManager {
    let baseUrl: URL = URL(string: APIConst.baseURL)!
    
    static let defaultInstance: APIManager = {
        networkReachabilityManager.startListening()
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = APIManager.defaultHTTPHeaders
        let manager = APIManager(configuration: configuration)
        manager.addObservers()
        return manager
    }()
    
    static let defaultInstanceBackGround: APIManager = {
        networkReachabilityManager.startListening()
        let configuration = URLSessionConfiguration.background(withIdentifier: "com.TLS.app.background")
        configuration.urlCache = nil
        let manager = APIManager(configuration: configuration)
        manager.addObservers()
        return manager
    }()
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(appDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(appWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    func requestImagePostWithHeader(_ requestURN: RequestURN, jsonBody : [String: String]!,header: [String:String]) -> DataRequest {
        let url = retrieveURL(requestURN)
        print("request URL :",url!);
        assert(url != nil, "url is nil, fix it!")
        return request(url!, method: .post, parameters: jsonBody!, encoding: JSONEncoding.default, headers: header)
        
    }
    
    func requestPOST(_ requestURN: RequestURN, jsonBody : [String: Any]) -> DataRequest {
        let url = retrieveURL(requestURN)
        print("request URL :",url!);
        print("request Body :",jsonBody);
        assert(url != nil, "url is nil, fix it!")
        return request(url!, method: .post, parameters: jsonBody, encoding: URLEncoding.default, headers: nil)
    }
    func requestPOSTWithJsonObject(_ requestURN: RequestURN, jsonBody : [String: Any]) -> DataRequest {
        let url = retrieveURL(requestURN)
        print("request URL :",url!);
        assert(url != nil, "url is nil, fix it!")
        return request(url!, method: .post, parameters: jsonBody, encoding: JSONEncoding.default, headers: nil)
    }
    func requestPUT(_ requestURN: RequestURN, jsonBody : [String: Any]) -> DataRequest {
        let url = retrieveURL(requestURN)
        print("request URL :",url!);
        assert(url != nil, "url is nil, fix it!")
        return request(url!, method: .put, parameters: jsonBody, encoding: JSONEncoding.default, headers: nil)
    }
    
    func requestGET(_ requestURN: RequestURN) -> DataRequest {
        let url = retrieveURL(requestURN)
        print("request URL :",url!);
        assert(url != nil, "url is nil, fix it!")
        print("Header : \(requestURN.headers)")
        return request(url!, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
    }
    
    func requestDelete(_ requestURN: RequestURN) -> DataRequest {
        let url = retrieveURL(requestURN)
        print("request URL :",url!);
        assert(url != nil, "url is nil, fix it!")
        print("Header : \(requestURN.headers)")
        return request(url!, method: .delete, parameters: nil, encoding: URLEncoding.default, headers: nil)
    }
    
    func requestPOSTWithHeader(_ requestURN: RequestURN, jsonBody : [String: AnyObject]!,header: [String:String]) -> DataRequest {
        let url = retrieveURL(requestURN)
        print("request URL :",url!);
        assert(url != nil, "url is nil, fix it!")
        let dict = jsonBody
        
        return request(url!, method: .post, parameters: dict!, encoding: JSONEncoding.default, headers: header)
    }
    
    func headRequest(_ requestURN: RequestURN) -> DataRequest {
        let url = retrieveURL(requestURN)
        print("headRequest URL :",url!);
        assert(url != nil, "head url is nil, fix it!")
        return request(url!, method: HTTPMethod.head, parameters: nil, encoding: URLEncoding.default, headers: nil)
    }
    
    
    func retrieveURL(_ requestURN: RequestURN) -> URL? {
        var url: URL?
        if requestURN.url.isEmpty {
            url = baseUrl.appendingPathComponent(requestURN.urn)
        }else {
            let urlString :String = requestURN.url.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
            url = URL(string: urlString)
        }
        print(url!)
        return url
    }
    
    @objc func appDidEnterBackground() {
        // networkReachabilityManager.stopListening()
        print("App enterd background ")
        // TODO BACKGROUND APP
        
    }
    
    @objc func appWillEnterForeground() {
        networkReachabilityManager.startListening()
    }
}

extension APIManager {
    
    class func requestPOSTWithJsonObject(_ requestURN: RequestURN,bodyData: [String: Any]) -> DataRequest {
        return APIManager.defaultInstance.requestPOSTWithJsonObject(requestURN, jsonBody: bodyData)
    }
    
    class func requestPUT(_ requestURN: RequestURN,bodyData: [String: Any]) -> DataRequest {
        return APIManager.defaultInstance.requestPUT(requestURN, jsonBody: bodyData)
    }
    
    class func requestDELETE(_ requestURN: RequestURN) -> DataRequest {
        return APIManager.defaultInstance.requestDelete(requestURN)
    }
    
    class func requestPOST(_ requestURN: RequestURN,bodyData: [String: Any]) -> DataRequest {
        return APIManager.defaultInstance.requestPOST(requestURN, jsonBody: bodyData)
    }
    
    class func requestGET(_ requestURN: RequestURN) -> DataRequest {
        return APIManager.defaultInstance.requestGET(requestURN)
    }
    
    class func headRequest(_ requestURN: RequestURN) -> DataRequest {
        return APIManager.defaultInstance.headRequest(requestURN)
    }
    
    class func requestPostWithHeader(_ requestURN: RequestURN, body:[String: AnyObject]) -> DataRequest {
        return APIManager.defaultInstance.requestPOSTWithHeader(requestURN, jsonBody: body, header: requestURN.headers)
    }
    
    class func requestImagePostWithHeader(_ requestURN: RequestURN, body:[String: String]) -> DataRequest {
        return APIManager.defaultInstance.requestImagePostWithHeader(requestURN, jsonBody: body, header: requestURN.headers)
    }
    
    class var isReachable: Bool {
        return networkReachabilityManager.isReachable
    }
}
