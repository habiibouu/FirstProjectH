//
//  TeamNameViewController.swift
//  FirstProjectH
//
//  Created by Kevin Bravo on 08/11/2017.
//  Copyright © 2017 Kevin Bravo. All rights reserved.
//

import UIKit

class TeamRedNameVC: UIViewController {
    
    
    var turn: TeamTurn = .redTurn
    
    @IBOutlet weak var teamSelectionTitle: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    //var Hero 
    
    @IBAction func nameTeam() {
        if turn == .redTurn {
            print(nameTextField.text!)
            GameConstants.redTeam.name = nameTextField.text!
            changeTurn()
        } else {
            GameConstants.blueTeam.name = nameTextField.text!
            //passer au prochain tour
            self.performSegue(withIdentifier: "showHerosSelection", sender: self)
        }
    }
    
    func changeTurn() {
        turn = .blueTurn
        teamSelectionTitle.text = "Equipe bleue, c'est à vous"
        teamSelectionTitle.backgroundColor = UIColor.blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamSelectionTitle.text = "Hello, merci de selectionner un nom d'equipe"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
