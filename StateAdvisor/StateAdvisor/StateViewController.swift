//
//  ViewController.swift
//  StateAdvisor
//
//  Created by Juan Vasquez on 10/15/19.
//  Copyright © 2019 Juan Vasquez. All rights reserved.
//
import Foundation
import UIKit

class StateViewController: UITableViewController {
    
    let states = Modules()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states.states.count
       }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatesCell", for: indexPath)
        cell.textLabel?.text! = "\(states.states)"
        
        return cell
    }
    
    // method to run when table view cell is tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Segue to the second view controller
        self.performSegue(withIdentifier: "stateSegue", sender: self)
    }
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            // get a reference to the second view controller
            let stateDescriptionViewController = segue.destination as! StateDescriptionViewController

            // set a variable in the second view controller with the data to pass
        stateDescriptionViewController.receivedData = "Hello"
        
        //stateDescriptionViewController.stateDescriptionLabel.text! = "Hello"
        
        }
    
    }

