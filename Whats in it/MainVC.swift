//
//  MainVC.swift
//  Whats in it
//
//  Created by Faisal Akhtar on 2017-04-13.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit
import MobileCoreServices

class MainVC: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    private var imgpicker:UIImagePickerController!
    var img:UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    @IBAction func cameraoption(_ sender: UIBarButtonItem) {
        
        imgpicker = UIImagePickerController()
        imgpicker.delegate = self
        imgpicker.sourceType = .camera
        imgpicker.allowsEditing = true
        imgpicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: imgpicker.sourceType)!
        self.present(imgpicker,animated:true, completion: nil)
        
    }

    
    
    

}





extension MainVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    
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
