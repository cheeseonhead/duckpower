//
//  File.swift
//  Duck-Power
//
//  Created by Cheese Onhead on 6/18/17.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import Foundation


//
// Created by Jeffrey Wu on 2017-05-11.
// Copyright (c) 2017 Cheeseonhead. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
}

enum HTTPStatusCode: Int {
    case clientError = -1
    case ok = 200
    case accepted = 202
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case tooManyRequests = 429
}

enum ApiErrorType {
    case unauthorized
    case unknownError
    case clientError
}

typealias ApiResultBlock = (_ statusCode: HTTPStatusCode, _ payload: [String: Any]?, _ error: Error?) -> Void

class ApiStore {
    var domainName: String {
        return "http://okaystudios.ca/"
    }
    
    func request(toUrl url: String, method: HTTPMethod, parameters: [String: String], completion: @escaping ApiResultBlock) {
        guard let fullURL = URL(string: domainName.appending(url)) else { return }
        
        let request = createRequest(fullURL: fullURL, method: method, parameters: parameters)
        
        send(request: request, completion: completion)
    }
    
    private func createRequest(fullURL: URL, method: HTTPMethod, parameters: [String: String]) -> URLRequest {
        var request = URLRequest(url: fullURL)
        request.httpMethod = method.rawValue
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpBody = parameters.stringFromHttpParameters().data(using: .utf8)
        
        return request
    }
    
    private func send(request: URLRequest, completion: @escaping ApiResultBlock) {
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse, let data = data else {
                completion(.clientError, nil, error)
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                completion(HTTPStatusCode(rawValue: httpResponse.statusCode)!, json, error)
            } catch _ {
                print("Error Occurred")
            }
        }
        
        task.resume()
    }
}
