//
//  CityWeatherIntentHandler.swift
//  CityWeatherIntent
//
//  Created by 박은비 on 08/03/2020.
//  Copyright © 2020 박은비. All rights reserved.
//

import UIKit
import WeatherKit

// 여기서 값을 받아 핸들링함.
class CityWeatherIntentHandler: NSObject, CityWeatherIntentHandling {
    func handle(intent: CityWeatherIntent, completion: @escaping (CityWeatherIntentResponse) -> Void) {
        let weatherManager = WeatherManager()
        let cities = weatherManager.cities
        
        guard let city = intent.city,
            cities.contains(city.displayString) else {
                completion(CityWeatherIntentResponse.failureNoCity())
            return
        }
        weatherManager.getWeather(at: city.displayString) { weatherInfo in
            completion(CityWeatherIntentResponse.success(city: city.displayString, weather: weatherInfo.briefWeather)) 
        }
    }
    
    func confirm(intent: CityWeatherIntent, completion: @escaping (CityWeatherIntentResponse) -> Void) {
        completion(CityWeatherIntentResponse(code: .ready, userActivity: nil))
    }

    func resolveCity(for intent: CityWeatherIntent,
                     with completion: @escaping (CityStringResolutionResult) -> Void) {
        guard let city = intent.city else {
            return
        }
        
        completion(.success(with: city ))
    }
}
