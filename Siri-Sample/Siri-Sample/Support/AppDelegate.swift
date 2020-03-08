//
//  AppDelegate.swift
//  Siri-Sample
//
//  Created by 박은비 on 08/03/2020.
//  Copyright © 2020 박은비. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        // get the city name
        guard let intent = userActivity.interaction?.intent as? CityWeatherIntent,
            let city = intent.city,
            let cityValue = city.value else {
                return false
        }
        
        // get the dsired view
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "WeatherViewController") as! WeatherViewController
        vc.cityName = cityValue
        
        // present the desired view
        let rootViewController = window?.rootViewController as? UINavigationController
        rootViewController?.pushViewController(vc, animated: true)
        
        return true
    }


}

