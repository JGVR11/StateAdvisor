//
//  States.swift
//  StateAdvisor
//
//  Created by Juan Vasquez on 10/15/19.
//  Copyright © 2019 Juan Vasquez. All rights reserved.
//

import Foundation
import UIKit

class States: NSObject{
    var states: String
    var cities: String
    var thingsToDo: String
    
    init(states: String, cities: String, thingsToDo: String){
        self.states = states
        self.cities = cities
        self.thingsToDo = thingsToDo
        
        super.init()
    }
    
    
    
}
