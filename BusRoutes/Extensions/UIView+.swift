//
//  UIView+.swift
//  BusRoutes
//
//  Created by Ken Yu on 12/30/17.
//  Copyright © 2017 Ken. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    /**
     Adds given views as subviews to this UIView
     */
    public func addSubviews(_ newSubviews: [UIView]) {
        newSubviews.forEach { self.addSubview($0) }
    }
    
    /**
     Setter and getter for origin.x value of view's frame
     */
    public var left: CGFloat {
        get {
            return frame.minX
        }
        set {
            frame = frame.offsetBy(dx: newValue - frame.minX, dy: 0)
        }
    }
    
    /**
     Setter and getter for origin.x + size.width value of view's frame
     It does not change the width
     */
    public var right: CGFloat {
        get {
            return frame.maxX
        }
        set {
            left = newValue - frame.width
        }
    }
    
    /**
     Setter and getter for origin.y value of view's frame
     */
    public var top: CGFloat {
        get {
            return frame.minY
        }
        set {
            frame = frame.offsetBy(dx: 0, dy: newValue - frame.minY)
        }
    }
    
    /**
     Setter and getter for origin.y + size.height value of view's frame
     It does not change the height
     */
    public var bottom: CGFloat {
        get {
            return frame.maxY
        }
        set {
            top = newValue - frame.height
        }
    }
    
    /**
     Setter and getter for size.width value of view's frame
     Does not change left value but automatically changes right value
     */
    public var width: CGFloat {
        get {
            return frame.width
        }
        set {
            if width != newValue {
                frame.size.width = newValue
            }
        }
    }
    
    /**
     Setter and getter for size.height value of view's frame
     Does not change top value but automatically changes bottom value
     */
    public var height: CGFloat {
        get {
            return frame.height
        }
        set {
            if height != newValue {
                frame.size.height = newValue
            }
        }
    }
    
    /**
     Setter and getter for size of the view's frame
     */
    public var size: CGSize {
        get {
            return frame.size
        }
        set {
            width = newValue.width
            height = newValue.height
        }
    }
}
