//
//  ZagakuServerRequest.swift
//  ZagakuAppiOS
//
//  Created by Kyle Annen on 12/4/17.
//  Copyright © 2017 Kyle Annen. All rights reserved.
//

import Foundation

class ZagakuServerAPIClient {

    func fetchApiData(
        baseURL: String,
        parameters: Dictionary<String, String>,
        completion: @escaping ([ZagakuDate]) -> Void) {
       
        let urlString = self.getRequestURL(baseURL: baseURL, parameters: parameters)
        let url = URL(string: urlString)
        
        let urlSession = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate: self as? URLSessionDelegate,
            delegateQueue: nil)
        
        let task = urlSession.dataTask(with: url!) { (data, response, error) in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let deserializedResponse = try decoder.decode([ZagakuDate].self, from: data)
                    completion(deserializedResponse)
                } catch let error as NSError {
                    print(error)
                }
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getRequestURL(
        baseURL: String,
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
