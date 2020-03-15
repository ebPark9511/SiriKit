//
//  CityWeatherIntentHandler.swift
//  New Siri ShortCut Sample
//
//  Created by 박은비 on 15/03/2020.
//  Copyright © 2020 박은비. All rights reserved.
//

import UIKit
import WeatherKit
import Intents


class CityWeatherIntentHandler: NSObject, CityWeatherIntentHandling {
    func resolveCity(for intent: CityWeatherIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        
        guard let city = intent.city else {
            return
        }
        
        completion(.success(with: city ))
    }
    
    func confirm(intent: CityWeatherIntent, completion: @escaping (CityWeatherIntentResponse) -> Void) {
        completion(CityWeatherIntentResponse(code: .ready, userActivity: nil))
    }

    func handle(intent: CityWeatherIntent, completion: @escaping (CityWeatherIntentResponse) -> Void) {
        let weatherManager = WeatherManager()
        let cities = weatherManager.cities
        guard let city = intent.city, cities.contains(city) else {
            completion(CityWeatherIntentResponse.failureNoCity(intent.city ?? "City"))
            return
        }
        weatherManager.getWeather(at: city) { weatherInfo in
            completion(CityWeatherIntentResponse.success(weather: weatherInfo.briefWeather, city: city))
        }
    }
}
