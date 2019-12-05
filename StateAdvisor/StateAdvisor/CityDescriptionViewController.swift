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
        
    func refresh(city: City?, places: [Place]?){
        self.city = city
        self.places = places
        DispatchQueue.main.async {
            self.reloadScreen()
        }
    }
    
    func reloadScreen(){
        if self.tableView == nil{
            return
        }
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadScreen()
    }
}

extension CityDescriptionViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "placesCell", for: indexPath)
        cell.textLabel?.text! = places![indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "mapSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mapViewController = segue.destination as! MapViewController
        
        mapViewController.selectedPlace = places![sender as! Int]
        mapViewController.city = self.city
        mapViewController.places = self.places
        
    }
    
}
