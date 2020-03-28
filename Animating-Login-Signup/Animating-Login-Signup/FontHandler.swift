//
//  FontHandler.swift
//  Animating-Login-Signup
//
//  Created by Vasanth Rathnakumar on 2020-03-27.
//  Copyright © 2020 Vasanth Rathnakumar. All rights reserved.
//

import Foundation
import UIKit

struct FontHandler {
    
    static let h2h4LineSpacing: CGFloat = 0.925
    
    enum Style: Int {
        case h1 = 1
        case h2 = 2
        case h3 = 3
        case h4 = 4
        case h5 = 5
        case h6 = 6
        case Overline = 7
        case Subtitle1 = 8
        case Subtitle2 = 9
        case Body1 = 10
        case Body2 = 11
        
        var font: UIFont {
            switch self {
            case .h1:
                let font =  UIFont(name: FontName.NunitoSansRegular.fontName, size: Style.h1.size)
                return font!
            case .h2:
                let font =  UIFont(name: FontName.NunitoSansExtraBold.fontName, size: Style.h2.size)
                return font!
            case .h3:
                let font =  UIFont(name: FontName.NunitoSansBold.fontName, size: Style.h3.size)
                return font!
            case .h4:
                let font =  UIFont(name: FontName.NunitoSansBold.fontName, size: Style.h4.size)
                return font!
            case .h5:
                let font =  UIFont(name: FontName.NunitoSansSemiBold.fontName, size: Style.h5.size)
                return font!
            case .h6:
                let font =  UIFont(name: FontName.NunitoSansBold.fontName, size: Style.h6.size)
                return font!
            case .Overline:
                let font =  UIFont(name: FontName.NunitoSansBold.fontName, size: Style.Overline.size)
                return font!
            case .Subtitle1:
                let font =  UIFont(name: FontName.NunitoSansSemiBold.fontName, size: Style.Subtitle1.size)
                return font!
            case .Subtitle2:
                let font =  UIFont(name: FontName.NunitoSansSemiBold.fontName, size: Style.Subtitle2.size)
                return font!
            case .Body1:
                let font =  UIFont(name: FontName.NunitoSansRegular.fontName, size: Style.Body1.size)
                return font!
            case .Body2:
                let font =  UIFont(name: FontName.NunitoSansRegular.fontName, size: Style.Body2.size)
                return font!
            }
        }
        
        var textColor: UIColor {
            switch self {
            case .h1:
                return GiftieColor.text_dark_semi_strong.color
            case .h2:
                return GiftieColor.text_dark_semi_strong.color
            case .h3:
                return GiftieColor.text_dark.color
            case .h4:
                return GiftieColor.text_dark.color
            case .h5:
                return GiftieColor.text_dark.color
            case .h6:
                return GiftieColor.text_dark.color
            case .Overline:
                return GiftieColor.text_dark.color
            case .Subtitle1:
                return GiftieColor.text_dark.color
            case .Subtitle2:
                return GiftieColor.text_light.color
            case .Body1:
                return GiftieColor.text_dark_strong.color
            case .Body2:
                return GiftieColor.text_dark.color
            }
        }
        
        var size: CGFloat {
            switch self {
            case .h1:
                return 26.0
            case .h2:
                return 24.0
            case .h3:
                return 18.0
            case .h4:
                return 16.0
            case .h5:
                return 12.0
            case .h6:
                return 11.0
            case .Overline:
                return 10.0
            case .Subtitle1:
                return 14.0
            case .Subtitle2:
                return 12.0
            case .Body1:
                return 16.0
            case .Body2:
                return 14.0
            }
        }
    }
    
    enum GiftieColor: Int {
        case text_dark = 1
        case text_dark_strong = 2
        case text_dark_semi_strong = 3
        case text_dark_subtle = 4
        case text_light = 5
        case text_lighter = 6
        case white = 7
        case black = 8
        case giftie_blue = 9
        case rewards_background = 10
        case giftie_green = 11
        case giftie_gold = 12
        case levelCompleteBg = 13
        case error_State = 14
        
        var color: UIColor {
            switch self {
            case .text_dark:
                return Helper.hexStringToUIColor(hex: "#222222")
            case .text_dark_strong:
                return Helper.hexStringToUIColor(hex: "#141823")
            case .text_dark_semi_strong:
                return Helper.hexStringToUIColor(hex: "#222222")
            case .text_dark_subtle:
                return Helper.hexStringToUIColor(hex: "#555555")
            case .text_light:
                return Helper.hexStringToUIColor(hex: "#777777")
            case .text_lighter:
                return Helper.hexStringToUIColor(hex: "#999999")
            case .white:
                return .white
            case .black:
                return .black
            case .giftie_blue:
                return Helper.hexStringToUIColor(hex: "#0F85FB")
            case .rewards_background:
                return Helper.hexStringToUIColor(hex: "#F5F5F5")
            case .giftie_green:
                return Helper.hexStringToUIColor(hex: "#19d2ac")
            case .giftie_gold:
                return Helper.hexStringToUIColor(hex: "#F6A623")
            case .levelCompleteBg:
                return Helper.hexStringToUIColor(hex: "#DDDDDD")
            case .error_State:
                return Helper.hexStringToUIColor(hex: "#D32F2F")
            }
        }
    }
    
    enum FontName: Int {
        
        case NunitoSansBlack = 1
        case NunitoSansBlackItalic = 2
        case NunitoSansBold = 3
        case NunitoSansBoldItalic = 4
        case NunitoSansExtraBold = 5
        case NunitoSansExtraBoldItalic = 6
        case NunitoSansExtraLight = 7
        case NunitoSansExtraLightItalic = 8
        case NunitoSansItalic = 9
        case NunitoSansLight = 10
        case NunitoSansLightItalic = 11
        case NunitoSansRegular = 12
        case NunitoSansSemiBold = 13
        case NunitoSansSemiBoldItalic = 14
        
        var fontName: String {
            switch self {
            case .NunitoSansBlack:
                return "NunitoSans-Black"
            case .NunitoSansBlackItalic:
                return "NunitoSans-BlackItalic"
            case .NunitoSansBold:
                return "NunitoSans-Bold"
            case .NunitoSansBoldItalic:
                return "NunitoSans-BoldItalic"
            case .NunitoSansExtraBold:
                return "NunitoSans-ExtraBold"
            case .NunitoSansExtraBoldItalic:
                return "NunitoSans-ExtraBoldItalic"
            case .NunitoSansExtraLight:
                return "NunitoSans-ExtraLight"
            case .NunitoSansExtraLightItalic:
                return "NunitoSansExtraLightItalic"
            case .NunitoSansItalic:
                return "NunitoSans-Italic"
            case .NunitoSansLight:
                return "NunitoSans-Light"
            case .NunitoSansLightItalic:
                return "NunitoSans-LightItalic"
            case .NunitoSansRegular:
                return "NunitoSans-Regular"
            case .NunitoSansSemiBold:
                return "NunitoSans-SemiBold"
            case .NunitoSansSemiBoldItalic:
                return "NunitoSans-SemiBoldItalic"
            }
        }
    }
}
