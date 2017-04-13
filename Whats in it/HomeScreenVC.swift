//
//  HomeScreenVC.swift
//  Whats in it
//
//  Created by Faisal Akhtar on 2017-04-13.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit
import MobileCoreServices
import Clarifai

class HomeScreenVC: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    private var imgpicker:UIImagePickerController!
    var img:UIImage!
    var ingredients = [Ingredients]()
    var counter = 0
    @IBOutlet weak var actind: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func takeapicture(_ sender: AnyObject) {
        imgpicker = UIImagePickerController()
        imgpicker.delegate = self
        imgpicker.sourceType = .camera
        imgpicker.allowsEditing = true
        imgpicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: imgpicker.sourceType)!
        self.present(imgpicker,animated:true, completion: nil)

        
        
    }
    
    
    
    
    
    
    @IBAction func startquery(_ sender: AnyObject) {
        ingredients.removeAll()
        self.getIngredients()
        actind.startAnimating()
 
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            print(self.ingredients)
            self.actind.stopAnimating()
            self.performSegue(withIdentifier: "listSeg", sender: self)
        }
        //getIngredients()
        //actind.stopAnimating()
       // UIApplication.shared.beginIgnoringInteractionEvents()
            //print("In the delay")
            //print(self.ingredients)
        
       // self.actind.stopAnimating()
      //  UIApplication.shared.endIgnoringInteractionEvents()
        //print(self.ingredients)
        
        
    }
    
    
    
    
    
    
    
    
    
    
    func getIngredients()
    {
        
        
        
        var app = ClarifaiApp(appID: "Of3buVZi-y3nGo08R3PwhXX046_a4W7KQpEEkGNQ", appSecret: "Rw7c2MMH87VvHTb_CI9803Yh7bdYWv7cSdtc1p4c")
        var img = ClarifaiImage(image: self.img!)
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
                            let newIngredient = Ingredients(name: concept.conceptName, score: Double(concept.score))
                            self.ingredients.append(newIngredient)
                            print("adding data")
                            
                        }
                        
                        
                    }
                })
                
            }
        })
            
            
            
            
            
            print("finished")
        
        
        
        
    }
    
    
    
    
    

    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "listSeg") {
            
            
            let viewController = segue.destination as! ListVC;
            viewController.ingredients = self.ingredients
        }
    }
    
    
    
    
}



extension HomeScreenVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediatyp = info[UIImagePickerControllerMediaType] as! String
        
        if mediatyp == (kUTTypeImage as String)
        {
            
            self.imgView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            self.img = info[UIImagePickerControllerOriginalImage] as? UIImage
            
            
            
        }
        else
        {
            
            print("Not an image")
        }
        self.dismiss(animated: true, completion: nil);
    }
    
    
    
    
    
    
    
}






