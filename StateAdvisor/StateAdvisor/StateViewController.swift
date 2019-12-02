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
    
    var states: [State]?
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        states = StateAdvisorAPI.fetchStates()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return states!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatesCell", for: indexPath)
        let state = states![indexPath.row]
        cell.textLabel?.text! = "\(state.name) (\(state.code))"
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "stateSegue", sender: indexPath.row)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let stateDescriptionViewController = segue.destination as! StateDescriptionViewController
        
        stateDescriptionViewController.state = states![sender as! Int]
        
    }
    
}

