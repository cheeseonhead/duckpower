//
//  Dictionary+Codable.swift
//  Duck-Power
//
//  Created by Cheese Onhead on 6/18/17.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import Foundation

extension Dictionary {
    func stringFromHttpParameters() -> String
    {
        let parameterArray = self.map
        { (arg) -> String in
            let (key, value) = arg
            let percentEscapedKey = (key as! String).addingPercentEncodingForURLQueryValue()!
            let percentEscapedValue = (value as! String).addingPercentEncodingForURLQueryValue()!
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
        
        return parameterArray.joined(separator: "&")
    }
}
