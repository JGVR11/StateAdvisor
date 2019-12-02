//
//  Modules.swift
//  StateAdvisor
//
//  Created by Juan Vasquez on 11/27/19.
//  Copyright © 2019 Juan Vasquez. All rights reserved.
//

import Foundation

struct Models: Codable {
    
    //  let states: [State] = [ State(name: "Tennessee", description: "Green" , cities: [City(name: "Johnson City", imageUrl: "https://en.wikipedia.org/wiki/Johnson_City,_Tennessee#/media/File:Johnson_City.jpg", description: "Pila de aburrido")])]
    //let states = ["Alabama", "Florida", "North Carolina", "Tennessee", "Ohio", "Illinois", "California", "Arizona", "Colorado", "North Dakota", "South Carolina", "Oklahoma", "Minnesota", "Michigan" ]
    let cities = "Chicago"
}

struct State: Codable {
    var name: String
    // var description: String?
    var code: String
    var cityCount: Int
    // var cities: [City] = []
}

struct City: Codable {
    var name: String
    var state: String
    var imageUrl: String?
    //var description: String?
    var longitude: Double
    var latitude: Double
    var ranking: Int
}

struct Place: Codable {
    var name: String
    var longitude: Double
    var latitude: Double
    var id: String
}
