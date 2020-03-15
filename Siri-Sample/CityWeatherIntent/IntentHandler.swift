//
//  IntentHandler.swift
//  New Siri ShortCut Sample
//
//  Created by 박은비 on 15/03/2020.
//  Copyright © 2020 박은비. All rights reserved.
//

import Intents

/*
Intent Extension을 추가하면
Xcode는 CityWeatherIntent.swift를 추가한다.

모든 의도는 CityWeatherIntent.swift를 통하여 처리가 된다.
이를 핸들링 할수 있는 핸들러를 만들어준다.
 

*/

class IntentHandler: INExtension {
    
    /*
     이 INExtension클래스는 Intents 확장의 주요 클래스이며 SiriKit에 정보를 제공합니다.
     확장 객체는 디스패처처럼 작동하여 SiriKit에 요청을 해결하고 처리하는 데 필요한 객체를 제공합니다.
     
     이 클래스는 자체 메소드를 정의하지 않지만 구현해야하는 기본 메소드를 포함하는 프로토콜을 채택합니다
     */
    
    override func handler(for intent: INIntent) -> Any {
        return CityWeatherIntentHandler()
    }
}
