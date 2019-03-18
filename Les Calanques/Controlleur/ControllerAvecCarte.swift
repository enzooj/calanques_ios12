//
//  ControllerAvecCarte.swift
//  Les Calanques
//
//  Created by Jouny Enzo on 18/03/2019.
//  Copyright © 2019 JounyCorp. All rights reserved.
//

import UIKit
import MapKit

class ControllerAvecCarte: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var MapView: MKMapView!
    
    var calanques: [Calanque] = CalanqueCollection().all()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MapView.delegate = self
        addAnnotations()
    }
    
    func addAnnotations() {
        for calanque in calanques {
     
            //     let annotation = MKPointAnnotation()
            //     annotation.coordinate = calanque.coordonnee
            //     annotation.title = calanque.nom
            //     MapView.addAnnotation(annotation)
       
            let annotation = MonAnnotation(calanque)
            MapView.addAnnotation(annotation)
        
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseIdentifier = "reuseID"
        if annotation.isKind(of: MKUserLocation.self) {
            return nil
        }
        
        if let anno = annotation as? MonAnnotation {
            var annotationView = MapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: anno, reuseIdentifier: reuseIdentifier)
           annotationView?.image = UIImage(named: "placeholder")
                annotationView?.canShowCallout = true
                return annotationView
            } else {
                return annotationView
            }
        }
       
        return nil
        
    }
    
    
    
    @IBAction func segmentedChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 : MapView.mapType = MKMapType.standard
        case 1 : MapView.mapType = .satellite
        case 2 : MapView.mapType = .hybrid
        default: break
            
           
            
        }
    }
   
    @IBAction func getPosition(_ sender: Any) {
    }
    

}
