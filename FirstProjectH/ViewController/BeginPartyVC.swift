//
//  BeginPartyVC.swift
//  FirstProjectH
//
//  Created by Habib Bouriche on 14/11/2017.
//  Copyright © 2017 Kevin Bravo. All rights reserved.
//

import UIKit

class BeginPartyVC: UIViewController {

   
    //Image outlet
    @IBOutlet weak var redPerso1: UIImageView!
    @IBOutlet weak var redPerso2: UIImageView!
    @IBOutlet weak var redPerso3: UIImageView!
    @IBOutlet weak var bluePerso1: UIImageView!
    @IBOutlet weak var bluePerso2: UIImageView!
    @IBOutlet weak var bluePerso3: UIImageView!
    
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
    
    //Data use
    var teamTurn: TeamTurn = .redTurn
    var actionTurn: ActionTurn = .selectHero
    var selectedHeroForAction: Hero?
    var selectedAttackType: Bool = true
    var selectedAdversaireForAction: Hero?
    var selectedHeroTag = 0
    //(once I filtered the chest, I get the weapons allowed for a specific hero)
    var ChestWeaponsFiltered = [Weapon]()
    //(for ending game)
    var winner: Winner = .noOne

    @IBAction func selectHeroButtonPressed(_ sender: UIButton) {
        // I need this tag to use it in updateGameResult
        selectedHeroTag = sender.tag
        
        //::Choice your hero and action
        if actionTurn == .selectHero || actionTurn == .selectAction {
            if teamTurn == .redTurn {
                selectedHeroForAction = GameConstants.redTeam.heros[sender.tag]
            } else {
                selectedHeroForAction = GameConstants.blueTeam.heros[sender.tag]
            }
        }//::Choice hero target
            else if actionTurn == .selectAdversaire {
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
        
        //::Add weapon
        if actionTurn == .selectHero {
            if teamTurn == .redTurn {
                pickRandomWeapon(heroAddPower: selectedHeroForAction!)
            } else {
                pickRandomWeapon(heroAddPower: selectedHeroForAction!)
            }
        }
        
        //::Change step
        if actionTurn == .selectHero {
            actionTurn = .selectAction
        } else if actionTurn == .selectAdversaire {
            actionTurn = .displayAction
        }
        updateDisplayForTurn()
    }
    
    @IBAction func actionNormal() {
        actionTurn = .selectAdversaire
        //check if the hero is selected
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
        //Data to image hero. Look if we can change that in better and thinking to hide them image in a good time
        redPerso1 = GameConstants.redTeam.heros[0].image
        redPerso1.frame = CGRect(x: 76, y: 60, width: 39, height: 35)
        view.addSubview(redPerso1)
        redPerso2 = GameConstants.redTeam.heros[1].image
        redPerso2.frame = CGRect(x: 76, y: 150, width: 39, height: 35)
        view.addSubview(redPerso2)
        redPerso3 = GameConstants.redTeam.heros[2].image
        redPerso3.frame = CGRect(x: 76, y: 225, width: 39, height: 35)
        view.addSubview(redPerso3)
        bluePerso1 = GameConstants.blueTeam.heros[0].image
        bluePerso1.frame = CGRect(x: 263, y: 60, width: 39, height: 35)
        view.addSubview(bluePerso1)
        bluePerso2 = GameConstants.blueTeam.heros[1].image
        bluePerso2.frame = CGRect(x: 263, y: 150, width: 39, height: 35)
        view.addSubview(bluePerso2)
        bluePerso3 = GameConstants.blueTeam.heros[2].image
        bluePerso3.frame = CGRect(x: 263, y: 225, width: 39, height: 35)
        view.addSubview(bluePerso3)


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
            heroAddPower.cptChest += 3
            //::Filter they weapon in the weapon list for take a just add attribution to the hero if his tye is atk, heal, or atk and heal
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
            
            //::Researche a random weapon in the filter chest
            let randomIndex = Int(arc4random_uniform(UInt32(ChestWeaponsFiltered.count)))
            ChestWeaponsFiltered = GameConstants.weaponList
            heroAddPower.weapon = ChestWeaponsFiltered[randomIndex]
            
            //::Display the new weapon to the hero
            let alert = UIAlertController(title: "Coffre débloqué", message: "Vous obtenez une nouvelle arme: \(heroAddPower.weapon.name) +\(heroAddPower.weapon.pointAddAction) points action", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        heroAddPower.cptChest -= 1
    }
    
    
    func updateDisplayForTurn() {
        
        hideEverything()
        
        //::TURN = SELECT HERO
        if actionTurn == .selectHero {
            initUI()
            redTeamView.isHidden = false
            blueTeamView.isHidden = false
            
            if teamTurn == .redTurn {
                //update number turn as we start with red team
                GameConstants.numberTurn += 1
                numberTurn.text = "TOUR \(GameConstants.numberTurn)"
                
                //update texte  turn
                turnTeam.text = "C'est au tour de \(GameConstants.redTeam.name)"
                turnTeam.textColor = UIColor.red
                
                hide(hiddenView: blueTeamView, andDisplay: redTeamView)
                
            } else {
                hide(hiddenView: redTeamView, andDisplay: blueTeamView)
                
                //update text turn
                turnTeam.text = "C'est au tour de \(GameConstants.blueTeam.name)"
                turnTeam.textColor = UIColor.blue
            }
        }
        
        //::TURN = SELECT ADVERSAIRE
        if actionTurn == .selectAdversaire {
            redTeamView.isHidden = false
            blueTeamView.isHidden = false
            
            // I'm healer
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
            actionDescription.text = "\(selectedHeroForAction!.name) à effectuer l'action \(GameConstants.actionNow) pv sur \(selectedAdversaireForAction!.name) "
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
        
        //for ajust display in label
        normalAction.titleLabel!.lineBreakMode = .byWordWrapping
        normalAction.titleLabel!.numberOfLines = 2
        normalAction.titleLabel!.textAlignment = .center
        
        specialAction.titleLabel!.lineBreakMode = .byWordWrapping
        specialAction.titleLabel!.numberOfLines = 2
        specialAction.titleLabel!.textAlignment = .center
    }
    
    
    func updateHeroDeath(number: Int) {
        
        //::Check RED Team
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
        
        //::Check BLUE Team
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
        //::RED Team Check
        //Filter heros in life
        let redHeros = GameConstants.redTeam.heros.filter {$0.vitalPoint > 0}
        //Test all death hero
        if redHeros.count == 0 {
            winner = .blueTeam
            performSegue(withIdentifier: "showEndGame", sender: self)
        }
        //::BLUE Team Check
        let blueHeros = GameConstants.blueTeam.heros.filter {$0.vitalPoint > 0}
        if blueHeros.count == 0 {
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

