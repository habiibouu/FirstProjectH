import UIKit 

class Presentation: UIViewController {
    @IBAction func beginPary() {
    //Action to create a two team and them hero for debbug fast
        
        GameConstants.redTeam.name = "RED"
        GameConstants.blueTeam.name = "BlUE"
        
        let heroDwarf = Dwarf()
        heroDwarf.name = "nain"
        GameConstants.redTeam.heros.append(heroDwarf)
        GameConstants.redTeam.heros[0].vitalPoint = 1
        
        let heroGiant = Colossus()
        heroGiant.name = "geant"
        GameConstants.redTeam.heros.append(heroGiant)
        GameConstants.redTeam.heros[1].vitalPoint = 1
       
        let heroMagus = Magus()
        heroMagus.name = "sorcier"
        GameConstants.redTeam.heros.append(heroMagus)
        GameConstants.redTeam.heros[2].vitalPoint = 1
    
        let heroDwarf2 = Dwarf()
        heroDwarf2.name = "nain2"
        GameConstants.blueTeam.heros.append(heroDwarf2)
        GameConstants.blueTeam.heros[0].vitalPoint = 1
        
        let heroGiant2 = Colossus()
        heroGiant2.name = "geant2"
        GameConstants.blueTeam.heros.append(heroGiant2)
        GameConstants.blueTeam.heros[1].vitalPoint = 1
        
        let heroMagus2 = Magus()
        heroMagus2.name = "sorcier2"
        GameConstants.blueTeam.heros.append(heroMagus2)
        GameConstants.blueTeam.heros[2].vitalPoint = 1
    }
    
    @IBAction func unwindToPresentation(segue:UIStoryboardSegue) { }

    override func viewDidLoad() {
        super.viewDidLoad() 
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

