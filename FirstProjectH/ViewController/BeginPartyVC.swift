//
//  BeginPartyVC.swift
//  FirstProjectH
//
//  Created by Habib Bouriche on 14/11/2017.
//  Copyright © 2017 Kevin Bravo. All rights reserved.
//

import UIKit

class BeginPartyVC: UIViewController {

    //Ajouté une petite image qui se chargera automatiquement illustrant le type du perso un petit nain, un collos etc.. choisi.
    
    //RED TEAM OUTLETS
    @IBOutlet weak var redTeamView: UIView!
    @IBOutlet weak var RedFirstHeroName: UILabel!
    @IBOutlet weak var RedFirstHeroPV: UILabel!
    @IBOutlet weak var RedSecondHeroName: UILabel!
    @IBOutlet weak var RedSecondHeroPV: UILabel!
    @IBOutlet weak var RedThirdHeroName: UILabel!
    @IBOutlet weak var RedThirdHeroPV: UILabel!
    //red heros Buttons
    @IBOutlet weak var redFirstHeroButton: UIButton!
    @IBOutlet weak var redSecondHeroButton: UIButton!
    @IBOutlet weak var redThirdHeroButton: UIButton!
    
    //BLUE TEAM OUTLETS
    @IBOutlet weak var blueTeamView: UIView!
    @IBOutlet weak var blueFirstHeroName: UILabel!
    @IBOutlet weak var blueFirstHeroPV: UILabel!
    @IBOutlet weak var blueSecondHeroName: UILabel!
    @IBOutlet weak var blueSecondHeroPV: UILabel!
    @IBOutlet weak var blueThirdHeroName: UILabel!
    @IBOutlet weak var blueThirdHeroPV: UILabel!
    //blue heros buttons
    @IBOutlet weak var blueFirstHeroButton: UIButton!
    @IBOutlet weak var blueSecondHeroButton: UIButton!
    @IBOutlet weak var blueThirdHeroButton: UIButton!
    
    //TOP LABELS
    @IBOutlet weak var turnTeam: UILabel!
    @IBOutlet weak var numberTurn: UILabel!
    @IBOutlet weak var OK: UIButton!
    
    //ACTIONS
    @IBOutlet weak var actionDescription: UILabel!
    @IBOutlet weak var selectAction: UILabel!
    @IBOutlet weak var normalAction: UIButton!
    @IBOutlet weak var specialAction: UIButton!
    
    var teamTurn: TeamTurn = .redTurn
    var actionTurn: ActionTurn = .selectHero
    
    var selectedHeroForAction: Hero?
    var selectedAttackType: Bool = true
    var selectedAdversaireForAction: Hero?
    var selectedHeroTag = 0
    
    //once I filtered the chest, I get the weapons allowed for a specific hero
    var ChestWeaponsFiltered = [Weapon]()
    
    //for ending game
    var winner: Winner = .noOne

    @IBAction func selectHeroButtonPressed(_ sender: UIButton) {
        // I need this tag to use it in updateGameResult
        selectedHeroTag = sender.tag
        
        if actionTurn == .selectHero || actionTurn == .selectAction {
            if teamTurn == .redTurn {
                selectedHeroForAction = GameConstants.redTeam.heros[sender.tag]
            } else {
                selectedHeroForAction = GameConstants.blueTeam.heros[sender.tag]
            }
        } else if actionTurn == .selectAdversaire {
            //IF I'M AN HEALER, I HEAL MY ALLIES
            if selectedAttackType == false {
                if teamTurn == .redTurn {
                    selectedAdversaireForAction = GameConstants.redTeam.heros[sender.tag]
                } else {
                    selectedAdversaireForAction = GameConstants.blueTeam.heros[sender.tag]
                }
            } else {
                if teamTurn == .redTurn {
                    selectedAdversaireForAction = GameConstants.blueTeam.heros[sender.tag]
                } else {
                    selectedAdversaireForAction = GameConstants.redTeam.heros[sender.tag]
                }
            }
        }
        
        if actionTurn == .selectHero {
            if teamTurn == .redTurn {
                pickRandomWeapon(heroAddPower: selectedHeroForAction!)
            } else {
                pickRandomWeapon(heroAddPower: selectedHeroForAction!)
            }
        }
        
        if actionTurn == .selectHero {
            actionTurn = .selectAction
        } else if actionTurn == .selectAdversaire {
            actionTurn = .displayAction
        }
        updateDisplayForTurn()
    }
    
    @IBAction func actionNormal() {
        actionTurn = .selectAdversaire
        //verifier au cas ou si le hero est bien sélectionné
        if selectedHeroForAction != nil {
            GameConstants.actionNow = selectedHeroForAction!.attack
            selectedAttackType = selectedHeroForAction!.typeActionNormalAtk
        }
        updateDisplayForTurn()
    }
    
    @IBAction func actionSpe() {
        actionTurn = .selectAdversaire
        //verifier au cas ou si le hero est bien sélectionné
        if selectedHeroForAction != nil {
            selectedHeroForAction!.specialAttackCounter = 0
            GameConstants.actionNow = selectedHeroForAction!.specialCapacity
            selectedAttackType = selectedHeroForAction!.typeActionSpeAtk
        }
        updateDisplayForTurn()
    }
    
    @IBAction func endTurn() {
        updateHeros()
        checkIfGameEnd()
        if actionTurn == .displayAction {
            if teamTurn == .redTurn {
                teamTurn = .blueTurn
            } else {
                teamTurn = .redTurn
            }
            actionTurn = .selectHero
            updateDisplayForTurn()
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        updateDisplayForTurn()
    }

    func hide(hiddenView: UIView, andDisplay view: UIView) {
        
        hiddenView.isUserInteractionEnabled = false
        hiddenView.alpha = 0.3
        
        view.alpha = 1
        view.isUserInteractionEnabled = true
    }
    
    
    func updateHeros() {
        selectedAdversaireForAction!.vitalPoint += GameConstants.actionNow
        updateHeroDeath(number: selectedHeroTag)
        if selectedHeroForAction != nil {
            selectedHeroForAction!.specialAttackCounter += 1
        }
    }
    
    func pickRandomWeapon(heroAddPower: Hero) {
        
        if heroAddPower.cptChest == 0 {
            //            oldWeapon.pointAddAction = heroAddPower.weapon.pointAddAction
            heroAddPower.cptChest += 3
            //On filtre les objet dans la liste des armes pour pouvoir attribué la bonne arme au héro du type atk, heal, atk et heal
            ChestWeaponsFiltered = GameConstants.weaponList
            
            if heroAddPower.typeATK == true && heroAddPower.typeHEAL == false{
                ChestWeaponsFiltered = GameConstants.weaponList.filter {$0.typeAtk == true}
                
            }
            else if heroAddPower.typeATK == false && heroAddPower.typeHEAL == true {
                ChestWeaponsFiltered = GameConstants.weaponList.filter {$0.typeAtk == false}
            }
            else if heroAddPower.typeATK == true && heroAddPower.typeHEAL == true {
                ChestWeaponsFiltered = GameConstants.weaponList.filter {$0.typeAtk == true && $0.typeAtk == false}
            }
            
            // On fait la recherche aléatoire d'une arme dans le coffre filtré
            let randomIndex = Int(arc4random_uniform(UInt32(ChestWeaponsFiltered.count)))
            ChestWeaponsFiltered = GameConstants.weaponList
            heroAddPower.weapon = ChestWeaponsFiltered[randomIndex]
            
           
            let alert = UIAlertController(title: "Coffre débloqué", message: "Vous obtenez une nouvelle arme: \(heroAddPower.weapon.name) +\(heroAddPower.weapon.pointAddAction) points action", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        heroAddPower.cptChest -= 1
    }
    
    
    func updateDisplayForTurn() {
        
        hideEverything()
        
        // TURN = SELECT HERO
        if actionTurn == .selectHero {
            initUI()
            redTeamView.isHidden = false
            blueTeamView.isHidden = false
            
            if teamTurn == .redTurn {
                //mise à jour nombre de tour
                GameConstants.numberTurn += 1
                numberTurn.text = "TOUR \(GameConstants.numberTurn)"
                hide(hiddenView: blueTeamView, andDisplay: redTeamView)
                
                //mets à jour le texte
                turnTeam.text = "C'est au tour de \(GameConstants.redTeam.name)"
                turnTeam.textColor = UIColor.red
                
            } else {
                hide(hiddenView: redTeamView, andDisplay: blueTeamView)
                
                //mets à jour le texte
                turnTeam.text = "C'est au tour de \(GameConstants.blueTeam.name)"
                turnTeam.textColor = UIColor.blue
            }
        }
        
        //TURN = SELECT ADVERSAIRE
        if actionTurn == .selectAdversaire {
            redTeamView.isHidden = false
            blueTeamView.isHidden = false
            // JE SUIS HEAL, JE SOIGNE MES ALIES
            if selectedAttackType == false {
                if teamTurn == .redTurn {
                    hide(hiddenView: blueTeamView, andDisplay: redTeamView)
                } else {
                    hide(hiddenView: redTeamView, andDisplay: blueTeamView)
                }
            } else {
                if teamTurn == .redTurn {
                    hide(hiddenView: redTeamView, andDisplay: blueTeamView)
                } else {
                    hide(hiddenView: blueTeamView, andDisplay: redTeamView)
                }
            }
        }
        
        //TURN = SELECT ACTION
        if actionTurn == .selectAction {
            selectAction.isHidden = false
            normalAction.isHidden = false
            if selectedHeroForAction != nil {
                if selectedHeroForAction!.specialAttackCounter > 1 {
                    specialAction.isHidden = false
                }
            }
        }
        
        //TURN = DISPLAY ACTION (RESULT)
        if actionTurn == .displayAction {
            OK.isHidden = false
            actionDescription.isHidden = false
            actionDescription.text = "\(selectedHeroForAction!.name) à effectuer l'action \(GameConstants.actionNow) pv sur \(selectedAdversaireForAction!.name) " //faire une condition permettant de dire si l'attaque à infliger ou à soigner
        }
        
        if selectedHeroForAction != nil {
            normalAction.setTitle("Hero : \(selectedHeroForAction!.name) Action: \(selectedHeroForAction!.attack)", for: .normal)
            specialAction.setTitle("Hero : \(selectedHeroForAction!.name) Action: \(selectedHeroForAction!.specialCapacity)", for: .normal)
        }
        
    }
    
    func hideEverything() {
        selectAction.isHidden = true
        normalAction.isHidden = true
        specialAction.isHidden = true
        OK.isHidden = true
        actionDescription.isHidden = true
        redTeamView.isHidden = true
        blueTeamView.isHidden = true
    }
    
    
    
    func initUI() {
        OK.isHidden = true
        RedFirstHeroName.text = "\(GameConstants.redTeam.heros[0].name)"
        RedFirstHeroPV.text = "\(GameConstants.redTeam.heros[0].vitalPoint) PV"
        RedSecondHeroName.text = "\(GameConstants.redTeam.heros[1].name)"
        RedSecondHeroPV.text = "\(GameConstants.redTeam.heros[1].vitalPoint) PV"
        RedThirdHeroName.text = "\(GameConstants.redTeam.heros[2].name)"
        RedThirdHeroPV.text = "\(GameConstants.redTeam.heros[2].vitalPoint) PV"
        
        blueFirstHeroName.text = "\(GameConstants.blueTeam.heros[0].name)"
        blueFirstHeroPV.text = "\(GameConstants.blueTeam.heros[0].vitalPoint) PV"
        blueSecondHeroName.text = "\(GameConstants.blueTeam.heros[1].name)"
        blueSecondHeroPV.text = "\(GameConstants.blueTeam.heros[1].vitalPoint) PV"
        blueThirdHeroName.text = "\(GameConstants.blueTeam.heros[2].name)"
        blueThirdHeroPV.text = "\(GameConstants.blueTeam.heros[2].vitalPoint) PV"
        
        normalAction.titleLabel!.lineBreakMode = .byWordWrapping
        normalAction.titleLabel!.numberOfLines = 2
        normalAction.titleLabel!.textAlignment = .center
        
        specialAction.titleLabel!.lineBreakMode = .byWordWrapping
        specialAction.titleLabel!.numberOfLines = 2
        specialAction.titleLabel!.textAlignment = .center
    }
    
    
    func updateHeroDeath(number: Int) {
        
        if GameConstants.redTeam.heros[number].vitalPoint <= 0 {
            GameConstants.redTeam.heros[number].vitalPoint = 0
            GameConstants.redTeam.heros[number].death = true
            if number == 0 {
                redFirstHeroButton.alpha = 0.1
                redFirstHeroButton.isEnabled = false
            }
            if number == 1 {
                redSecondHeroButton.alpha = 0.1
                redSecondHeroButton.isEnabled = false
            }
            if number == 2 {
                redThirdHeroButton.alpha = 0.1
                redThirdHeroButton.isEnabled = false
            }
        }
        
        if GameConstants.blueTeam.heros[number].vitalPoint <= 0{
            GameConstants.blueTeam.heros[number].vitalPoint = 0
            GameConstants.blueTeam.heros[number].death = true
            if number == 0 {
                blueFirstHeroButton.alpha = 0.3
                blueFirstHeroButton.isEnabled = false
            }
            if number == 1 {
                blueSecondHeroButton.alpha = 0.3
                blueSecondHeroButton.isEnabled = false
            }
            if number == 2 {
                blueThirdHeroButton.alpha = 0.3
                blueThirdHeroButton.isEnabled = false
            }
            
        }
    }
    
    func checkIfGameEnd() {
        
        let redHeros = GameConstants.redTeam.heros.filter {$0.vitalPoint > 0}
        if redHeros.count == 0 {
            //je n'ai plus de héros avec des vies dans l'équipe rouge
            winner = .blueTeam
            performSegue(withIdentifier: "showEndGame", sender: self)
        }
        
        let blueHeros = GameConstants.blueTeam.heros.filter {$0.vitalPoint > 0}
        if blueHeros.count == 0 {
            //je n'ai plus de héros avec des vies dans l'équipe bleue
            winner = .redTeam
            performSegue(withIdentifier: "showEndGame", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEndGame" {
            if let pageDeDestination = segue.destination as? EndViewController {
                pageDeDestination.winner = self.winner
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

