//
//  AppDelegate.swift
//  SampleApp
//
//  Created by Shebin Koshy on 03/03/20.
//  Copyright © 2020 Shebin Koshy. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let some = SSBGLocationManager()
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        some.delegate = self
        let version = OperatingSystemVersion(majorVersion: 13, minorVersion: 0, patchVersion: 0)
        if ProcessInfo.processInfo.isOperatingSystemAtLeast(version) {
            
        } else {
            let window = UIWindow(frame: UIScreen.main.bounds)
            let vc = UIViewController(nibName: nil, bundle: nil)
            vc.view.frame = UIScreen.main.bounds
            let map = SSMapView()
            map.map?.isZoomEnabled = true
            SampleAnnotation.annotationSetup(mapView: map)
            map.map?.camera.altitude = 70000
            vc.view.addSubview(map)
            window.rootViewController = vc
            self.window = window
            window.makeKeyAndVisible()
            print("alt:\(map.map!.camera.altitude) locationssssss:\(some.allLocations().count)")
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


extension AppDelegate: SSBGLocationDelegate {
    func ssBGLocationManager(_ locationManager: SSBGLocationManager, didUpdateLocations locations: [Any]) {
        let locations: [CLLocation] = locationManager.allLocations() as! [CLLocation]
        let coordinates = locations.map { $0.coordinate }
        print("didUpdateLocations:\(coordinates)")
    }
    
}
