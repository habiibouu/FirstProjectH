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
    
    @IBOutlet weak var blueTeamView: UIView!
    @IBOutlet weak var blueFirstHeroName: UILabel!
    @IBOutlet weak var blueFirstHeroPV: UILabel!
    @IBOutlet weak var blueSecondHeroName: UILabel!
    @IBOutlet weak var blueSecondHeroPV: UILabel!
    @IBOutlet weak var blueThirdHeroName: UILabel!
    @IBOutlet weak var blueThirdHeroPV: UILabel!
    
    @IBOutlet weak var turnTeam: UILabel!
    @IBOutlet weak var numberTurn: UILabel!
    
    @IBOutlet weak var normalAction: UIButton!
    @IBOutlet weak var specialAction: UIButton!
    
    @IBOutlet weak var actionDescription: UILabel!
    
    
    @IBAction func redTeamButtonPressed(_ sender: UIButton) {
     var finishSelect = false
        
        if GameConstants.redTeam.hisTurn == true {
            blueTeamView.isUserInteractionEnabled = false
            blueTeamView.alpha = 0.3
            GameConstants.heroChoice = GameConstants.redTeam.heros[sender.tag]
            finishSelect = true
            
//            specialAction.text = "Action spe: \(GameConstants.redTeam.heros[sender.tag].attack)"
//            normalAction.text = "Action normal: \(GameConstants.redTeam.heros[sender.tag].specialCapacity)"
    
        }
        if blueTeamView.isUserInteractionEnabled == false && finishSelect == true  {
            redTeamView.isUserInteractionEnabled = false
            redTeamView.alpha = 0.3
            blueTeamView.isUserInteractionEnabled = true
            GameConstants.heroTarget = GameConstants.blueTeam.heros[sender.tag]
            finishSelect = false
        }
        
        //faire qqchose pour afficher l'action qui se déroule après avoir selectionner l'action
        
        if GameConstants.blueTeam.hisTurn == true {
            redTeamView.isUserInteractionEnabled = false
            redTeamView.alpha = 0.3
            GameConstants.heroChoice = GameConstants.blueTeam.heros[sender.tag]
            finishSelect = true
//            specialAction.text = "Action spe: \(GameConstants.blueTeam.heros[sender.tag].attack)"
//            normalAction.text = "Action normal: \(GameConstants.blueTeam.heros[sender.tag].specialCapacity)"
//
        }
        if redTeamView.isUserInteractionEnabled == false && finishSelect == true  {
            blueTeamView.isUserInteractionEnabled = false
            blueTeamView.alpha = 0.3
            redTeamView.isUserInteractionEnabled = true
            GameConstants.heroTarget = GameConstants.redTeam.heros[sender.tag]
            finishSelect = false
        }
    }
        
        @IBAction func actionNormal() {
            if GameConstants.blueTeam.hisTurn == true {
            GameConstants.actionNow = GameConstants.heroChoice.attack
            }
            if GameConstants.redTeam.hisTurn == true {
                GameConstants.actionNow = GameConstants.heroChoice.attack
            }
            
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
        GameConstants.redTeam.hisTurn = true
        GameConstants.blueTeam.hisTurn = false
        
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
        
        actionDescription.alpha = 0
        
        
        
        blueTeamView.isUserInteractionEnabled = false
        blueTeamView.alpha = 0.3
        turnTeam.text = "C'est au tour de \(GameConstants.redTeam.name)"
        turnTeam.textColor = UIColor.red
        
        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
