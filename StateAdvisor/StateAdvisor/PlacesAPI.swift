//
//  PlacesAPI.swift
//  StateAdvisor
//
//  Created by Juan Vasquez on 12/1/19.
//  Copyright © 2019 Juan Vasquez. All rights reserved.
//

import Foundation

struct Response: Decodable {
    var businesses: [ResponsePlace]
}

struct ResponsePlace: Decodable {
    var id: String
    var name: String
    var image_url: String
    var rating: Double
    var coordinates: ResponseCoordinates
}

struct ResponseCoordinates: Decodable {
    var latitude: Double
    var longitude: Double
}

typealias Result = Swift.Result<[Place], Error>
typealias ResultClosure = (Result) -> Void


class PlacesAPI{
    
    private static let apiKey = "Bearer Tcnm-MuKqUob9Kxn6RG-qzHvTJs_74WP-GHOtZu7R6a-kHKP5Ce04XwEjFdJriqo1iX7KoijhWEX6ZuavyaM7TMwrtOKhJJUatVpohkdQegWyVLou2nd_KNhNWXoXXYx"
    private static let radius = 1000
    private static let limit = 25
    
    
    static func findNearbyPlaces(city: City, completion: @escaping ResultClosure){
        var components = URLComponents(string: "https://api.yelp.com/v3/businesses/search")
        
        var queryItems = [URLQueryItem]()
        let latitudeQueryItem = URLQueryItem(name: "latitude", value: String(city.latitude))
        queryItems.append(latitudeQueryItem)
        let longitudeQueryItem = URLQueryItem(name: "longitude", value: String(city.longitude))
        queryItems.append(longitudeQueryItem)
        let radiusQueryItem = URLQueryItem(name: "radius", value: String(radius))
        queryItems.append(radiusQueryItem)
        let limitQueryItem = URLQueryItem(name: "limit", value: String(limit))
        queryItems.append(limitQueryItem)
        
        
        components?.queryItems = queryItems
        
        var request = URLRequest(url: components!.url!)
        request.setValue(apiKey, forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            let result: Result
            
            if let error = error {
                result = Result.failure(error)
            }else if let data = data{
                if let prettyStr = prettyPrintedJSONString(fromData: data) {
                                   print("JSON=\n\(prettyStr)")
                               }
                let decoder = JSONDecoder()
                do{
                    
                    let response = try decoder.decode(Response.self, from: data)
                    let places = response.businesses.map{ Place( name: $0.name, longitude: $0.coordinates.longitude, latitude: $0.coordinates.latitude, id: $0.id)}
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
    
    private class func prettyPrintedJSONString(fromData data: Data) -> String? {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: .init(rawValue: 0))
            let prettyData = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
            return String(data: prettyData, encoding: .utf8)
        } catch {
            return nil
        }
    }
    
}
