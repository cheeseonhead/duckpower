//
// Created by Jeffrey Wu on 2017-05-21.
// Copyright (c) 2017 okAy Studios. All rights reserved.
//

import Foundation
import UIKit

class DancingDuck: AnimatedImageView
{
    override func didLoad()
    {
        series = [#imageLiteral(resourceName: "duck1"), #imageLiteral(resourceName: "duck2"), #imageLiteral(resourceName: "duck3")]
        autoReverse = true
        animationDuration = 1
    }
}
