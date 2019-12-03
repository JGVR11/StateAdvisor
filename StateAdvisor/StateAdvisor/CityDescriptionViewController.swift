//
//  CityDescriptionViewController.swift
//  StateAdvisor
//
//  Created by Juan Vasquez on 12/2/19.
//  Copyright © 2019 Juan Vasquez. All rights reserved.
//

import Foundation
import UIKit

class CityDescriptionViewController: UIViewController {
    var city: City?
    var places: [Place]?
    @IBOutlet var tableView: UITableView!
    
    func refresh(){
        self.tableView.reloadData()
    }
}

extension CityDescriptionViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlacesCell", for: indexPath)
               cell.textLabel?.text! = places![indexPath.row].name
               return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places!.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      // Segue to the second view controller
          self.performSegue(withIdentifier: "mapSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // get a reference to the second view controller
        let mapViewController = segue.destination as! MapViewController

        // set a variable in the second view controller with the data to pass
      mapViewController.place = places![sender as! Int]
    
    }
    
}
