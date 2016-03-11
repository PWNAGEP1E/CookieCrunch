//
//  Swap.swift
//  Cookie Crunch
//
//  Created by jeremy on 3/9/16.
//  Copyright © 2016 Indicane. All rights reserved.
//

import Foundation

struct Swap: CustomStringConvertible, Hashable {
    let cookieA: Cookie
    let cookieB: Cookie
    var hashValue: Int {
        return cookieA.hashValue ^ cookieB.hashValue
    }
    init(cookieA: Cookie, cookieB: Cookie) {
        self.cookieA = cookieA
        self.cookieB = cookieB
    }
    
    var description: String {
        return "swap \(cookieA) with \(cookieB)"
    }
}

func ==(lhs: Swap, rhs: Swap) -> Bool {
    return (lhs.cookieA == rhs.cookieA && lhs.cookieB == rhs.cookieB) ||
        (lhs.cookieB == rhs.cookieA && lhs.cookieA == rhs.cookieB)
}