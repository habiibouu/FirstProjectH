//
//  EndViewController.swift
//  FirstProjectH
//
//  Created by Kevin Bravo on 06/12/2017.
//  Copyright © 2017 Kevin Bravo. All rights reserved.
//

import Foundation
import UIKit

class EndViewController: UIViewController {
    
    var winner: Winner!
    @IBOutlet weak var endingMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMessage()
    }
    
    func updateMessage() {
        if winner == .redTeam {
            endingMessage.text = "BRAVO À L'EQUIPE ROUGE !"
        } else {
            endingMessage.text = "BRAVO À L'EQUIPE BLEUE !"
        }
    }
    
    
    @IBAction func goBackToOneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToPresentation", sender: self)
        GameConstants.redTeam.heros.removeAll()
        GameConstants.blueTeam.heros.removeAll()
    }
}
