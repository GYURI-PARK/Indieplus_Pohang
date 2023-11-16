//
//  Constants.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/11/16.
//

import Foundation
import SwiftUI

struct Constants {
    
    static var bottomOffset: Double {
        switch UIScreen.main.bounds.size {
        case CGSize(width: 430, height: 932): // 14 Pro Max
            return 370.0
        case CGSize(width: 393, height: 852): // 14 Pro
            return 350.0
        case CGSize(width: 428, height: 926): // 14 Plus, 13 Pro Max, 12 Pro Max
            return 370.0
        case CGSize(width: 390, height: 844): // 14, 13 Pro, 13, 12 Pro, 12
            return 350.0
        case CGSize(width: 375, height: 667): // SE
            return 265.0
        case CGSize(width: 375, height: 812): // 13 Mini, 12 Mini, 11 Pro, XS
            return 330.0
        case CGSize(width: 375, height: 780): // 13 Mini, 12 Mini
            return 330.0
        case CGSize(width: 414, height: 896): // 11 Pro Max, 11, XS Max, XR
            return 365.0
        default:
            return 250.0
        }
    }
}
