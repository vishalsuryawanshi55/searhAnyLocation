//
//  ViewController.swift
//  searchLocation
//
//  Created by Student P_04 on 16/09/19.
//  Copyright © 2019 vishal. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController,UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        locationText.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let geo = CLGeocoder()
       // geo.geocodeAddressString(locationText.text!)  completionHandler: CLGeocodeCompletionHandler)
        geo.geocodeAddressString(locationText.text!) { (placeMarks, error) in
            let placeMark = placeMarks?.first!
            let point = placeMark?.location?.coordinate
            let span = MKCoordinateSpanMake(0.01, 0.01)
            let region = MKCoordinateRegion(center: point!,span: span)
            self.mapView.region = region
            let annotation = MKPointAnnotation()
            annotation.coordinate = point!
            self.mapView.addAnnotation(annotation)
            
        }
        return true
    }
    
    @IBOutlet weak var locationText: UITextField!

    @IBOutlet weak var mapView: MKMapView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

