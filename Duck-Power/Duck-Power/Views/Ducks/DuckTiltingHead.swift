//
//  DuckTiltingHead.swift
//  Duck-Power
//
//  Created by Jeffrey Wu on 2017-05-21.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import Foundation

class DuckTiltingHead: AnimatedImageView
{
    override func didLoad()
    {
        series = [#imageLiteral(resourceName: "duck-tilting-head1"), #imageLiteral(resourceName: "duck-tilting-head2"), #imageLiteral(resourceName: "duck-tilting-head3"), #imageLiteral(resourceName: "duck-tilting-head4"), #imageLiteral(resourceName: "duck-tilting-head5")]
        autoReverse = true
        animationDuration = 1
    }
}
