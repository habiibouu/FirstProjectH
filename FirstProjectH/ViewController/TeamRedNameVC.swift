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
    
    @IBAction func nameTeam() {
        //We get the name team for two team and go to the next segue
        if turn == .redTurn {
            print(nameTextField.text!)
            GameConstants.redTeam.name = nameTextField.text!
            changeTurn()
        } else {
            GameConstants.blueTeam.name = nameTextField.text!
            //go next turn
            self.performSegue(withIdentifier: "showHerosSelection", sender: self)
        }
    }
    
    //this function change the label for the next team
    func changeTurn() {
        nameTextField.text = ""
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
