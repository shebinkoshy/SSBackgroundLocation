//
//  SSMapView.swift
//  SSBGLocation
//
//  Created by Shebin Koshy on 27/02/20.
//  Copyright © 2020 Shebin Koshy. All rights reserved.
//

import UIKit
import MapKit

class SSMapView: UIView, MKMapViewDelegate {

    var map: MKMapView?
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        map = MKMapView(frame: UIScreen.main.bounds)
        map?.delegate = self
        self.addSubview(map!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let poly = MKPolylineRenderer(polyline: overlay as! MKPolyline)
        poly.strokeColor = UIColor.blue
        poly.lineWidth = 4.0
        return poly
    }

}
