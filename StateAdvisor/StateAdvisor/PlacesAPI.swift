//
//  PlacesAPI.swift
//  StateAdvisor
//
//  Created by Juan Vasquez on 12/1/19.
//  Copyright © 2019 Juan Vasquez. All rights reserved.
//

import Foundation

class PlacesAPI{
    
    private static let apiKey = "AIzaSyBlDd-Jny8xl7sjrTq4wbf5m1IcTpprBdE"
    private static let radius = 250
    private static let rankBy = "prominence"
    
    struct Response: Decodable {
        var results: [ResponsePlace]
    }
    
    struct ResponsePlace: Decodable {
        var place_id: String
        var name: String
        var geometry: ResponseGeometry
    }
    
    struct ResponseGeometry: Decodable {
        var location: ResponseLocation
    }
    
    struct ResponseLocation: Decodable {
        var lat: Double
        var lng: Double
    }
    
    typealias Result = Swift.Result<[Place], Error>
    typealias ResultClosure = (Result) -> Void
    
    
    static func findNearbyPlaces(city: City, completion: @escaping ResultClosure){
        var components = URLComponents(string: "https://maps.googleapis.com/maps/api/place/nearbysearch/json")
        
        var queryItems = [URLQueryItem]()
        let keyQueryItem = URLQueryItem(name: "key", value: apiKey)
        queryItems.append(keyQueryItem)
        let locationQueryItem = URLQueryItem(name: "location", value: "\(city.latitude),\(city.longitude)")
        queryItems.append(locationQueryItem)
        let radiusQueryItem = URLQueryItem(name: "radius", value: String(radius))
        queryItems.append(radiusQueryItem)
        let rankByQueryItem = URLQueryItem(name: "rankby", value: rankBy)
        queryItems.append(rankByQueryItem)
        
        
        components?.queryItems = queryItems
        
        let request = URLRequest(url: components!.url!)
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            let result: Result
            
            if let error = error {
                result = Result.failure(error)
            }else if let data = data{
                let decoder = JSONDecoder()
                do{
                    
                    let response = try decoder.decode(Response.self, from: data)
                    let places = response.results.map{ Place( name: $0.name, longitude: $0.geometry.location.lng, latitude: $0.geometry.location.lat, id: $0.place_id)}
                    result = Result.success(places)
                }catch{
                    result = Result.failure(error)
                }
                
            }else{
                result = Result.success([])
            }
            
            DispatchQueue.main.async {
                completion(result)
            }
        })
        task.resume()
    }
}
