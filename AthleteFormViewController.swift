//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Sophie Kim on 2020/09/05.
//

import Foundation
import UIKit

class AthleteFormViewController: UIViewController {
    @IBOutlet var AthleteFormViewController: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leagueTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    
    var athlete: Athlete?
    
    override func viewDidLoad() {
        updateView()
    }
    
    @IBAction func save(_ sender: Any) {
        guard let name = nameTextField.text,
            let age = ageTextField.text,
            let league = leagueTextField.text,
            let team = teamTextField.text else {return}
        
        athlete = Athlete(name: name, age: age, league: league, team: team)
    }
    
    func updateView() {
        if let athlete = athlete {
            nameTextField.text = athlete.name
            ageTextField.text = athlete.age
            leagueTextField.text = athlete.league
            teamTextField.text = athlete.team
        }
        
    }
}


