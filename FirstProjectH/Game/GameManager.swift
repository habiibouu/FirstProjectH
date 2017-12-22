//Creation of class Teams

class Weapon {
    var pointAddAction: Int
    var name : String
    var typeAtk : Bool // if it's fals it's type heal
    init(pointAddAction: Int, typeAtk: Bool, name: String){
        self.pointAddAction = pointAddAction
        self.typeAtk = typeAtk
        self.name = name
    }
}

enum TeamTurn {
    case redTurn
    case blueTurn
}

enum ActionTurn {
    case selectHero
    case selectAction
    case selectAdversaire
    case displayAction
}

enum Winner {
    case blueTeam
    case redTeam
    case noOne
}
