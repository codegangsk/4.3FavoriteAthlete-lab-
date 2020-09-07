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
    
    func updateView() {
        if let formAthlete = athlete {
            nameTextField.text = formAthlete.name
            ageTextField.text = formAthlete.age
            leagueTextField.text = formAthlete.league
            teamTextField.text = formAthlete.team
        }
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
            let age = ageTextField.text,
            let league = leagueTextField.text,
            let team = teamTextField.text else {return}
               
        athlete = Athlete(name: name, age: age, league: league, team: team)
        
        performSegue(withIdentifier: "unwindToTable", sender: self)
    }
}

