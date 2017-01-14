//
//  ViewController.swift
//  CampPolyHikes
//
//  Created by Josh Choi on 1/13/17.
//  Copyright © 2017 Josh Choi. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mainMapView: MKMapView!
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mainMapView.setRegion(coordinateRegion, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // set initial location in San Luis Obispo
        let initialLocation = CLLocation(latitude: 35.282752, longitude: -120.659615)
        
        centerMapOnLocation(location: initialLocation)
    }
}

