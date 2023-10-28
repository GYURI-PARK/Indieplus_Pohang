//
//  FontsManager.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/10/23.
//

import Foundation
import SwiftUI

struct FontsManager {
    struct Pretendard {
        static let black = "Pretendard-Black"
        static let bold = "Pretendard-Bold"
        static let extraBold = "Pretendard-ExtraBold"
        static let extraLight = "Pretendard-ExtraLight"
        static let light = "Pretendard-Light"
        static let medium = "Pretendard-Medium"
        static let regular = "Pretendard-Regular"
        static let semiBold = "Pretendard-SemiBold"
        static let thin = "Pretendard-Thin"
    }
}

extension Font {
    static let display1 = Font.custom(FontsManager.Pretendard.semiBold, size: 20)
    static let display2 = Font.custom(FontsManager.Pretendard.semiBold, size: 24)
    static let display3 = Font.custom(FontsManager.Pretendard.semiBold, size: 28)
    static let display4 = Font.custom(FontsManager.Pretendard.semiBold, size: 32)
    
    static let subhead1 = Font.custom(FontsManager.Pretendard.semiBold, size: 13)
    static let subhead2_1 = Font.custom(FontsManager.Pretendard.semiBold, size: 16)
    static let subhead2_2 = Font.custom(FontsManager.Pretendard.medium, size: 16)
    static let subhead3_1 = Font.custom(FontsManager.Pretendard.extraBold, size: 18)
    static let subhead3_2 = Font.custom(FontsManager.Pretendard.medium, size: 18)
    
    static let body1 = Font.custom(FontsManager.Pretendard.regular, size: 16)
    static let body2 = Font.custom(FontsManager.Pretendard.medium, size: 16)
    static let body3 = Font.custom(FontsManager.Pretendard.medium, size: 17)
    static let body4 = Font.custom(FontsManager.Pretendard.regular, size: 24)
    
    static let caption1 = Font.custom(FontsManager.Pretendard.medium, size: 12)
    static let caption2 = Font.custom(FontsManager.Pretendard.medium, size: 14)
    
    static let calendar1 = Font.custom(FontsManager.Pretendard.bold, size: 20)
    static let calendar2 = Font.custom(FontsManager.Pretendard.bold, size: 15)
    
    static let modal_txt = Font.custom(FontsManager.Pretendard.bold, size: 18)
}
