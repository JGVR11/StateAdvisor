//
//  CityDescriptionViewController.swift
//  StateAdvisor
//
//  Created by Juan Vasquez on 11/26/19.
//  Copyright © 2019 Juan Vasquez. All rights reserved.
//

import Foundation
import UIKit

class StateAdvTabBarViewController: UITabBarController {
    
    var state: State?
    var city: City?
    var places: [Place]?
    
    @IBAction func cityDescription(_ sender: Any) {
        self.performSegue(withIdentifier: "webSegue", sender: sender)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "webSegue"{
            let webViewController = segue.destination as! WebViewController
            webViewController.city = self.city
            webViewController.state = self.state
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = city?.name
        PlacesAPI.findNearbyPlaces(city: self.city!, completion: { (Result) in
            switch Result{
            case .success(let places):
                self.places = places
                for vc in self.viewControllers!{
                    if vc is MapViewController{
                        (vc as! MapViewController).refresh(city: self.city, places: self.places)
                    }
                    else if vc is CityDescriptionViewController{
                        (vc as! CityDescriptionViewController).refresh(city: self.city, places: self.places)
                    }
                    
                }
            case .failure(let error):
                print("fetch error = \(error)")
            }
        })
        
    }
    
    
}
