//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Németh Bendegúz on 2018. 12. 03..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        
        mapView = MKMapView()
        
        self.view = mapView
        
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8)
        
        let margins = self.view.layoutMarginsGuide
        let leadingConstraints = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        
        segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        topConstraint.isActive = true
        leadingConstraints.isActive = true
        
//        trailingConstraint.isActive = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
        
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
