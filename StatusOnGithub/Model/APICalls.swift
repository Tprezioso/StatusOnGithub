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
    typealias WebServiceResponse = ([[String: String]]?) -> Void

    func summaryStatus() {
        Alamofire.request(statusSummaryForGitHub, method: .get).responseJSON { (response) in
            if response.result.isSuccess {
                let result = response.result.value!
                
                let thing = result as! [String: Any]
                print(thing["components"]!)
                
            }
        }

    }
    
}
