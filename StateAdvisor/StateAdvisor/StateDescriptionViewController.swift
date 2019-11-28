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
    
    
    let cities = Modules()
    
    @IBOutlet var stateDescriptionLabel: UILabel!
    
   var receivedData = ""
    
   // func changeLabelText(){
    //    stateDescriptionLabel.text = "Hello"
  //  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // get a reference to the second view controller
        let cityDescriptionViewController = segue.destination as! CityDescriptionViewController

        // set a variable in the second view controller with the data to pass
    cityDescriptionViewController.whatever = "Hello"
    
    //stateDescriptionViewController.stateDescriptionLabel.text! = "Hello"
    
    }

    
}
    extension StateDescriptionViewController: UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.cities.count
       }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "citiesCell", for: indexPath)
        cell.textLabel?.text! = "\(cities.cities)"
        
        return cell
    }
}

extension StateDescriptionViewController: UITableViewDelegate{
    
    // method to run when table view cell is tapped
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Segue to the second view controller
       self.performSegue(withIdentifier: "citySegue", sender: self)
      }
        
        /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            // get a reference to the second view controller
            let cityDescriptionViewController = segue.destination as! CityDescriptionViewController

            // set a variable in the second view controller with the data to pass
        cityDescriptionViewController.whatever = "Hello"
        
        //stateDescriptionViewController.stateDescriptionLabel.text! = "Hello"
        
        }*/
    
}
    
    
    

