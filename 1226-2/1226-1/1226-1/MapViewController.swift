//
//  MapViewController.swift
//  1226-1
//
//  Created by 곽혜진 on 2016. 12. 26..
//  Copyright © 2016년 hyejin. All rights reserved.
//

import UIKit
import SKMaps


class MapViewController: UIViewController, SKMapViewDelegate {
    
    var mapView: SKMapView!
    var long = 38.900244
    var lat = -77.044866


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        _ = Bundle.main.path(forResource: "mapCreatorFile", ofType: "JSON")
        
        mapView = SKMapView(frame: self.view.frame)
        
        //        let rect = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height)
        
        mapView.delegate = self
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        mapView.applySettingsFromFile(atPath: "mapCreatorFile.json")
        mapView.settings.rotationEnabled = false
        mapView.settings.followUserPosition = false
        mapView.settings.showCompass = true
        
        
        self.view.addSubview(mapView)
        
        //MARK: set the map region
        let region = SKCoordinateRegion(center: CLLocationCoordinate2DMake(long, lat), zoomLevel: 7)
        mapView.visibleRegion = region
        

        let annotation = SKAnnotation()
        annotation.identifier = 10
        annotation.annotationType = SKAnnotationType.purple
        annotation.location = CLLocationCoordinate2DMake(long, lat)
        let animationSettings = SKAnimationSettings()
        mapView.addAnnotation(annotation, with: animationSettings)
        
        self.addUI()


    
    }
    
    
    private func addUI() {
        
        let positionMeButton: UIButton = UIButton(type:.system)
        positionMeButton.frame = CGRect(x: 10, y: self.view.frame.height - 110, width: 100, height: 40)
        positionMeButton.setTitle("Position me", for: UIControlState.normal)
        positionMeButton.addTarget(self, action:#selector(MapViewController.positionMe), for: UIControlEvents.touchUpInside)
        positionMeButton.backgroundColor = UIColor.lightGray
        positionMeButton.autoresizingMask = UIViewAutoresizing.flexibleTopMargin
        positionMeButton.titleLabel?.adjustsFontSizeToFitWidth = true
        self.view.addSubview(positionMeButton);
        
        let positionPlusHeadingButton: UIButton = UIButton(type:.system)
        positionPlusHeadingButton.frame = CGRect(x: self.view.frame.width - 110, y: self.view.frame.height - 110, width: 100, height: 40)
        positionPlusHeadingButton.setTitle("Show heading", for: UIControlState.normal)
        positionPlusHeadingButton.addTarget(self, action:#selector(MapViewController.showPositionerWithHeading), for: UIControlEvents.touchUpInside)
        positionPlusHeadingButton.backgroundColor = UIColor.lightGray
        positionPlusHeadingButton.autoresizingMask = UIViewAutoresizing.flexibleTopMargin
        positionPlusHeadingButton.titleLabel?.adjustsFontSizeToFitWidth = true
        self.view.addSubview(positionPlusHeadingButton);
    }
    
    internal func positionMe() {
        mapView.settings.showCurrentPosition = true
        mapView.settings.followUserPosition = true
        mapView.settings.headingMode = SKHeadingMode.rotatingHeading
        mapView.centerOnCurrentPosition()
    }
    func showPositionerWithHeading() {
        mapView.settings.followUserPosition = true
        mapView.settings.headingMode = SKHeadingMode.rotatingMap
    }

    
    

//    func mapView(mapView: SKMapView!, didTapAtCoordinate coordinate:CLLocationCoordinate2D) {
//        
//        let alert = UIAlertController(title: "Tap Gesture", message: "메세지", preferredStyle: .alert)
//        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//        
//        alert.addAction(action)
//        
//        
//    }
    
    
    
    

}

