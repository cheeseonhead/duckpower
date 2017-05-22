//
//  DefinitionView.swift
//  Duck-Power
//
//  Created by Jeffrey Wu on 2017-05-21.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import Foundation
import UIKit

class DefinitionView: UIView
{
    
}

extension DefinitionView
{
    class func instanceFromNib() -> DefinitionView {
        return UINib(nibName: "DefinitionView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! DefinitionView
    }
}
