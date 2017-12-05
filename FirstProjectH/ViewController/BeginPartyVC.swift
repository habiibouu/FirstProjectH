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
    
    //RED TEAM
    @IBOutlet weak var redTeamView: UIView!
    @IBOutlet weak var RedFirstHeroName: UILabel!
    @IBOutlet weak var RedFirstHeroPV: UILabel!
    @IBOutlet weak var RedSecondHeroName: UILabel!
    @IBOutlet weak var RedSecondHeroPV: UILabel!
    @IBOutlet weak var RedThirdHeroName: UILabel!
    @IBOutlet weak var RedThirdHeroPV: UILabel!
    //button hero
    @IBOutlet weak var redFirstHeroButton: UIButton!
    @IBOutlet weak var redSecondHeroButton: UIButton!
    @IBOutlet weak var redThirdHeroButton: UIButton!
    
    //BLUE TEAM
    @IBOutlet weak var blueTeamView: UIView!
    @IBOutlet weak var blueFirstHeroName: UILabel!
    @IBOutlet weak var blueFirstHeroPV: UILabel!
    @IBOutlet weak var blueSecondHeroName: UILabel!
    @IBOutlet weak var blueSecondHeroPV: UILabel!
    @IBOutlet weak var blueThirdHeroName: UILabel!
    @IBOutlet weak var blueThirdHeroPV: UILabel!
    //button hero
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
    var winner: Winner = .noOne
    var actionTurn: ActionTurn = .selectHero
    var selectedHeroForAction: Hero?
    var selectedAdversaireForAction: Hero?
    var senderNumber = 0
    
    @IBAction func selectHeroButtonPressed(_ sender: UIButton) {
       //on associe le sender.tag à une variable pour le récuperer après dans la fonction updateGameResult
        senderNumber = sender.tag
        if actionTurn == .selectHero || actionTurn == .selectAction {
            if teamTurn == .redTurn {
                selectedHeroForAction = GameConstants.redTeam.heros[sender.tag]
            } else {
                selectedHeroForAction = GameConstants.blueTeam.heros[sender.tag]
            }
        } else if actionTurn == .selectAdversaire {
            if teamTurn == .redTurn {
                selectedAdversaireForAction = GameConstants.blueTeam.heros[sender.tag]
                
            } else {
                selectedAdversaireForAction = GameConstants.redTeam.heros[sender.tag]
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
        updateDisplayForTurn()
        
        //verifier au cas ou si le hero est bien sélectionné
        if selectedHeroForAction != nil {
            GameConstants.actionNow = selectedHeroForAction!.attack
        }
        
        
    }
    
    @IBAction func actionSpe() {
        actionTurn = .selectAdversaire
        updateDisplayForTurn()
        //verifier au cas ou si le hero est bien sélectionné
        if selectedHeroForAction != nil {
            GameConstants.actionNow = selectedHeroForAction!.specialCapacity
        }
        
    }
    
    @IBAction func endTurn() {
        updateGameResults()
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
    
    
    func updateGameResults() {
        selectedAdversaireForAction!.vitalPoint += GameConstants.actionNow
        updateHeroDeath(number: senderNumber)
        updateEndGame()
        // créer une fonction qui détecte si un héro est mort et faire en sorte qu'il ne soit plus sélectionnable
        
        // créer une fonction qui détecte si l'équipe n'a plus de héros disponible (et termine la partie)
        // pour tester cette dernière, n'hésite pas à augmenter les dégats des héros
        
        // pour le coffre : prévoir une fin de tour (les deux équipes ont jouées leur tour) ce coffre s'ouvrira a ce moment là.
        
        // pour aller plus loin : essayer d'imaginer la logique du coffre et commencer à coder
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
            if teamTurn == .redTurn {
                hide(hiddenView: redTeamView, andDisplay: blueTeamView)
            } else {
                hide(hiddenView: blueTeamView, andDisplay: redTeamView)
            }
        }
        
        //TURN = SELECT ACTION
        if actionTurn == .selectAction {
            selectAction.isHidden = false
            normalAction.isHidden = false
            specialAction.isHidden = false
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
    
    func updateEndGame() {
        var cpt = 0
        for nb in 0...2 {
            if GameConstants.redTeam.heros[nb].death == true {
                cpt += 1
                if cpt == 3 {
                    winner = .redTeam
                     endGAME()
                }
            }
            else {
                cpt = 0
            }
            
            
            if GameConstants.blueTeam.heros[nb].death == true {
                cpt += 1
                if cpt == 3 {
                    winner = .blueTeam
                     endGAME()
                }
            } else {
                cpt = 0
            }
        }
    }
    
    func endGAME() {
            self.performSegue(withIdentifier: "showEndGame", sender: self)
}
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

