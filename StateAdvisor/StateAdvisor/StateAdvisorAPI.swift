//
//  StateAdvisorAPI.swift
//  StateAdvisor
//
//  Created by Juan Vasquez on 12/1/19.
//  Copyright © 2019 Juan Vasquez. All rights reserved.
//

import Foundation

class StateAdvisorAPI {
    
    static var states: [State]?
    static var cities: [City]?
    
    public class func fetchStates() -> [State]{
        if states == nil{
            states = loadJsonFile(type: State.self, fileName: "states").sorted(by: { $0.name < $1.name })
        }
        return states!
        
    }
    
    public class func fetchStateCities(state: State) -> [City]{
        if cities == nil{
            cities = loadJsonFile(type: City.self, fileName: "cities").sorted(by: { $0.name < $1.name })
        }
        return cities!.filter({ $0.state == state.code })
        
    }
    
    private class func loadJsonFile<T: Decodable>(type: T.Type, fileName: String) -> [T]{
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json"){
            
            do{
                
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                
                return try decoder.decode(Array<T>.self, from: data)
                
            }catch{
                print("error:\(error)")
            }
        }
        return[]
    }
    
}
