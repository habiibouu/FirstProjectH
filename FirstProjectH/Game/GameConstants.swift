//
//  ClassGame.swift
//  EpicGame
//
//  Created by Habib Bouriche on 05/11/2017.
//  Copyright © 2017 Habib Bouriche. All rights reserved.
//

import Foundation

class GameConstants {
    static var redTeam = Team(heros: [], color: .red)
    static var blueTeam = Team(heros: [], color: .blue)
    static var numberTurn = 0
    static var heroChoice =  Hero(vitalPoint: 0, attack: 0, specialCapacity: 0, typeATK: true, typeHEAL: true, typeActionNormalAtk: true, typeActionSpeAtk: true)
    static var heroTarget = Hero(vitalPoint: 0, attack: 0, specialCapacity: 0, typeATK: true, typeHEAL: true, typeActionNormalAtk: true, typeActionSpeAtk: true)
    static var actionNow = 0
}





