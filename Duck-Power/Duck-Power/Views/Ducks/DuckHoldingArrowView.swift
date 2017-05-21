//
//  DuckHoldingArrowView.swift
//  Duck-Power
//
//  Created by Jeffrey Wu on 2017-05-21.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import Foundation
import UIKit

class DuckHoldingArrowView: AnimatedImageView
{
    override func didLoad()
    {
        series = [#imageLiteral(resourceName: "duck-holding-arrow1"), #imageLiteral(resourceName: "duck-holding-arrow2"), #imageLiteral(resourceName: "duck-holding-arrow3")]
        autoReverse = true
        animationDuration = 1
    }
}
