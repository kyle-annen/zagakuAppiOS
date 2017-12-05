//
//  ZagakuServerRequest.swift
//  ZagakuAppiOS
//
//  Created by Kyle Annen on 12/4/17.
//  Copyright © 2017 Kyle Annen. All rights reserved.
//

import Foundation
import Alamofire

class ZagakuServerAPIClient {

    func getCalendarDates(
        baseURL: String,
        parameters: Dictionary<String, String>,
        completion: @escaping ([ZagakuDate]?) -> Void) {
        
        let requestString = self.getRequestURL(baseURL: baseURL, parameters: parameters)
        
        Alamofire.request(
            URL(string: requestString)!,
            method: .get,
            parameters: parameters)
        .validate()
        .responseJSON { (response) -> Void in
            guard response.result.isSuccess else {
                print("Error while fetching Zagaku Dates: \(response.result.error)")
                competion(nil)
                return
            }
            
            guard let dates = response.result.value as? [Any] else {
                print("Malformed data recieved from Zagaku endpoint.")
                completion(nil)
                return
            }
            
            let decoder = JSONDecoder()
            let zagakuDates = try decoder.decode([ZagakuDate].self, from: response.result.value)
            completion(dates)
        }
    }

    func getRequestURL(baseURL: String,
                       parameters: Dictionary<String, String>) -> String {
        let parametersString = self.getRequestParameters(parameters: parameters)
        return "\(baseURL)?\(parametersString)"
    }
    
    func getRequestParameters(parameters: Dictionary<String, String>) -> String {
        let paramStringArray = parameters.map({ (key, value) -> String in
            return "\(key)=\(value)"
        }).sorted()
        let paramString = paramStringArray.joined(separator: "&")
        return paramString
    }
}
