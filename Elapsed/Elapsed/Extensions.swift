//
//  Extensions.swift
//  Elapsed
//
//  Created by Jason Scharff on 9/19/15.
//  Copyright © 2015 Jason Scharff. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
  convenience init (red: Int, green: Int, blue: Int) {
    let r = CGFloat(red)/255;
    let g = CGFloat(green)/255;
    let b = CGFloat(blue)/255;
    
    self.init(red: r, green: g, blue: b, alpha: 1.0)
  }
}
