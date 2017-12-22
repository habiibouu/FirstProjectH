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
    static var imageDwarf = UIImageView(image: #imageLiteral(resourceName: "dwarf"))
    static var imageColossus = UIImageView(image: #imageLiteral(resourceName: "colossus"))
    static var imageWarrior = UIImageView(image: #imageLiteral(resourceName: "warrior"))
    static var imageMagus = UIImageView(image: #imageLiteral(resourceName: "magus"))
    
    static var redTeam = Team(heros: [], color: .red)
    static var blueTeam = Team(heros: [], color: .blue)
    static var numberTurn = 0
    //not used
//    static var heroChoice =  Hero(vitalPoint: 0, attack: 0, specialCapacity: 0, typeATK: true, typeHEAL: true, typeActionNormalAtk: true, typeActionSpeAtk: true)
    static var heroTarget = Hero(image: GameConstants.imageDwarf,vitalPoint: 0, baseAttack: 0, baseSpecialCapacity: 0, typeATK: true, typeHEAL: true, typeActionNormalAtk: true, typeActionSpeAtk: true)
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





