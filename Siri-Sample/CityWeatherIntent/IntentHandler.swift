//
//  IntentHandler.swift
//  CityWeatherIntent
//
//  Created by 박은비 on 08/03/2020.
//  Copyright © 2020 박은비. All rights reserved.
//

import Intents
/*
Intent Extension을 추가하면
Xcode는 OpenIntent.swift를 추가한다.

모든 의도는 OpenIntent.swift를 통하여 처리되기 된다.
이를 핸들링 할수 있는 핸들러를 만들어준다.
*/

class IntentHandler: INExtension {
    
    override func handler(for intent: INIntent) -> Any {
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        
        return CityWeatherIntentHandler()
    }
    
}
