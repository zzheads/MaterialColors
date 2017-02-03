//
//  Color.swift
//  MatColor
//
//  Created by Alexey Papin on 03.02.17.
//  Copyright © 2017 zzheads. All rights reserved.
//

import Foundation
import UIKit

class Tone {
    let title: String
    let name: String
    var color: UIColor
    let isLight: Bool
    
    var hexValue: String {
        let components = color.components
        // NSString *hexString=[NSString stringWithFormat:@"%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
        return String(format: "%02X%02X%02X", UInt(components.red*255), UInt(components.green*255), UInt(components.blue*255))
    }
    
    init(title: String, name: String, color: UIColor, isLight: Bool) {
        self.title = title
        self.name = name
        self.color = color
        self.isLight = isLight
    }
}

class Color {
    let title: String
    var tones: [Tone]
    
    init(title: String) {
        self.title = title
        self.tones = []
        for tone in MaterialColor.allTones(of: title) {
            self.tones.append(Tone(title: title, name: tone.colorName, color: tone.color, isLight: tone.isLight))
        }
    }
}

extension Array where Element: Color {
    init(titles: [String]) {
        self.init()
        for title in titles {
            let color = Color(title: title)
            self.append(color as! Element)
        }
    }
}
