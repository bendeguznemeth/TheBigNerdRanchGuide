//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Németh Bendegúz on 2018. 12. 03..
//  Copyright © 2018. Németh Bendegúz. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
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
        
        let showLocationButton = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        showLocationButton.setTitle("Show Location", for: .normal)
        showLocationButton.setTitleColor(UIColor.blue, for: .normal)
        showLocationButton.sizeToFit()
        
        showLocationButton.addTarget(self, action: #selector(MapViewController.zoomOnCurrentLocation(_:)), for: .touchUpInside)
        
        showLocationButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(showLocationButton)
        
        showLocationButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        showLocationButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
        
        mapView.delegate = self
        locationManager.delegate = self
        configureLocationServices()
        
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
    
    @objc func zoomOnCurrentLocation(_ button: UIButton) {
        if let coordinate = locationManager.location?.coordinate {
            mapView.showsUserLocation = true
            let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(coordinateRegion, animated: true)
        } else {
            print("coordinates not found")
        }
    }
    
    func configureLocationServices() {
        if CLLocationManager.authorizationStatus() != .authorizedAlways, CLLocationManager.locationServicesEnabled() {
            locationManager.requestAlwaysAuthorization()
        } else {
            print("not autorized or not enabled")
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
