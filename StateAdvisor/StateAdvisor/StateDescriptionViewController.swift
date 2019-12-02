//
//  StateDescriptionViewController.swift
//  StateAdvisor
//
//  Created by Juan Vasquez on 11/26/19.
//  Copyright © 2019 Juan Vasquez. All rights reserved.
//

import Foundation
import UIKit

class StateDescriptionViewController: UIViewController {
    
    var state: State?
    var cities: [City]?
    
    
    
   // func changeLabelText(){
    //    stateDescriptionLabel.text = "Hello"
  //  }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.title = "Cities of \(state!.name) (\(state!.code))"
        self.cities = StateAdvisorAPI.fetchStateCities(state: state!)
        //stateDescriptionLabel.text = state!.description
    }
    
    
    
}
    extension StateDescriptionViewController: UITableViewDataSource, UITableViewDelegate{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return cities!.count
       }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "citiesCell", for: indexPath)
        cell.textLabel?.text! = cities![indexPath.row].name
        
        return cell
    }
//}

//extension StateDescriptionViewController: UITableViewDelegate{
    
    // method to run when table view cell is tapped
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Segue to the second view controller
            self.performSegue(withIdentifier: "citySegue", sender: indexPath.row)
      }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            // get a reference to the second view controller
            let cityDescriptionViewController = segue.destination as! CityDescriptionViewController

            // set a variable in the second view controller with the data to pass
            
          cityDescriptionViewController.city = cities![sender as! Int]
        
        }

    
}
    
    
    

