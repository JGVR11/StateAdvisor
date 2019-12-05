//
//  MapViewController.swift
//  StateAdvisor
//
//  Created by Juan Vasquez on 11/26/19.
//  Copyright © 2019 Juan Vasquez. All rights reserved.
//

import Foundation
import UIKit
import MapKit



class MapViewController: UIViewController {
    
    @IBOutlet var mapView: MKMapView!
    
    var city: City?
    var places: [Place]?
    var selectedPlace: Place?
    
    func refresh(city: City?, places: [Place]?){
        self.city = city
        self.places = places
        DispatchQueue.main.async {
            self.reloadScreen()
        }
    }
    
    func reloadScreen(){
        if self.mapView == nil{
            return
        }
        let regionLocation = CLLocationCoordinate2D(latitude: self.city!.latitude, longitude: self.city!.longitude)
        var region = MKCoordinateRegion()
        region.center = regionLocation
        region.span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        self.mapView.setRegion(region, animated: true)
        // let cityLocation = CLLocation(latitude: self.city!.latitude, longitude: self.city!.longitude)
        // self.mapView.setCenter(cityLocation.coordinate, animated: true)
        self.mapView.removeAnnotations(self.mapView.annotations)
        self.places?.forEach{ place in
            let location = CLLocation(latitude: place.latitude, longitude: place.longitude)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = place.name
            self.mapView.addAnnotation(annotation)
            if self.selectedPlace != nil && self.selectedPlace?.id == place.id{
                self.mapView.selectAnnotation(annotation, animated: true)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadScreen()
    }
    
}
