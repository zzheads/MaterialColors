//
//  MaterialColor.swift
//  MaterialColor
//
//  Created by Alexey Papin on 02.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation
import UIKit

enum ColorTone: Int {
    case _50 = 50
    case _100 = 100
    case _200 = 200
    case _300 = 300
    case _400 = 400
    case _500 = 500
    case _600 = 600
    case _700 = 700
    case _800 = 800
    case _900 = 900
    case A100 = 1100
    case A200 = 1200
    case A400 = 1400
    case A700 = 1700
    
    static let allTones: [ColorTone] = [._50, ._100, ._200, ._300, ._400, ._500, ._600, ._700, ._800, ._900, .A100, .A200, .A400, .A700]
    
    var description: String {
        switch self {
        case ._50: return "50"
        case ._100: return "100"
        case ._200: return "200"
        case ._300: return "300"
        case ._400: return "400"
        case ._500: return "500"
        case ._600: return "600"
        case ._700: return "700"
        case ._800: return "800"
        case ._900: return "900"
        case .A100: return "A100"
        case .A200: return "A200"
        case .A400: return "A400"
        case .A700: return "A700"
        }
    }
}

protocol Toneable {
    static var _50: UIColor { get }
    static var _100: UIColor { get }
    static var _200: UIColor { get }
    static var _300: UIColor { get }
    static var _400: UIColor { get }
    static var _500: UIColor { get }
    static var _600: UIColor { get }
    static var _700: UIColor { get }
    static var _800: UIColor { get }
    static var _900: UIColor { get }
    static var A100: UIColor { get }
    static var A200: UIColor { get }
    static var A400: UIColor { get }
    static var A700: UIColor { get }
    
    static func colorTone(toneValue: Int) -> ColorTone
    static func tone(toneValue: Int) -> UIColor
    static func color(colorTone: ColorTone) -> UIColor
    
    static var allTones: [UIColor] { get }
    static var description: String { get }
}

extension Toneable {
    static func colorTone(toneValue: Int) -> ColorTone {
        guard let colorTone = ColorTone(rawValue: toneValue) else {
            return ._500
        }
        return colorTone
    }
    
    static func tone(toneValue: Int) -> UIColor {
        return color(colorTone: colorTone(toneValue: toneValue))
    }

    static func color(colorTone: ColorTone) -> UIColor {
        switch colorTone {
        case ._50: return _50
        case ._100: return _100
        case ._200: return _200
        case ._300: return _300
        case ._400: return _400
        case ._500: return _500
        case ._600: return _600
        case ._700: return _700
        case ._800: return _800
        case ._900: return _900
        case .A100: return A100
        case .A200: return A200
        case .A400: return A400
        case .A700: return A700
        }
    }
    
    static var allTones: [UIColor] {
        var result = [UIColor]()
        for tone in ColorTone.allTones {
            result.append(color(colorTone: tone))
        }
        return result
    }
    
    static var description: String {
        return "\(String(describing: Self.self).capitalized)"
    }
}

struct MaterialColor {
    static let white = UIColor(netHex: 0xFFFFFF)
    static let black = UIColor(netHex: 0x000000)
    
    enum Color {
        case red(tone: ColorTone)
        case pink(tone: ColorTone)
        case purple(tone: ColorTone)
        case deepPurple(tone: ColorTone)
        case indigo(tone: ColorTone)
        
        var color: UIColor {
            switch self {
            case .red(let tone):
                switch tone {
                    case
                }
            }
        }
    }
    
    struct red: Toneable {
        static let _50 = UIColor(netHex: 0xFFEBEE)
        static let _100 = UIColor(netHex: 0xFFCDD2)
        static let _200 = UIColor(netHex: 0xEF9A9A)
        static let _300 = UIColor(netHex: 0xE57373)
        static let _400 = UIColor(netHex: 0xEF5350)
        static let _500 = UIColor(netHex: 0xF44336)
        static let _600 = UIColor(netHex: 0xE53935)
        static let _700 = UIColor(netHex: 0xD32F2F)
        static let _800 = UIColor(netHex: 0xC62828)
        static let _900 = UIColor(netHex: 0xB71C1C)
        static let A100 = UIColor(netHex: 0xFF8A80)
        static let A200 = UIColor(netHex: 0xFF5252)
        static let A400 = UIColor(netHex: 0xFF1744)
        static let A700 = UIColor(netHex: 0xD50000)
    }
    
    struct pink: Toneable {
        static let _50 = UIColor(netHex: 0xFCE4EC)
        static let _100 = UIColor(netHex: 0xF8BBD0)
        static let _200 = UIColor(netHex: 0xF48FB1)
        static let _300 = UIColor(netHex: 0xF06292)
        static let _400 = UIColor(netHex: 0xEC407A)
        static let _500 = UIColor(netHex: 0xE91E63)
        static let _600 = UIColor(netHex: 0xD81B60)
        static let _700 = UIColor(netHex: 0xC2185B)
        static let _800 = UIColor(netHex: 0xAD1457)
        static let _900 = UIColor(netHex: 0x880E4F)
        static let A100 = UIColor(netHex: 0xFF80AB)
        static let A200 = UIColor(netHex: 0xFF4081)
        static let A400 = UIColor(netHex: 0xF50057)
        static let A700 = UIColor(netHex: 0xC51162)
    }
    
    struct purple: Toneable {
        static let _50 = UIColor(netHex: 0xF3E5F5)
        static let _100 = UIColor(netHex: 0xE1BEE7)
        static let _200 = UIColor(netHex: 0xCE93D8)
        static let _300 = UIColor(netHex: 0xBA68C8)
        static let _400 = UIColor(netHex: 0xAB47BC)
        static let _500 = UIColor(netHex: 0x9C27B0)
        static let _600 = UIColor(netHex: 0x8E24AA)
        static let _700 = UIColor(netHex: 0x7B1FA2)
        static let _800 = UIColor(netHex: 0x6A1B9A)
        static let _900 = UIColor(netHex: 0x4A148C)
        static let A100 = UIColor(netHex: 0xEA80FC)
        static let A200 = UIColor(netHex: 0xE040FB)
        static let A400 = UIColor(netHex: 0xD500F9)
        static let A700 = UIColor(netHex: 0xAA00FF)
    }

    struct deepPurple: Toneable {
        static let _50 = UIColor(netHex: 0xEDE7F6)
        static let _100 = UIColor(netHex: 0xD1C4E9)
        static let _200 = UIColor(netHex: 0xB39DDB)
        static let _300 = UIColor(netHex: 0x9575CD)
        static let _400 = UIColor(netHex: 0x7E57C2)
        static let _500 = UIColor(netHex: 0x673AB7)
        static let _600 = UIColor(netHex: 0x5E35B1)
        static let _700 = UIColor(netHex: 0x512DA8)
        static let _800 = UIColor(netHex: 0x4527A0)
        static let _900 = UIColor(netHex: 0x311B92)
        static let A100 = UIColor(netHex: 0xB388FF)
        static let A200 = UIColor(netHex: 0x7C4DFF)
        static let A400 = UIColor(netHex: 0x651FFF)
        static let A700 = UIColor(netHex: 0x6200EA)
    }

    struct indigo: Toneable {
        static let _50 = UIColor(netHex: 0xE8EAF6)
        static let _100 = UIColor(netHex: 0xC5CAE9)
        static let _200 = UIColor(netHex: 0x9FA8DA)
        static let _300 = UIColor(netHex: 0x7986CB)
        static let _400 = UIColor(netHex: 0x5C6BC0)
        static let _500 = UIColor(netHex: 0x3F51B5)
        static let _600 = UIColor(netHex: 0x3949AB)
        static let _700 = UIColor(netHex: 0x303F9F)
        static let _800 = UIColor(netHex: 0x283593)
        static let _900 = UIColor(netHex: 0x1A237E)
        static let A100 = UIColor(netHex: 0x8C9EFF)
        static let A200 = UIColor(netHex: 0x536DFE)
        static let A400 = UIColor(netHex: 0x3D5AFE)
        static let A700 = UIColor(netHex: 0x304FFE)
    }

}
