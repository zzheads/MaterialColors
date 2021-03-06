//
//  MaterialColor.swift
//  MaterialColor
//
//  Created by Alexey Papin on 02.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation
import UIKit

let _white = "white"
let _black = "black"
let _red = "red"
let _pink = "pink"
let _purple = "purple"
let _deepPurple = "deep purple"
let _indigo = "indigo"
let _blue = "blue"
let _lightBlue = "light blue"
let _cyan = "cyan"
let _teal = "teal"
let _green = "green"
let _lightGreen = "light green"
let _lime = "lime"
let _yellow = "yellow"
let _amber = "amber"
let _orange = "orange"
let _deepOrange = "deep orange"
let _brown = "brown"
let _grey = "grey"
let _blueGrey = "blue grey"

enum MaterialColor {

    enum Tone: String {
        case _50 = "50"
        case _100 = "100"
        case _200 = "200"
        case _300 = "300"
        case _400 = "400"
        case _500 = "500"
        case _600 = "600"
        case _700 = "700"
        case _800 = "800"
        case _900 = "900"
        case A100 = "A100"
        case A200 = "A200"
        case A400 = "A400"
        case A700 = "A700"
        
        static let allTones: [Tone] = [._50, ._100, ._200, ._300, ._400, ._500, ._600, ._700, ._800, ._900, .A100, .A200, .A400, .A700]
        static let allTonesShort: [Tone] = [._50, ._100, ._200, ._300, ._400, ._500, ._600, ._700, ._800, ._900]
    }
    
    case white
    case black
    case red(tone: Tone)
    case pink(tone: Tone)
    case purple(tone: Tone)
    case deepPurple(tone: Tone)
    case indigo(tone: Tone)
    case blue(tone: Tone)
    case lightBlue(tone: Tone)
    case cyan(tone: Tone)
    case teal(tone: Tone)
    case green(tone: Tone)
    case lightGreen(tone: Tone)
    case lime(tone: Tone)
    case yellow(tone: Tone)
    case amber(tone: Tone)
    case orange(tone: Tone)
    case deepOrange(tone: Tone)
    case brown(tone: Tone)
    case grey(tone: Tone)
    case blueGrey(tone: Tone)
    
    static let rawValues = [_white, _black, _red, _pink, _purple, _deepPurple, _indigo, _blue, _lightBlue, _cyan, _teal, _green, _lightGreen, _lime, _yellow, _amber, _orange, _deepOrange, _brown, _grey, _blueGrey]
    
    init?(rawValue: String, tone: Tone = ._50) {
        switch rawValue {
        case _white: self = .white
        case _black: self = .black
        case _red: self = .red(tone: tone)
        case _pink: self = .pink(tone: tone)
        case _purple: self = .purple(tone: tone)
        case _deepPurple: self = .deepPurple(tone: tone)
        case _indigo: self = .indigo(tone: tone)
        case _blue: self = .blue(tone: tone)
        case _lightBlue: self = .lightBlue(tone: tone)
        case _cyan: self = .cyan(tone: tone)
        case _teal: self = .teal(tone: tone)
        case _green: self = .green(tone: tone)
        case _lightGreen: self = .lightGreen(tone: tone)
        case _lime: self = .lime(tone: tone)
        case _yellow: self = .yellow(tone: tone)
        case _amber: self = .amber(tone: tone)
        case _orange: self = .orange(tone: tone)
        case _deepOrange: self = .deepOrange(tone: tone)
        case _brown: self = .brown(tone: tone)
        case _grey: self = .grey(tone: tone)
        case _blueGrey: self = .blueGrey(tone: tone)
        default: return nil
        }
    }

    var rawValue: String {
        switch self {
        case .white: return _white
        case .black: return _black
        case .red: return _red
        case .pink: return _pink
        case .purple: return _purple
        case .deepPurple: return _deepPurple
        case .indigo: return _indigo
        case .blue: return _blue
        case .lightBlue: return _lightBlue
        case .cyan: return _cyan
        case .teal: return _teal
        case .green: return _green
        case .lightGreen: return _lightGreen
        case .lime: return _lime
        case .yellow: return _yellow
        case .amber: return _amber
        case .orange: return _orange
        case .deepOrange: return _deepOrange
        case .brown: return _brown
        case .grey: return _grey
        case .blueGrey: return _blueGrey
        }
    }
    
    var tone: Tone? {
        switch self {
        case .black, .white: return nil
        case .red(let tone), .pink(let tone), .purple(let tone), .deepPurple(let tone), .indigo(let tone), .blue(let tone), .lightBlue(let tone), .cyan(let tone), .teal(let tone), .green(let tone), .lightGreen(let tone), .lime(let tone), .yellow(let tone), .amber(let tone), .orange(let tone), .deepOrange(let tone), .brown(let tone), .grey(let tone), .blueGrey(let tone): return tone
        }
    }
    
    var allTones: [Tone] {
        switch self {
        case .black, .white: return [Tone._50]
        case .brown, .grey, .blueGrey: return Tone.allTonesShort
        default: return Tone.allTones
        }
    }
    
    var colorName: String {
        guard let tone = self.tone else {
            return self.rawValue.capitalized
        }
        return "\(self.rawValue.capitalized)(\(tone.rawValue))"
    }
    
    static var allColors: [MaterialColor] {
        var result = [MaterialColor]()
        for rawValue in rawValues {
            for tone in (MaterialColor(rawValue: rawValue)?.allTones)! {
                result.append(MaterialColor(rawValue: rawValue, tone: tone)!)
            }
        }
        return result
    }
    
    static func allTones(of rawValue: String) -> [MaterialColor] {
        var result = [MaterialColor]()
        for tone in (MaterialColor(rawValue: rawValue)?.allTones)! {
            result.append(MaterialColor(rawValue: rawValue, tone: tone)!)
        }
        return result
    }
    
    var color: UIColor {
        return UIColor(netHex: self.value)
    }
    
    var hexValue: String {
        return String(format: "%2X", self.value)
    }
    
    var isLight: Bool {
        switch self {
        case .black: return false
        case .white: return true
        case .red(let tone):
            switch tone {
            case ._50, ._100, ._200, ._300, .A100: return true
            default: return false
            }
        case .pink(let tone), .purple(let tone), .deepPurple(let tone), .indigo(let tone):
            switch tone {
            case ._50, ._100, ._200, .A100: return true
            default: return false
            }
        case .blue(let tone):
            switch tone {
            case ._50, ._100, ._200, ._300, ._400, .A100: return true
            default: return false
            }
        case .lightBlue(let tone):
            switch tone {
            case ._50, ._100, ._200, ._300, ._400, ._500, .A100, .A200, .A400: return true
            default: return false
            }
        case .cyan(let tone):
            switch tone {
            case ._700, ._800, ._900: return false
            default: return true
            }
        case .teal(let tone):
            switch tone {
            case ._50, ._100, ._200, ._300, ._400, .A100, .A200, .A400, .A700: return true
            default: return false
            }
        case .green(let tone):
            switch tone {
            case ._50, ._100, ._200, ._300, ._400, ._500, .A100, .A200, .A400, .A700: return true
            default: return false
            }
        case .lightGreen(let tone):
            switch tone {
            case ._50, ._100, ._200, ._300, ._400, ._500, ._600, .A100, .A200, .A400, .A700: return true
            default: return false
            }
        case .lime(let tone):
            switch tone {
            case ._900: return false
            default: return true
            }
        case .yellow(_), .amber(_):
            return true
        case .orange(let tone):
            switch tone {
            case ._800, ._900: return false
            default: return true
            }
        case .deepOrange(let tone):
            switch tone {
            case ._50, ._100, ._200, ._300, ._400, .A100, .A200: return true
            default: return false
            }
        case .brown(let tone):
            switch tone {
            case ._50, ._100, ._200: return true
            default: return false
            }
        case .grey(let tone):
            switch tone {
            case ._600, ._700, ._800, ._900: return false
            default: return true
            }
        case .blueGrey(let tone):
            switch tone {
            case ._50, ._100, ._200, ._300: return true
            default: return false
            }
        }
    }
    
    var value: Int {
        switch self {
        case .black: return 0x000000
        case .white: return 0xFFFFFF
        case .red(let tone):
            switch tone {
            case ._50: return 0xFFEBEE
            case ._100: return 0xFFCDD2
            case ._200: return 0xEF9A9A
            case ._300: return 0xE57373
            case ._400: return 0xEF5350
            case ._500: return 0xF44336
            case ._600: return 0xE53935
            case ._700: return 0xD32F2F
            case ._800: return 0xC62828
            case ._900: return 0xB71C1C
            case .A100: return 0xFF8A80
            case .A200: return 0xFF5252
            case .A400: return 0xFF1744
            case .A700: return 0xD50000
            }
        case .pink(let tone):
            switch tone {
            case ._50: return 0xFCE4EC
            case ._100: return 0xF8BBD0
            case ._200: return 0xF48FB1
            case ._300: return 0xF06292
            case ._400: return 0xEC407A
            case ._500: return 0xE91E63
            case ._600: return 0xD81B60
            case ._700: return 0xC2185B
            case ._800: return 0xAD1457
            case ._900: return 0x880E4F
            case .A100: return 0xFF80AB
            case .A200: return 0xFF4081
            case .A400: return 0xF50057
            case .A700: return 0xC51162
            }
        case .purple(let tone):
            switch tone {
            case ._50: return 0xF3E5F5
            case ._100: return 0xE1BEE7
            case ._200: return 0xCE93D8
            case ._300: return 0xBA68C8
            case ._400: return 0xAB47BC
            case ._500: return 0x9C27B0
            case ._600: return 0x8E24AA
            case ._700: return 0x7B1FA2
            case ._800: return 0x6A1B9A
            case ._900: return 0x4A148C
            case .A100: return 0xEA80FC
            case .A200: return 0xE040FB
            case .A400: return 0xD500F9
            case .A700: return 0xAA00FF
            }
        case .deepPurple(let tone):
            switch tone {
            case ._50: return 0xEDE7F6
            case ._100: return 0xD1C4E9
            case ._200: return 0xB39DDB
            case ._300: return 0x9575CD
            case ._400: return 0x7E57C2
            case ._500: return 0x673AB7
            case ._600: return 0x5E35B1
            case ._700: return 0x512DA8
            case ._800: return 0x4527A0
            case ._900: return 0x311B92
            case .A100: return 0xB388FF
            case .A200: return 0x7C4DFF
            case .A400: return 0x651FFF
            case .A700: return 0x6200EA
            }
        case .indigo(let tone):
            switch tone {
            case ._50: return 0xE8EAF6
            case ._100: return 0xC5CAE9
            case ._200: return 0x9FA8DA
            case ._300: return 0x7986CB
            case ._400: return 0x5C6BC0
            case ._500: return 0x3F51B5
            case ._600: return 0x3949AB
            case ._700: return 0x303F9F
            case ._800: return 0x283593
            case ._900: return 0x1A237E
            case .A100: return 0x8C9EFF
            case .A200: return 0x536DFE
            case .A400: return 0x3D5AFE
            case .A700: return 0x304FFE
            }
        case .blue(let tone):
            switch tone {
            case ._50: return 0xE3F2FD
            case ._100: return 0xBBDEFB
            case ._200: return 0x90CAF9
            case ._300: return 0x64B5F6
            case ._400: return 0x42A5F5
            case ._500: return 0x2196F3
            case ._600: return 0x1E88E5
            case ._700: return 0x1976D2
            case ._800: return 0x1565C0
            case ._900: return 0x0D47A1
            case .A100: return 0x82B1FF
            case .A200: return 0x448AFF
            case .A400: return 0x2979FF
            case .A700: return 0x2962FF
            }
        case .lightBlue(let tone):
            switch tone {
            case ._50: return 0xE1F5FE
            case ._100: return 0xB3E5FC
            case ._200: return 0x81D4FA
            case ._300: return 0x4FC3F7
            case ._400: return 0x29B6F6
            case ._500: return 0x03A9F4
            case ._600: return 0x039BE5
            case ._700: return 0x0288D1
            case ._800: return 0x0277BD
            case ._900: return 0x01579B
            case .A100: return 0x80D8FF
            case .A200: return 0x40C4FF
            case .A400: return 0x00B0FF
            case .A700: return 0x0091EA
            }
        case .cyan(let tone):
            switch tone {
            case ._50: return 0xE0F7FA
            case ._100: return 0xB2EBF2
            case ._200: return 0x80DEEA
            case ._300: return 0x4DD0E1
            case ._400: return 0x26C6DA
            case ._500: return 0x00BCD4
            case ._600: return 0x00ACC1
            case ._700: return 0x0097A7
            case ._800: return 0x00838F
            case ._900: return 0x006064
            case .A100: return 0x84FFFF
            case .A200: return 0x18FFFF
            case .A400: return 0x00E5FF
            case .A700: return 0x00B8D4
            }
        case .teal(let tone):
            switch tone {
            case ._50: return 0xE0F2F1
            case ._100: return 0xB2DFDB
            case ._200: return 0x80CBC4
            case ._300: return 0x4DB6AC
            case ._400: return 0x26A69A
            case ._500: return 0x009688
            case ._600: return 0x00897B
            case ._700: return 0x00796B
            case ._800: return 0x00695C
            case ._900: return 0x004D40
            case .A100: return 0xA7FFEB
            case .A200: return 0x64FFDA
            case .A400: return 0x1DE9B6
            case .A700: return 0x00BFA5
            }
        case .green(let tone):
            switch tone {
            case ._50: return 0xE8F5E9
            case ._100: return 0xC8E6C9
            case ._200: return 0xA5D6A7
            case ._300: return 0x81C784
            case ._400: return 0x66BB6A
            case ._500: return 0x4CAF50
            case ._600: return 0x43A047
            case ._700: return 0x388E3C
            case ._800: return 0x2E7D32
            case ._900: return 0x1B5E20
            case .A100: return 0xB9F6CA
            case .A200: return 0x69F0AE
            case .A400: return 0x00E676
            case .A700: return 0x00C853
            }
        case .lightGreen(let tone):
            switch tone {
            case ._50: return 0xF1F8E9
            case ._100: return 0xDCEDC8
            case ._200: return 0xC5E1A5
            case ._300: return 0xAED581
            case ._400: return 0x9CCC65
            case ._500: return 0x8BC34A
            case ._600: return 0x7CB342
            case ._700: return 0x689F38
            case ._800: return 0x558B2F
            case ._900: return 0x33691E
            case .A100: return 0xCCFF90
            case .A200: return 0xB2FF59
            case .A400: return 0x76FF03
            case .A700: return 0x64DD17
            }
        case .lime(let tone):
            switch tone {
            case ._50: return 0xF9FBE7
            case ._100: return 0xF0F4C3
            case ._200: return 0xE6EE9C
            case ._300: return 0xDCE775
            case ._400: return 0xD4E157
            case ._500: return 0xCDDC39
            case ._600: return 0xC0CA33
            case ._700: return 0xAFB42B
            case ._800: return 0x9E9D24
            case ._900: return 0x827717
            case .A100: return 0xF4FF81
            case .A200: return 0xEEFF41
            case .A400: return 0xC6FF00
            case .A700: return 0xAEEA00
            }
        case .yellow(let tone):
            switch tone {
            case ._50: return 0xFFFDE7
            case ._100: return 0xFFF9C4
            case ._200: return 0xFFF59D
            case ._300: return 0xFFF176
            case ._400: return 0xFFEE58
            case ._500: return 0xFFEB3B
            case ._600: return 0xFDD835
            case ._700: return 0xFBC02D
            case ._800: return 0xF9A825
            case ._900: return 0xF57F17
            case .A100: return 0xFFFF8D
            case .A200: return 0xFFFF00
            case .A400: return 0xFFEA00
            case .A700: return 0xFFD600
            }
        case .amber(let tone):
            switch tone {
            case ._50: return 0xFFF8E1
            case ._100: return 0xFFECB3
            case ._200: return 0xFFE082
            case ._300: return 0xFFD54F
            case ._400: return 0xFFCA28
            case ._500: return 0xFFC107
            case ._600: return 0xFFB300
            case ._700: return 0xFFA000
            case ._800: return 0xFF8F00
            case ._900: return 0xFF6F00
            case .A100: return 0xFFE57F
            case .A200: return 0xFFD740
            case .A400: return 0xFFC400
            case .A700: return 0xFFAB00
            }
        case .orange(let tone):
            switch tone {
            case ._50: return 0xFFF3E0
            case ._100: return 0xFFE0B2
            case ._200: return 0xFFCC80
            case ._300: return 0xFFB74D
            case ._400: return 0xFFA726
            case ._500: return 0xFF9800
            case ._600: return 0xFB8C00
            case ._700: return 0xF57C00
            case ._800: return 0xEF6C00
            case ._900: return 0xE65100
            case .A100: return 0xFFD180
            case .A200: return 0xFFAB40
            case .A400: return 0xFF9100
            case .A700: return 0xFF6D00
            }
        case .deepOrange(let tone):
            switch tone {
            case ._50: return 0xFBE9E7
            case ._100: return 0xFFCCBC
            case ._200: return 0xFFAB91
            case ._300: return 0xFF8A65
            case ._400: return 0xFF7043
            case ._500: return 0xFF5722
            case ._600: return 0xF4511E
            case ._700: return 0xE64A19
            case ._800: return 0xD84315
            case ._900: return 0xBF360C
            case .A100: return 0xFF9E80
            case .A200: return 0xFF6E40
            case .A400: return 0xFF3D00
            case .A700: return 0xDD2C00
            }
        case .brown(let tone):
            switch tone {
            case ._50: return 0xEFEBE9
            case ._100: return 0xD7CCC8
            case ._200: return 0xBCAAA4
            case ._300: return 0xA1887F
            case ._400: return 0x8D6E63
            case ._500: return 0x795548
            case ._600: return 0x6D4C41
            case ._700: return 0x5D4037
            case ._800: return 0x4E342E
            case ._900: return 0x3E2723
            case .A100, .A200, .A400, .A700: return 0x795548
            }
        case .grey(let tone):
            switch tone {
            case ._50: return 0xFAFAFA
            case ._100: return 0xF5F5F5
            case ._200: return 0xEEEEEE
            case ._300: return 0xE0E0E0
            case ._400: return 0xBDBDBD
            case ._500: return 0x9E9E9E
            case ._600: return 0x757575
            case ._700: return 0x616161
            case ._800: return 0x424242
            case ._900: return 0x212121
            case .A100, .A200, .A400, .A700: return 0x9E9E9E
            }
        case .blueGrey(let tone):
            switch tone {
            case ._50: return 0xECEFF1
            case ._100: return 0xCFD8DC
            case ._200: return 0xB0BEC5
            case ._300: return 0x90A4AE
            case ._400: return 0x78909C
            case ._500: return 0x607D8B
            case ._600: return 0x546E7A
            case ._700: return 0x455A64
            case ._800: return 0x37474F
            case ._900: return 0x263238
            case .A100, .A200, .A400, .A700: return 0x607D8B
            }
        }
    }
}
