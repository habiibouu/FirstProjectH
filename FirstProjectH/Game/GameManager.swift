//Creation of class Teams


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


////***Listage pour chaque équipe du détail des Hero adverse pour un choix d’action informé (sur leurs pv )
//func detailPlayer(teamBlue: Team, teamRed: Team){
//    if teamRed.hisTurn == true {
//        for hero in teamBlue.heros{
//            print("Le \(hero.name) à \(hero.vitalPoint) PV ")
//        }
//    }
//    else  if teamBlue.hisTurn == true {
//        for hero in teamBlue.heros{
//            print("Le \(hero.name) à \(hero.vitalPoint) PV ")
//        }
//    }
//}
//
////***Ajout de la fonction boucle du tour avec plusieur fonction la constituant
////   /!\ La fonction permettant de choisir son hero
//func chooseHero(teamRed: Team, teamBlue: Team) /* -> Hero*/ {
//    if teamRed.hisTurn == true {
//        //on choisie un hero que l'on renvoie parmis les hero de sa team
//    }
//    else if teamBlue.hisTurn == true {
//
//    }
//
//}
//
//// /!\ Les fonctions pour les coffre arme
////Création classes Armes
//class Weapon {
//    var pointAddAction: Int
//    var name : String
//    var typeAtk : Bool //type de l'arme étant une arme d'attaque par défaultsi true si non arme de soin
//    init(pointAddAction: Int, typeAtk: Bool, name: String){
//        self.pointAddAction = pointAddAction
//        self.typeAtk = typeAtk
//        self.name = name
//    }
//}
//
////Création d'un tableaux contenant toutes les armes
//var weaponList = [Weapon]()
//weaponList[0].name = "Escalibure"
//weaponList[0].pointAddAction = +10
//weaponList[0].typeAtk = true
//
//weaponList[1].name = "Amulette du dragon"
//weaponList[1].pointAddAction = +7
//weaponList[1].typeAtk = true
//
//weaponList[2].name = "Glaive de la foie"
//weaponList[2].pointAddAction = +5
//weaponList[2].typeAtk = true
//
//weaponList[3].name = "Baton de puissance"
//weaponList[3].pointAddAction = +3
//weaponList[3].typeAtk = true
//
//weaponList[4].name = "Fiole magic"
//weaponList[4].pointAddAction = +15
//weaponList[4].typeAtk = false
//
//weaponList[5].name = "Armure de fer"
//weaponList[5].pointAddAction = +8
//weaponList[5].typeAtk = false
//
//weaponList[6].name = "Manteau de la foie"
//weaponList[6].pointAddAction = +5
//weaponList[6].typeAtk = false
//
////création fonction choisissant aléatoirement un élément dans weaponList
//func randomWeapon() {
//
//}
//
////La fonction lui attribuant une arme aléatoire
//func chestWeapon(to heroSelect: Hero){
//    //Faire différente arme et leur ajouté l'attribut atk ou soin, si le hero sélectionné n'a que atk alors il aura une arme que atk, si il est atk et soin il peut avoir soit une arme atk ou soin boostant ainsi leurs aptitude (comme un des héro dwarf a une action normal de type atk et une capacité spé de type soin faire en sorte de pouvoir les différencier pour attribuer le boost à la bonne attaque, par exemple si il recoit une arme aumentant le soin cela affectera seulement son attaque spé, alors que si cette arme était donné aux mage alors toute ses capacité soin se verra augmenté
//     //Faire le choix aléatoire des arme
//    var weaponChoice : Weapon
//    if heroSelect.typeATK == true && heroSelect.typeHEAL == true {
//        //Demander comment faire pour choisir une arme aléatoire ATK ou HEAL(NON-ATK)parmis la weapon list
//        //utiliser randomWeapon
//
//        //La stocker dans la var dans weaponChoice
//
//        //Faire en sorte que l'arme augmente les atkNormal et spe spécifique au type d'action heal ou atk
//        if weaponChoice.typeAtk = true {
//            if heroSelect.typeActionNormalAtk == true && heroSelect.typeActionSpeAtk = true{
//                heroSelect.attack += weaponChoice
//                heroSelect.specialCapacity += weaponChoice
//            }
//            else if heroSelect.typeActionNormalAtk == true && heroSelect.typeActionSpeAtk = false{
//                heroSelect.attack += weaponChoice
//            }
//            else if heroSelect.typeActionNormalAtk == false && heroSelect.typeActionSpeAtk = true{
//                heroSelect.specialCapacity += weaponChoice
//            }
//        }
//        else if weaponChoice.typeAtk = false {
//            if heroSelect.typeActionNormalAtk == false && heroSelect.typeActionSpeAtk = false{
//                heroSelect.attack += weaponChoice
//                heroSelect.specialCapacity += weaponChoice
//            }
//            else if heroSelect.typeActionNormalAtk == true && heroSelect.typeActionSpeAtk = false{
//                heroSelect.specialCapacity+= weaponChoice
//            }
//            else if heroSelect.typeActionNormalAtk == false && heroSelect.typeActionSpeAtk = true{
//                heroSelect.attack += weaponChoice
//            }
//        }
//
//
//    }
//    else if heroSelect.typeATK == true && heroSelect.typeHEAL == false {
//
//        //Demander comment faire pour choisir une arme aléatoire ATK(weaponChoice.typeAtk = true ) parmis la weapon list
//            if heroSelect.typeActionNormalAtk == true && heroSelect.typeActionSpeAtk = true{
//                heroSelect.attack += weaponChoice
//                heroSelect.specialCapacity += weaponChoice
//            }
//            else if heroSelect.typeActionNormalAtk == true && heroSelect.typeActionSpeAtk = false{
//                heroSelect.attack += weaponChoice
//            }
//            else if heroSelect.typeActionNormalAtk == false && heroSelect.typeActionSpeAtk = true{
//                heroSelect.specialCapacity += weaponChoice
//            }
//    }
//
//
//
//    else if heroSelect.typeATK == false && heroSelect.typeHEAL == true {
//        //Demander comment faire pour choisir une arme aléatoire HEAL(NON-ATK: weaponChoice.typeAtk = false)parmis la weapon list
//            if heroSelect.typeActionNormalAtk == false && heroSelect.typeActionSpeAtk = false{
//                heroSelect.attack += weaponChoice
//                heroSelect.specialCapacity += weaponChoice
//            }
//            else if heroSelect.typeActionNormalAtk == true && heroSelect.typeActionSpeAtk = false{
//                heroSelect.specialCapacity += weaponChoice
//            }
//            else if heroSelect.typeActionNormalAtk == false && heroSelect.typeActionSpeAtk = true{
//                heroSelect.attack += weaponChoice
//            }
//        }
//
//
//
//    //faire en sorte que l'arme dure 3 tours et que à chaque fin du compteur le héro en début de tour se revvera attribué une nouvelle armes aléatoire. Penser à décrémenter àprès chaque fin de tour et si cpt = 0 alors on lui enlève l'arme
//    heroSelect.cptWeapon = 3
//
//    ////////Penser à faire une autre class de héro avec comme capacité spécial permettant de destituer l'arme d'un adversaire mais laissant en laissant son compteur defilé (cad que si le hero à une arme pendant 1 tour et se fait destituer son arme à son 1er tour alors il devra qd meme attendre ses 2 tour restant pour pouvoir rouvrir un coffre aléatoire

