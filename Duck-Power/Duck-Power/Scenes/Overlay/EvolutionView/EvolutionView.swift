//
//  EvolutionView.swift
//  Duck-Power
//
//  Created by Jeffrey Wu on 2017-05-21.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import Foundation
import UIKit

class EvolutionView: UIView {
    
}

extension EvolutionView
{
    class func instanceFromNib() -> EvolutionView {
        return UINib(nibName: "EvolutionView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! EvolutionView
    }
}
