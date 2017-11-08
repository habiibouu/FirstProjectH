//Creation of class Hero
class Hero {
    var name: String = ""
    var vitalPoint: Int
    var specialPoint: Int = 0//faire en sorte que à chaque tour d'action la capacité spécial augmente de 20 et arriver a 100 on peut activer la special capacity
    var attack: Int//On devrait l'appeler action car selon le hero l'action sera d'enlever ou d'ajouter des pv, la spécificité sera indiquer sur les carte hero
    var specialCapacity: Int
    //faire une fonction ou autre determinant ensuite si la capacité enleverra des point a l'adversaire ds le cas des combattant ou soignera les allié ds le cas du mage
    //ou si elle peut paraliser un hero
    //var canMove : Bool
    var death : Bool = false
    var typeATK : Bool
    var typeHEAL: Bool
    
    var typeActionNormalAtk : Bool
    var typeActionSpeAtk : Bool
    
    var cptWeapon = 0
    
    init(vitalPoint: Int, attack: Int, specialCapacity: Int, typeATK: Bool, typeHEAL: Bool, typeActionNormalAtk: Bool, typeActionSpeAtk: Bool){
        self.vitalPoint = vitalPoint
        self.attack = attack
        self.specialCapacity = specialCapacity
        self.typeATK = typeATK
        self.typeHEAL = typeHEAL
        self.typeActionSpeAtk = typeActionSpeAtk
        self.typeActionNormalAtk = typeActionNormalAtk
    }
}

class Dwarf: Hero {
    init() {
        super.init(vitalPoint: 50, attack: -15, specialCapacity: +15, typeATK: true, typeHEAL: true, typeActionNormalAtk: true, typeActionSpeAtk: false )
        
    }
}

class Colossus: Hero {
    init() {
        super.init(vitalPoint: 200, attack: -5, specialCapacity: -5, typeATK: true, typeHEAL: false, typeActionNormalAtk: true, typeActionSpeAtk: true )
        
    }
}

class Magus: Hero {
    init() {
        super.init(vitalPoint: 150, attack: +20, specialCapacity: +40, typeATK: false, typeHEAL: true, typeActionNormalAtk: false, typeActionSpeAtk: false)
        
    }
}

class Warrior: Hero {
    init() {
        super.init(vitalPoint: 100, attack: -10, specialCapacity: -30, typeATK: true, typeHEAL: false, typeActionNormalAtk: true, typeActionSpeAtk: true)
    }
}

