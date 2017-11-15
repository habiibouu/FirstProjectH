//
//  BeginPartyVC.swift
//  FirstProjectH
//
//  Created by Habib Bouriche on 14/11/2017.
//  Copyright © 2017 Kevin Bravo. All rights reserved.
//

import UIKit

class BeginPartyVC: UIViewController {

    
    
    //RED TEAM
    @IBOutlet weak var redTeamView: UIView!
    @IBOutlet weak var RedFirstHeroName: UILabel!
    @IBOutlet weak var RedFirstHeroPV: UILabel!
    @IBOutlet weak var RedSecondHeroName: UILabel!
    @IBOutlet weak var RedSecondHeroPV: UILabel!
    @IBOutlet weak var RedThirdHeroName: UILabel!
    @IBOutlet weak var RedThirdHeroPV: UILabel!
    
    
    
    @IBAction func redTeamButtonPressed(_ sender: UIButton) {
        print("redButtonPressed")
        redTeamView.isUserInteractionEnabled = false
        redTeamView.alpha = 0.3
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
