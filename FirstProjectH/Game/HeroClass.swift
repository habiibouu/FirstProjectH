//Creation of class Hero
import UIKit

class Hero {
    var name: String = ""
    var vitalPoint: Int
    var baseAttack: Int
    var baseSpecialCapacity: Int
    var attack: Int {
        get {
            // same as == true
            if weapon.typeAtk {
                return baseAttack + weapon.pointAddAction
            }
            // no need else because we get out before
            return baseAttack
        }
    }
    var specialCapacity: Int {
        get {
            // same as == false
            if !(weapon.typeAtk) {
                return baseSpecialCapacity + weapon.pointAddAction
            }
            return baseSpecialCapacity
        }
    }
    var specialAttackCounter = 0
 
    var death : Bool = false
    var typeATK : Bool
    var typeHEAL: Bool
    var cptChest = 0
    
    var typeActionNormalAtk : Bool
    var typeActionSpeAtk : Bool
    var image: UIImageView
    var cptWeapon = 0
    var weapon = Weapon(pointAddAction: 0, typeAtk: true, name: "")
    init(image: UIImageView ,vitalPoint: Int, baseAttack: Int, baseSpecialCapacity: Int, typeATK: Bool, typeHEAL: Bool, typeActionNormalAtk: Bool, typeActionSpeAtk: Bool){
        self.image = image
        self.vitalPoint = vitalPoint
        self.baseAttack = baseAttack
        self.baseSpecialCapacity = baseSpecialCapacity
        self.typeATK = typeATK
        self.typeHEAL = typeHEAL
        self.typeActionSpeAtk = typeActionSpeAtk
        self.typeActionNormalAtk = typeActionNormalAtk
    }
}

class Dwarf: Hero {
    init() {
        super.init(image: GameConstants.imageDwarf,vitalPoint: 50, baseAttack: -200, baseSpecialCapacity: +15, typeATK: true, typeHEAL: true, typeActionNormalAtk: true, typeActionSpeAtk: false )
        
    }
}

class Colossus: Hero {
    init() {
        super.init(image: GameConstants.imageColossus ,vitalPoint: 200, baseAttack: -1000, baseSpecialCapacity: -5, typeATK: true, typeHEAL: false, typeActionNormalAtk: true, typeActionSpeAtk: true )
        
    }
}

class Magus: Hero {
    init() {
        super.init(image: GameConstants.imageMagus ,vitalPoint: 150, baseAttack: +20, baseSpecialCapacity: +40, typeATK: false, typeHEAL: true, typeActionNormalAtk: false, typeActionSpeAtk: false)
        
    }
}

class Warrior: Hero {
    init() {
        super.init(image: GameConstants.imageWarrior ,vitalPoint: 100, baseAttack: -1000, baseSpecialCapacity: -30, typeATK: true, typeHEAL: false, typeActionNormalAtk: true, typeActionSpeAtk: true)
    }
}

