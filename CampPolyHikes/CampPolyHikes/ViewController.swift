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
    
    @IBOutlet var backOutletMain: UIButton!
    @IBOutlet var nextOutletMain: UIButton!
    @IBOutlet var imageOutlet: UIImageView!
    var index = 0
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mainMapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        index = 1
        backOutletMain.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        nextOutletMain.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 1.5)

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
    
    
    @IBAction func nextImage(_ sender: Any) {
        index += 1
        self.imageGallery()
        
    }
    
    
    @IBAction func backImage(_ sender: Any) {
        index -= 1
        self.imageGallery()
    }
    
    func imageGallery() {
        if index == 1 {
            backOutletMain.isEnabled = false
            imageOutlet.image = UIImage(named: "gallery1.png")
        }
        if index == 2 {
            backOutletMain.isEnabled = true
            nextOutletMain.isEnabled = true
            imageOutlet.image = UIImage(named: "gallery2.png")
        }
        if index == 3 {
            nextOutletMain.isEnabled = false
            imageOutlet.image = UIImage(named: "gallery3.png")
        }
        
    }

}

