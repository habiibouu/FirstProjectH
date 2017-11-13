//
//  NameHeroVC.swift
//  FirstProjectH
//
//  Created by Habib Bouriche on 10/11/2017.
//  Copyright © 2017 Kevin Bravo. All rights reserved.
//

import UIKit

class NameHeroRedVC: UIViewController {
    
    var nameHero = ""
    var heros = [Hero]()
    var hero = Hero(vitalPoint: 0, attack: 0, specialCapacity: 0, typeATK: true, typeHEAL: true, typeActionNormalAtk: true, typeActionSpeAtk: true)
    
    @IBAction func touchDwarf(_ sender: Any) {
        alert { (name) in
            let heroDwarf = Dwarf()
            heroDwarf.name = name
            self.heros.append(heroDwarf)
        }
    }
    
//    @IBAction func touchColossus(_ sender: Any) {
//        let heroColossus: Colossus
//        hero = heroColossus
//        alert { (name) in
//            self.hero.name = name
//        }
//        self.heros.append(hero)
//    }
//    @IBAction func touchWarrior(_ sender: Any) {
//        let heroWarrior: Warrior
//        hero = heroWarrior
//        alert { (name) in
//            self.hero.name = name
//        }
//        heros.append(hero)
//
//    }
//    @IBAction func touchMagnus(_ sender: Any) {
//        let heroMagnus: Magus
//        hero = heroMagnus
//        alert { (name) in
//            self.hero.name = name
//        }
//        heros.append(hero)
//    }
    
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
            self.nameHero = textField.text!
            //name = textField.text!
            completion(textField.text!)
        }))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


