//
//  ViewController.swift
//  Whats in it
//
//  Created by Faisal Akhtar on 2017-04-13.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit
import Clarifai



class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        var app = ClarifaiApp(appID: "Of3buVZi-y3nGo08R3PwhXX046_a4W7KQpEEkGNQ", appSecret: "Rw7c2MMH87VvHTb_CI9803Yh7bdYWv7cSdtc1p4c")
        var img = ClarifaiImage(url: "http://smokeybones.com/wp-content/uploads/2015/11/smokehouse-burger.jpg")
        app?.getModelByName("food-items-v1.0", completion: { (model, error) in
            if error != nil {
                
                print(error)
                
                
            }
            else{
                
                model?.predict(on: [img!], completion: { (output, err) in
                    if err != nil {
                        
                        print (err)
                        
                    }
                    
                    else{
                        
                        for concept in (output?[0].concepts)!
                        {
                            print(concept.conceptName,concept.score)
                            
                            
                        }
                        
                        
                    }
                })
                
            }
        })

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

