import UIKit 

class Presentation: UIViewController {
    @IBAction func beginPary() {
        GameConstants.redTeam.name = "RED"
        GameConstants.blueTeam.name = "BlUE"
        
        let heroDwarf = Dwarf()
        heroDwarf.name = "nain"
        GameConstants.redTeam.heros.append(heroDwarf)
        
        let heroGiant = Colossus()
        heroGiant.name = "geant"
        GameConstants.redTeam.heros.append(heroGiant)
       
        let heroMagus = Magus()
        heroMagus.name = "sorcier"
        GameConstants.redTeam.heros.append(heroMagus)
    
        let heroDwarf2 = Dwarf()
        heroDwarf2.name = "nain2"
        GameConstants.blueTeam.heros.append(heroDwarf2)
        
        let heroGiant2 = Colossus()
        heroGiant2.name = "geant2"
        GameConstants.blueTeam.heros.append(heroGiant2)
        
        let heroMagus2 = Magus()
        heroMagus2.name = "sorcier2"
        GameConstants.blueTeam.heros.append(heroMagus2)
    }

    override func viewDidLoad() {
        super.viewDidLoad() 
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

