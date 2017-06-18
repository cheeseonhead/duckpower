//
//  DuckPowerStore.swift
//  Duck-Power
//
//  Created by Cheese Onhead on 6/18/17.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import Foundation

class DuckPowerStore {
    static let sharedInstance = DuckPowerStore()
    
    private let duckpowerKey = "DuckPower"
    private let userDefault = UserDefaults.standard
    
    func getDuckPower() -> Int {
        return userDefault.integer(forKey: duckpowerKey)
    }
}
