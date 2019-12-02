//
//  CityDescriptionViewController.swift
//  StateAdvisor
//
//  Created by Juan Vasquez on 11/26/19.
//  Copyright © 2019 Juan Vasquez. All rights reserved.
//

import Foundation
import UIKit

class CityDescriptionViewController: UITabBarController {
    
    var city: City?
    var places: [Place]?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = city?.name
        PlacesAPI.findNearbyPlaces(city: self.city?, completion: { (PlacesAPI.Result) in
            switch PlacesAPI.Result{
            case .success(places):
                print
            }
        })
        
    }
    
    
}
