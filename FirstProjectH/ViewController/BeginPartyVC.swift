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
    
    //BLUE TEAM
    @IBOutlet weak var blueTeamView: UIView!
    @IBOutlet weak var blueFirstHeroName: UILabel!
    @IBOutlet weak var blueFirstHeroPV: UILabel!
    @IBOutlet weak var blueSecondHeroName: UILabel!
    @IBOutlet weak var blueSecondHeroPV: UILabel!
    @IBOutlet weak var blueThirdHeroName: UILabel!
    @IBOutlet weak var blueThirdHeroPV: UILabel!
    
    //TOP LABELS
    @IBOutlet weak var turnTeam: UILabel!
    @IBOutlet weak var numberTurn: UILabel!

    //ACTIONS
    @IBOutlet weak var actionDescription: UILabel!
    @IBOutlet weak var selectAction: UILabel!
    @IBOutlet weak var normalAction: UIButton!
    @IBOutlet weak var specialAction: UIButton!
    
    var teamTurn: TeamTurn = .redTurn
    var actionTurn: ActionTurn = .selectHero
    var selectedHeroForAction: Hero?
    var selectedAdversaireForAction: Hero?
    
    @IBAction func selectHeroButtonPressed(_ sender: UIButton) {
    
        
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
            actionTurn = .selectHero
            if teamTurn == .redTurn {
                teamTurn = .blueTurn
            } else {
                teamTurn = .redTurn
            }
        }
        
        updateDisplayForTurn()
    
        //var finishSelect = false
        
//
//        if GameConstants.redTeam.hisTurn == true {
//            blueTeamView.isUserInteractionEnabled = false
//            blueTeamView.alpha = 0.3
//            GameConstants.heroChoice = GameConstants.redTeam.heros[sender.tag]
//            finishSelect = true
////            specialAction.text = "Action spe: \(GameConstants.redTeam.heros[sender.tag].attack)"
////            normalAction.text = "Action normal: \(GameConstants.redTeam.heros[sender.tag].specialCapacity)"
//        }
//
//
//        if blueTeamView.isUserInteractionEnabled == false && finishSelect == true  {
//            redTeamView.isUserInteractionEnabled = false
//            redTeamView.alpha = 0.3
//            blueTeamView.isUserInteractionEnabled = true
//            GameConstants.heroTarget = GameConstants.blueTeam.heros[sender.tag]
//            finishSelect = false
//        }
//
//        //faire qqchose pour afficher l'action qui se déroule après avoir selectionner l'action
//
//        if GameConstants.blueTeam.hisTurn == true {
//            redTeamView.isUserInteractionEnabled = false
//            redTeamView.alpha = 0.3
//            GameConstants.heroChoice = GameConstants.blueTeam.heros[sender.tag]
//            finishSelect = true
////            specialAction.text = "Action spe: \(GameConstants.blueTeam.heros[sender.tag].attack)"
////            normalAction.text = "Action normal: \(GameConstants.blueTeam.heros[sender.tag].specialCapacity)"
////
//        }
//        if redTeamView.isUserInteractionEnabled == false && finishSelect == true  {
//            blueTeamView.isUserInteractionEnabled = false
//            blueTeamView.alpha = 0.3
//            redTeamView.isUserInteractionEnabled = true
//            GameConstants.heroTarget = GameConstants.redTeam.heros[sender.tag]
//            finishSelect = false
//        }
    }
        
        @IBAction func actionNormal() {
            actionTurn = .selectAdversaire
            updateDisplayForTurn()
            
//            if GameConstants.blueTeam.hisTurn == true {
//            GameConstants.actionNow = GameConstants.heroChoice.attack
//            }
//            if GameConstants.redTeam.hisTurn == true {
//                GameConstants.actionNow = GameConstants.heroChoice.attack
//            }
            
        }
    
        @IBAction func actionSpe() {
            if GameConstants.blueTeam.hisTurn == true {
                GameConstants.actionNow = GameConstants.heroChoice.specialCapacity
                GameConstants.redTeam.hisTurn = false
                GameConstants.redTeam.hisTurn = true
                
            }
            if GameConstants.redTeam.hisTurn == true {
                GameConstants.actionNow = GameConstants.heroChoice.specialCapacity
                GameConstants.redTeam.hisTurn = false
                GameConstants.blueTeam.hisTurn = true
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
    
    func updateDisplayForTurn() {
        
        
        if actionTurn == .selectHero {
            if teamTurn == .redTurn {
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
        } else if actionTurn == .selectAdversaire {
            if teamTurn == .redTurn {
                hide(hiddenView: redTeamView, andDisplay: blueTeamView)
            } else {
                hide(hiddenView: blueTeamView, andDisplay: redTeamView)
            }
        }
        
        if actionTurn == .selectAction {
            actionDescription.isHidden = false
            selectAction.isHidden = false
            
            normalAction.isHidden = false
            specialAction.isHidden = false
        } else {
            actionDescription.isHidden = true
            selectAction.isHidden = true
            
            normalAction.isHidden = true
            specialAction.isHidden = true
        }
        
        if selectedHeroForAction != nil {
            normalAction.setTitle("Hero : \(selectedHeroForAction!.name) Action: \(selectedHeroForAction!.attack)", for: .normal)
        }
    }
    
    func initUI() {
//        GameConstants.redTeam.hisTurn = true
//        GameConstants.blueTeam.hisTurn = false
        
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
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
