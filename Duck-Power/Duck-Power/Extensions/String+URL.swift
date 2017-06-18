//
//  String+URL.swift
//  Duck-Power
//
//  Created by Cheese Onhead on 6/18/17.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import Foundation

extension String {
    func addingPercentEncodingForURLQueryValue() -> String? {
        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    }
}
