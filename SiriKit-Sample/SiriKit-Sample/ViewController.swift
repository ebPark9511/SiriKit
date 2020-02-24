//
//  ViewController.swift
//  SiriKit-Sample
//
//  Created by 박은비 on 23/02/2020.
//  Copyright © 2020 박은비. All rights reserved.
//

import UIKit
import Intents

class ViewController: UIViewController {
    static var viewController: ViewController? = nil
    @IBOutlet weak var textView: UITextView!
    var moveClosure: ((OpenIntent?)->Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewController.viewController = self
    }
     
    
    func delay(sec: Double, closure: @escaping () -> ()) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + sec) {
            closure()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        donateInteraction()
    }
    
    // IntentsUI에서 뭔가 가져와서 작업을 해야하는것 같다... 여기서 포기!
    func donateInteraction() {
        let intent = OpenIntent.intent
         
        ViewController.viewController?.appendLog("\(String(describing: intent.waitTime))")
        ViewController.viewController?.appendLog( "\(intent.parameter)")
        
        let interaction = INInteraction(intent: intent, response: nil)
        
        interaction.donate { (error) in
            if error != nil {
                if (error as NSError?) != nil {
                    ViewController.viewController?.appendLog( "errer")
                }
            } else {
                ViewController.viewController?.appendLog( "success donate ")
                                
                        intent.suggestedInvocationPhrase = "Open"
                self.delay(sec: Double(truncating: intent.waitTime ?? 0) ) {

                    let storyboard = self.storyboard
                    guard let viewController = storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else { return }
                    if intent.parameter == DisplayType.push {
                        viewController.lable.text = "PUSH"
                        self.navigationController?.pushViewController(viewController, animated: true)
                    } else {
                        viewController.lable.text = "PRESENT"
                        self.navigationController?.present(viewController, animated: true, completion: nil)
                    }
                }
                
                
            }
        }
    }
    
    func appendLog(_ str : String) {
        DispatchQueue.main.async {
            ViewController.viewController?.textView.text.append(contentsOf: "\(str)\n")
        }
        
    }
}


class SecondViewController: UIViewController {
    @IBOutlet var lable: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
