//
//  APICalls.swift
//  StatusOnGithub
//
//  Created by Thomas Prezioso on 5/26/19.
//  Copyright © 2019 Thomas Prezioso. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class APICall {
    let statusSummaryForGitHub = "https://kctbh9vrtdwd.statuspage.io/api/v2/summary.json"
    typealias WebServiceResponse = ([[String: Any]]?) -> Void

    func summaryStatus(completion: @escaping WebServiceResponse) {
        Alamofire.request(statusSummaryForGitHub, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                let statusData = response.result.value! as! [String: AnyObject]
                
                if let componentsData = statusData["components"] as? [[String : Any]] {
                    completion(componentsData)
                    print(componentsData[1]["name"]!)
                    print(componentsData[1]["status"]!)
                }
                
                
            }
        }

    }
   
    func pastIncidents(completion: @escaping WebServiceResponse) {
        Alamofire.request(statusSummaryForGitHub, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                let statusData = response.result.value! as! [String: AnyObject]
                print(statusData["incidents"]!)
                if let componentsData = statusData["incidents"] as? [[String : Any]] {
                    completion(componentsData)
//                    print(componentsData)
                }
                
                
            }
        }
        
    }

}
