//
//  ContentView.swift
//  SSBGLocation
//
//  Created by Shebin Koshy on 12/02/20.
//  Copyright © 2020 Shebin Koshy. All rights reserved.
//

import SwiftUI
import MapKit

@available(iOS 13.0, *)
struct MapView: UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> SSMapView {
        SSMapView(frame: .zero)
    }

    func updateUIView(_ mapView: SSMapView, context: UIViewRepresentableContext<MapView>) {
        SampleAnnotation.annotationSetup(mapView: mapView)
    }
    
    
}


@available(iOS 13.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}


class SampleAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D

    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
    
    class func annotationSetup(mapView: SSMapView) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate?
        let locations = appDelegate?.some.allLocations()
        var arCoordinates = [CLLocationCoordinate2D]()
        for location in locations! {
            let coordinate = (location as! CLLocation).coordinate
            let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            mapView.map?.setRegion(region, animated: true)
            let annotation = SampleAnnotation(coordinate: coordinate)
            mapView.map?.addAnnotation(annotation)
            arCoordinates.append(coordinate)
        }
        let polyline = MKPolyline(coordinates: arCoordinates, count: arCoordinates.count)
        mapView.map?.addOverlay(polyline)
    }
}
