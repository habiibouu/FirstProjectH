//
//  TeamNameViewController.swift
//  FirstProjectH
//
//  Created by Kevin Bravo on 08/11/2017.
//  Copyright © 2017 Kevin Bravo. All rights reserved.
//

import UIKit

class TeamRedNameVC: UIViewController {
    @IBOutlet weak var teamSelectionTitle: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBAction func debugButtonPressed() {
        print(nameTextField.text!)
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
