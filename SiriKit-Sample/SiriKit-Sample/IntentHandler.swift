//
//  IntentHandler.swift
//  SiriKit-Sample
//
//  Created by 박은비 on 2020/02/24.
//  Copyright © 2020 박은비. All rights reserved.
//

import UIKit
import Intents
 
/*
 Intent Extension을 추가하면
 Xcode는 OpenIntent.swift를 추가한다.

 모든 의도는 OpenIntent.swift를 통하여 처리되기 된다.
 이를 핸들링 할수 있는 핸들러를 만들어준다.
 */

import Intents

class IntentHandler: INExtension {
  
  override func handler(for intent: INIntent) -> Any {
    guard intent is OpenIntent else {
      fatalError("Unhandled intent type: \(intent)")
    }
    
    return OpenIntentHandler()
  }
}
