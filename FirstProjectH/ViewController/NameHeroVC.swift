//
//  NameHeroVC.swift
//  FirstProjectH
//
//  Created by Habib Bouriche on 10/11/2017.
//  Copyright © 2017 Kevin Bravo. All rights reserved.
//

import UIKit

class NameHeroVC: UIViewController {
    @IBAction func touchDwarf(_ sender: Any) {
        alert()
    }
    @IBAction func touchColossus(_ sender: Any) {
        alert()
    }
    @IBAction func touchWarrior(_ sender: Any) {
        alert()
    }
    @IBAction func touchMagnus(_ sender: Any) {
        alert()
    }
    
    
    func alert(){
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
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


