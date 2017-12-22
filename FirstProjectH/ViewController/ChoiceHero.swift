//
//  NameHeroVC.swift
//  FirstProjectH
//
//  Created by Habib Bouriche on 10/11/2017.
//  Copyright © 2017 Kevin Bravo. All rights reserved.
//

import UIKit

class NameHeroRedVC: UIViewController {
    @IBOutlet weak var dwarfI: UIImageView!
    @IBOutlet weak var colossusI: UIImageView!
    @IBOutlet weak var warriorI: UIImageView!
    @IBOutlet weak var magusI: UIImageView!
    
    
    @IBOutlet weak var heroChoice: UILabel!
    var heros = [Hero]()
    var cpt = 0
    var turn: TeamTurn = .redTurn
    
    @IBAction func touchDwarf(_ sender: Any) {
        alert { (name) in
            let heroDwarf = Dwarf()
            heroDwarf.name = name
            self.heros.append(heroDwarf)
            // /!\Ask if a gamer choice many dwarf, what go in now if we have many var herodwarf, is't probleme? (demander si le joueur choisi plusieur Dwarf nous auron plusieurs variable heroDwarf est ce que cela posera un pb?)
        }
        verificationNumbHero()
    }
    
    @IBAction func touchColossus(_ sender: Any) {
        alert { (name) in
            let heroColossus = Colossus()
            heroColossus.name = name
            self.heros.append(heroColossus)
        }
        verificationNumbHero()
    }
        
    @IBAction func touchWarrior(_ sender: Any) {
        alert { (name) in
            let heroWarrior = Warrior()
            heroWarrior.name = name
            self.heros.append(heroWarrior)
            
        }
        verificationNumbHero()
    }
    
    @IBAction func touchMagus(_ sender: Any) {
        alert { (name) in
            let heroMagus = Magus()
            heroMagus.name = name
            self.heros.append(heroMagus)
        }
    }
    
    func verificationNumbHero(){
        
        if turn == .redTurn && heros.count == 3 {
            GameConstants.redTeam.heros = heros
            changeTeam()
        }
        if turn == .blueTurn && heros.count == 3 {
            GameConstants.blueTeam.heros = heros
            self.performSegue(withIdentifier: "showBeginParty", sender: self)
        }
    }
    
    func changeTeam(){
        heroChoice.text = "L'équipe Bleu selectionnez vos 3 Héros"
        heroChoice.backgroundColor = UIColor.blue
        heros = []
        turn = .blueTurn
    }
    
    func alert(completion: @escaping(String)->())  {
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Choix du nom du hero", message: "Entrer le nom", preferredStyle: .alert)
        //2. Add the text field. You can configure it however you need.
        alert.addTextField {
            (textField) in textField.text = ""
        }
        
        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert!.textFields![0] // Force unwrapping because we know it exists.
            print("Text field: \(String(describing: textField.text))")
            //name = textField.text!
            completion(textField.text!)
            self.verificationNumbHero()
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Image heros
        dwarfI = GameConstants.imageDwarf
        dwarfI.frame = CGRect(x: 56, y: 175, width: 75, height: 48)
        view.addSubview(dwarfI)
        colossusI = GameConstants.imageColossus
        colossusI.frame = CGRect(x: 250, y: 175, width: 75, height: 48)
        view.addSubview(colossusI)
        magusI = GameConstants.imageMagus
        magusI.frame = CGRect(x: 250, y: 389, width: 75, height: 50)
        view.addSubview(magusI)
        warriorI = GameConstants.imageWarrior
        warriorI.frame = CGRect(x: 56, y: 389, width: 75, height: 50)
        view.addSubview(warriorI)
        
        heroChoice.text = "L'équipe Rouge selectionnez vos 3 Héros"
        heroChoice.backgroundColor = UIColor.red
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


