//
//  Modules.swift
//  StateAdvisor
//
//  Created by Juan Vasquez on 11/27/19.
//  Copyright © 2019 Juan Vasquez. All rights reserved.
//

import Foundation

struct Modules {
    
    let states: [State] = [ State(name:"Tennessee", description: "Green" , cities: [City(name: "Johnson City", imageUrl: "https://en.wikipedia.org/wiki/Johnson_City,_Tennessee#/media/File:Johnson_City.jpg", description: "Pila de aburrido")])]
    //let states = ["Alabama", "Florida", "North Carolina", "Tennessee", "Ohio", "Illinois", "California", "Arizona", "Colorado", "North Dakota", "South Carolina", "Oklahoma", "Minnesota", "Michigan" ]
    let cities = "Chicago"
}

struct State {
    let name: String
    let description: String
    let cities: [City]
}

struct City{
    let name: String
    let imageUrl: String
    let description: String
}

