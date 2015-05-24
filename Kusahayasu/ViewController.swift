//
//  ViewController.swift
//  Kusahayasu
//
//  Created by Kazuki Ohashi on 2015/05/24.
//  Copyright (c) 2015年 Kazuki Ohashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    var imageNameArray: [String] = ["kusa"]
    var imageIndex: Int = 0
    @IBOutlet var haikeiImageView: UIImageView!
    var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        haikeiImageView.image = UIImage(named: "mypage")
    }
    
    @IBAction func selectedOne() {
        imageIndex = 1
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch: UITouch = touches.first as! UITouch
        let location: CGPoint = touch.locationInView(self.view)
        //処理を書く
        if imageIndex != 0 {
            var image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            imageView = UIImageView(frame: CGRectMake(0, 0, 40, 40))
            imageView.image = image
            imageView.center = CGPointMake(location.x, location.y)
            self.view.addSubview(imageView)
        }
    }
    
    @IBAction func back() {
        self.imageView.removeFromSuperview()
    }
    
    @IBAction func selectBackground() {
        var imagePickerController: UIImagePickerController = UIImagePickerController()
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        self.presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func save() {
        
        let rect: CGRect = CGRectMake(0, 30, 320, 380)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.renderInContext(UIGraphicsGetCurrentContext())
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(capture, nil, nil, nil)
        UIGraphicsEndImageContext()
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        var image: UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        haikeiImageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

