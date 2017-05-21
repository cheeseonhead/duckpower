//
//  AnimationImage.swift
//  Duck-Power
//
//  Created by Jeffrey Wu on 2017-05-21.
//  Copyright © 2017 okAy Studios. All rights reserved.
//

import UIKit
import Foundation

class AnimatedImageView: UIImageView
{
    var series: [UIImage] = []
    var interval: Double = 0.5
    
    fileprivate var currentIndex = 0
    
    func add(image: UIImage)
    {
        series.append(image)
    }
    
    func animate()
    {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat], animations: { 
            self.advanceImage()
        }, completion: nil)
    }
    
    func stopAnimate()
    {
        layer.removeAllAnimations()
    }
    
    func advanceImage()
    {
        let newIndex = (currentIndex + 1) % series.count
        
        image = series[newIndex]
    }
}
