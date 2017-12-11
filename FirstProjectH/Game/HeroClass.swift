//Creation of class Hero

class Hero {
    var name: String = ""
    var vitalPoint: Int
    var specialPoint: Int = 0//faire en sorte que à chaque tour d'action la capacité spécial augmente de 20 et arriver a 100 on peut activer la special capacity
    var baseAttack: Int //On devrait l'appeler action car selon le hero l'action sera d'enlever ou d'ajouter des pv, la spécificité sera indiquer sur les carte hero
    var baseSpecialCapacity: Int
    var attack: Int {
        get {
            // identique à == true
            if weapon.typeAtk {
                return baseAttack + weapon.pointAddAction
            }
            // pas besoin de else car on sort de la fonction avant
            return baseAttack
        }
    }
    var specialCapacity: Int {
        get {
            // identique à == false
            if !(weapon.typeAtk) {
                return baseSpecialCapacity + weapon.pointAddAction
            }
            // pas besoin de else car on sort de la fonction avant
            return baseSpecialCapacity
        }
    }
    //faire une fonction ou autre determinant ensuite si la capacité enleverra des point a l'adversaire ds le cas des combattant ou soignera les allié ds le cas du mage
    //ou si elle peut paraliser un hero
    //var canMove : Bool
    var death : Bool = false
    var typeATK : Bool
    var typeHEAL: Bool
    var cptChest = 0
    
    var typeActionNormalAtk : Bool
    var typeActionSpeAtk : Bool
    
    var cptWeapon = 0
    var weapon = Weapon(pointAddAction: 0, typeAtk: true, name: "")
    init(vitalPoint: Int, baseAttack: Int, baseSpecialCapacity: Int, typeATK: Bool, typeHEAL: Bool, typeActionNormalAtk: Bool, typeActionSpeAtk: Bool){
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
        super.init(vitalPoint: 50, baseAttack: -15, baseSpecialCapacity: +15, typeATK: true, typeHEAL: true, typeActionNormalAtk: true, typeActionSpeAtk: false )
        
    }
}

class Colossus: Hero {
    init() {
        super.init(vitalPoint: 200, baseAttack: -10, baseSpecialCapacity: -5, typeATK: true, typeHEAL: false, typeActionNormalAtk: true, typeActionSpeAtk: true )
        
    }
}

class Magus: Hero {
    init() {
        super.init(vitalPoint: 150, baseAttack: +20, baseSpecialCapacity: +40, typeATK: false, typeHEAL: true, typeActionNormalAtk: false, typeActionSpeAtk: false)
        
    }
}

class Warrior: Hero {
    init() {
        super.init(vitalPoint: 100, baseAttack: -10, baseSpecialCapacity: -30, typeATK: true, typeHEAL: false, typeActionNormalAtk: true, typeActionSpeAtk: true)
    }
}

