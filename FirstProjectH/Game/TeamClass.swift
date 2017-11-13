//
//  TeamClass.swift
//  FirstProjectH
//
//  Created by Kevin Bravo on 13/11/2017.
//  Copyright © 2017 Kevin Bravo. All rights reserved.
//

import Foundation
import UIKit


enum Color {
    case red
    case blue
}

class Team {
    var heros: [Hero]
    var name = ""
    var hisTurn = Bool()
    var color: Color
    init(heros: [Hero], color: Color){
        self.heros = heros
        self.color = color
    }
}
