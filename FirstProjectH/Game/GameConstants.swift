//
//  ClassGame.swift
//  EpicGame
//
//  Created by Habib Bouriche on 05/11/2017.
//  Copyright © 2017 Habib Bouriche. All rights reserved.
//
import UIKit
import Foundation

class GameConstants {
    static var imageDwarf = UIImage(named: "dwarf")
    static var imageColossus = UIImage(named: "colossus")
    static var imageWarrior = UIImage(named: "warrior")
    static var imageMagus = UIImage(named: "magus")
    
    static var redTeam = Team(heros: [], color: .red)
    static var blueTeam = Team(heros: [], color: .blue)
    static var numberTurn = 0

    
    static var actionNow = 0
    
    static var weaponList = [
        Weapon(pointAddAction: -10, typeAtk: true, name: "Escalibure"),
        Weapon(pointAddAction: -7, typeAtk: true, name: "Amulette du dragon"),
        Weapon(pointAddAction: -5, typeAtk: true, name: "Glaive de la foie"),
        Weapon(pointAddAction: -3, typeAtk: true, name: "Baton de puissance"),
        Weapon(pointAddAction: 15, typeAtk: false, name: "Fiole magic"),
        Weapon(pointAddAction: 8, typeAtk: false, name: "Armure de fer"),
        Weapon(pointAddAction: 5, typeAtk: false, name: "Manteau de la foie")]
}





