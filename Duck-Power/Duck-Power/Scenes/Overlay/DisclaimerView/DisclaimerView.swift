//
//  DisclaimerView.swift
//  Duck-Power
//
//  Created by Jeffrey Wu on 2017-05-21.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import Foundation
import UIKit

class DisclaimerView: UIView
{
}

extension DisclaimerView
{
    class func instanceFromNib() -> DisclaimerView {
        return UINib(nibName: "DisclaimerView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DisclaimerView
    }
}
