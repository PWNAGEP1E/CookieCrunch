//
//  Cookie.swift
//  Cookie Crunch
//
//  Created by jeremy on 3/3/16.
//  Copyright © 2016 Indicane. All rights reserved.
//

import SpriteKit

enum CookieType: Int, CustomStringConvertible {
    case Unknown = 0, Croissant, Cupcake, Danish, Donut, Macaroon, SugarCookie
    static func random() -> CookieType {
        return CookieType(rawValue: Int(arc4random_uniform(6)) + 1)!
    }
    var description: String {
        return spriteName
    }
    var spriteName: String {
        let spriteNames = [
            "Croissant",
            "Cupcake",
            "Danish",
            "Donut",
            "Macaroon",
            "SugarCookie"]
        
        return spriteNames[rawValue - 1]
        
    }
    
    var highlightedSpriteName: String {
        return spriteName + "-Highlighted"
    }
}

class Cookie: CustomStringConvertible, Hashable {
    var hashValue: Int {
        return row*10 + column
    }
    var description: String {
        return "type:\(cookieType) square:(\(column),\(row))"
    }
    var column: Int
    var row: Int
    let cookieType: CookieType
    var sprite: SKSpriteNode?
    
    init(column: Int, row: Int, cookieType: CookieType) {
        self.column = column
        self.row = row
        self.cookieType = cookieType
    }
}
func ==(lhs: Cookie, rhs: Cookie) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row
}