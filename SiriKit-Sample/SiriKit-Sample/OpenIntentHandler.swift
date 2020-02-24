//
//  OpenIntentHandler.swift
//  SiriKit-Sample
//
//  Created by 박은비 on 2020/02/24.
//  Copyright © 2020 박은비. All rights reserved.
//

import UIKit

class OpenIntentHandler: NSObject, OpenIntentHandling {
    func resolveWaitTime(for intent: OpenIntent, with completion: @escaping (OpenWaitTimeResolutionResult) -> Void) {
        completion(.unsupported(forReason: .lessThanMinimumValue))
    }
    
    func resolveParameter(for intent: OpenIntent, with completion: @escaping (DisplayTypeResolutionResult) -> Void) {
        print("resolveParameter \(intent)")
        completion(.success(with: .push))
        
    }
    
//    func resolveWaitTime(for intent: OpenIntent, with completion: @escaping (OpenWaitTimeResolutionResult) -> Void) {
//        print("resolveWaitTime \(intent)")
//        completion(.)
//    }
    
    func confirm(intent: OpenIntent,
                 completion: @escaping (OpenIntentResponse) -> Void) {
        let viewController = ViewController()
        
        viewController.moveClosure = { (openIntent) in 
//            if let openIntent = openIntent {
                completion(OpenIntentResponse.init(code: .success, userActivity: nil))
//            } else {
//                completion(OpenIntentResponse.init(code: .failure, userActivity: nil))
//            }
            
        }
         
      
    }
    
    func handle(intent: OpenIntent,
                completion: @escaping (OpenIntentResponse) -> Void) {
        completion(OpenIntentResponse.success(waitTime: intent.waitTime ?? 0, openType: intent.parameter))
    }
    
}
