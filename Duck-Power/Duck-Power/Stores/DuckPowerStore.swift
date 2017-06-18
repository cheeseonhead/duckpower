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
    private let endpoint = "api/duckpower/getduckpower"
    private let apiStore = ApiStore()
    
    required init() {
        getRatioFromServer()
    }
    
    func getDuckPower() -> Double {
        return userDefault.double(forKey: duckpowerKey)
    }
    
    func getRatioFromServer() {
        apiStore.request(toUrl: endpoint, method: .GET, parameters: [:]) { (statusCode, payload, error) in
            guard let array = payload as? Array<[String: Any]> else {
                return
            }
            
            guard let ratioString = array[0]["ratio"] as? String else {
                return
            }
            
            guard let ratio = Double(ratioString) else {
                return
            }
            
            self.userDefault.set(ratio, forKey: self.duckpowerKey)
        }
    }
}
