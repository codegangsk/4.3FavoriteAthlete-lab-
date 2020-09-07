import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
        static let editAthleteSegue = "EditAthlete"
    }

    var athletes: [Athlete] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        
        return cell
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let nextViewController = segue.destination as? AthleteFormViewController {
            if let indexPath = tableView.indexPathForSelectedRow,
                segue.identifier == PropertyKeys.editAthleteSegue {
                nextViewController.athlete = athletes[indexPath.row]
            }
        }
}
    @IBAction func unwind(unwind segue: UIStoryboardSegue) {
        if let sourceViewController = segue.source as? AthleteFormViewController {
            guard let name = sourceViewController.athlete?.name,
            let age = sourceViewController.athlete?.age,
            let league = sourceViewController.athlete?.league,
            let team = sourceViewController.athlete?.team else {return}
            
            let athlete = Athlete(name: name, age: age, league: league, team: team)

            if let indexPath = tableView.indexPathForSelectedRow {
                athletes.remove(at: indexPath.row)
                athletes.insert(athlete, at: indexPath.row)
            } else {
                athletes.append(athlete)
            }
    }
}
}
