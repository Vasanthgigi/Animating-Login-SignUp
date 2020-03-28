//
//  CustomLabel.swift
//  Animating-Login-Signup
//
//  Created by Vasanth Rathnakumar on 2020-03-27.
//  Copyright © 2020 Vasanth Rathnakumar. All rights reserved.
//
import Foundation
import UIKit

@IBDesignable class CustomLabel: UILabel {
    
    @IBInspectable var style: Int = 0 {
        didSet {
            if oldValue != style {
                if self.color == 0 && self.fontValue == 0 && self.size == 0 {
                    self.font = FontHandler.Style(rawValue: style)?.font ?? FontHandler.Style.h6.font
                    self.textColor = FontHandler.Style(rawValue: style)?.textColor ?? FontHandler.Style.h6.textColor
                    self.setNeedsDisplay()
                } else if self.color > 0 {
                    self.font = FontHandler.Style(rawValue: style)?.font ?? FontHandler.Style.h6.font
                    self.setNeedsDisplay()
                } else if self.size > 0 {
                    let font = FontHandler.Style(rawValue: style)?.font ?? FontHandler.Style.h6.font
                    self.font = font.withSize(self.size)
                    self.setNeedsDisplay()
                }
            }
        }
    }
    
    @IBInspectable var fontValue: Int = 0 {
        didSet {
            if oldValue != fontValue {
                self.font = UIFont(name: FontHandler.FontName(rawValue: fontValue)?.fontName ?? FontHandler.FontName.NunitoSansRegular.fontName, size: size)
                self.setNeedsDisplay()
            }
        }
    }
    
    @IBInspectable var size: CGFloat = 0 {
        didSet {
            if oldValue != size {
                self.font = font.withSize(size)
                self.setNeedsDisplay()
            }
        }
    }
    
    @IBInspectable var color: Int = 0 {
        didSet {
            if oldValue != color {
                self.textColor = FontHandler.GiftieColor(rawValue: color)?.color ?? FontHandler.GiftieColor.text_dark.color
                self.setNeedsDisplay()
            }
        }
    }
}
