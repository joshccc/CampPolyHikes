//
//  ViewController.swift
//  CampPolyHikes
//
//  Created by Josh Choi on 1/13/17.
//  Copyright © 2017 Josh Choi. All rights reserved.
//

import UIKit
import GEOSwift
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
        let image = UIImage(named: "logo.png")
        self.navigationItem.titleView = UIImageView(image: image)
        
        if let geoJSONURL = Bundle.main.url(forResource: "Trials2017", withExtension: "geojson") {
            do {
                let geometries = try Geometry.fromGeoJSON(geoJSONURL)
                if let geo = geometries?[0] as? MultiPolygon {
                    
                    if let shapesCollection = geo.mapShape() as? MKShapesCollection {
                        
                        let shapes = shapesCollection.shapes
                        
                        for shape in shapes {
                            if let polygon = shape as? MKPolygon {
                                mainMapView.add(polygon)
                            }
                        }
                    }
                    
                }
            } catch {
                print("Unable to load geojson data")
            }
        }
            // set initial location in San Luis Obispo
            let initialLocation = CLLocation(latitude: 35.282752, longitude: -120.659615)
            
            centerMapOnLocation(location: initialLocation)
    }
}

