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

class MapViewController: UIViewController {
    
    private var mapView: MKMapView!
    private var segmentedControl: UISegmentedControl!
    private var showLocationButton: UIButton!
    private var showPinButton:UIButton!
    
    private let locationManager = CLLocationManager()
    
    private var points: [MKPointAnnotation] = []
    
    private var currentPinIndex = 0
    
    override func loadView() {
        
        mapView = MKMapView()
        self.view = mapView
        
        //TODO : függvényekbe külön, button-ok osztályváltozóba
        addsegmentedControl()
        addShowLocationButton()
        addShowPinButton()
        
        let standardString = NSLocalizedString("Standard", comment: "Standard map view")
        let satelliteString = NSLocalizedString("Satellite", comment: "Satellite map view")
        let hybridString = NSLocalizedString("Hybrid", comment: "Hybrid map view")
        
        segmentedControl = UISegmentedControl(items: [standardString, satelliteString, hybridString])
        
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
        segmentedControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        
        let margins = self.view.layoutMarginsGuide
        
        segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        
        
        
        showLocationButton = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        showLocationButton.setTitle("Show Location", for: .normal)
        showLocationButton.setTitleColor(UIColor.blue, for: .normal)
        showLocationButton.sizeToFit()
        
        showLocationButton.addTarget(self, action: #selector(MapViewController.zoomOnCurrentLocation(_:)), for: .touchUpInside)
        
        showLocationButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(showLocationButton)
        
        showLocationButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        showLocationButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        
        showPinButton = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        showPinButton.setTitle("Show Pin", for: .normal)
        showPinButton.setTitleColor(UIColor.blue, for: .normal)
        showPinButton.sizeToFit()
        
        showPinButton.addTarget(self, action: #selector(MapViewController.showAPin(_:)), for: .touchUpInside)
        
        showPinButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(showPinButton)
        
        showPinButton.bottomAnchor.constraint(equalTo: showLocationButton.topAnchor, constant: -8).isActive = true
        showPinButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
        
        configureLocationServices()
        
        makePoints()
        mapView.addAnnotations(points)
        
    }
    
    @IBAction func mapTypeChanged(_ segControl: UISegmentedControl) {
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
    
    @IBAction func zoomOnCurrentLocation(_ button: UIButton) {
        if let coordinate = locationManager.location?.coordinate {
            mapView.showsUserLocation = true
            let coordinateRegion = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(coordinateRegion, animated: true)
        } else {
            print("coordinates not found")
        }
    }
    
    @IBAction func showAPin(_ button: UIButton) {
        let coordinateRegion = MKCoordinateRegion(center: points[currentPinIndex].coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapView.setRegion(coordinateRegion, animated: true)
        currentPinIndex += 1
        if currentPinIndex == points.count {
            currentPinIndex = 0
        }
    }
    
    private func configureLocationServices() {
        if CLLocationManager.authorizationStatus() != .authorizedAlways, CLLocationManager.locationServicesEnabled() {
            locationManager.requestAlwaysAuthorization()
        } else {
            print("not autorized or not enabled")
        }
    }
    
    private func makePoints() {
        let annotation0 = MKPointAnnotation()
        annotation0.coordinate = CLLocationCoordinate2D(latitude: 47.667701, longitude: 16.505663)
        points.append(annotation0)
        
        let annotation1 = MKPointAnnotation()
        annotation1.coordinate = CLLocationCoordinate2D(latitude: 47.677578, longitude: 17.651187)
        points.append(annotation1)
        
        let annotation2 = MKPointAnnotation()
        annotation2.coordinate = CLLocationCoordinate2D(latitude: 47.513994, longitude: 19.053102)
        points.append(annotation2)
    }
    
    private func addsegmentedControl() {
        
    }
    
    private func addShowLocationButton() {
        
    }
    
    private func addShowPinButton() {
        
    }

}
