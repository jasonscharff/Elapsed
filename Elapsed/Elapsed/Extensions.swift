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
  
  public class func clockInColor() -> UIColor {
    return UIColor(red: 52, green: 152, blue: 219);
  }
  
  public class func clockOutColor() -> UIColor {
    return UIColor(red: 230, green: 126, blue: 34);
  }
  
  public class func shadeOfGray() -> UIColor {
       return UIColor(red: 74, green: 74, blue: 74);
  }
}
