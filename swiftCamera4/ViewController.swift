//
//  ViewController.swift
//  swiftCamera4
//
//  Created by John Mac on 12/12/16.
//  Copyright © 2016 John Wetters. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func camera(_ sender: Any) {
        print("camera button hit")
            let cameraImage = UIImagePickerController()
            cameraImage.delegate = self
            cameraImage.sourceType = UIImagePickerControllerSourceType.camera;
            cameraImage.allowsEditing = false
            self.present(cameraImage, animated: true, completion: nil)
    }
    
    
    @IBAction func library(_ sender: Any) {
        print("library button hit")
        
        let libraryImage = UIImagePickerController()
        libraryImage.delegate = self
        libraryImage.sourceType = UIImagePickerControllerSourceType.photoLibrary;
        libraryImage.allowsEditing = true
        self.present(libraryImage, animated: true, completion: nil)
    }
    
    
    @IBAction func save(_ sender: Any) {
        print("save button hit")
        
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.6)
        let compressedJPGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressedJPGImage!, nil, nil, nil)
        
//        let alert = UIAlertView(title: "Wow",
//                                message: "Your image has been saved to Photo Library!",
//                                delegate: nil,
//                                cancelButtonTitle: "Ok")
//                                alert.show()
        
        let tapAlert = UIAlertController(title: "Wow", message: "Your image has been saved to Photo Library!", preferredStyle: UIAlertControllerStyle.alert)
            tapAlert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            self.present(tapAlert, animated: true, completion: nil)
        
        
        
        
        
//        let imagePicker = UIImagePickerController()
//        imagePicker.delegate = self
//        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
//        imagePicker.allowsEditing = true
//        self.present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        imageView.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
//        
//         print("did finish picking image")
//        imageView.image = image
//        self.dismiss(animated: true, completion: nil);
//    }


}

