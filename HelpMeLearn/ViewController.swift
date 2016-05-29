//
//  ViewController.swift
//  HelpMeLearn
//
//  Created by Yves NICOLAS on 29/05/2016.
//  Copyright © 2016 Yvni. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties

    @IBOutlet weak var learnSetname: UITextField!
    @IBOutlet weak var learnSetNameLabel: UILabel!
    @IBOutlet weak var learnSetImage: UIImageView!
    @IBOutlet weak var scoreControl: Score!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // the controller is the delegate for its text field
        learnSetname.delegate = self
    }


    // MARK: Actions
    
   
    @IBAction func tapOnImage(sender: UITapGestureRecognizer) {
        
        // Hide the keyboard if user taps on image when editing text field
        learnSetname.resignFirstResponder()
        
        // Create an image controller to pickup image from photo libraries
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
 
        // make this view controller the delegate of the image picker controller so that this view controller is notified when the user has chosen the image
        imagePickerController.delegate = self
        
        //display the image pickup controller
        self.presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // for a text field, this hides keyboard among other things
        learnSetname.resignFirstResponder()

        return true
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        
        learnSetNameLabel.text = textField.text
        textField.text = nil
    }
    
    // MARK: Image pick control delegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        
        // Appel doc says dismissViewController should be called on the presented view controller
        // says also that if called on presented, UiKit will make sure it is done by the presenting
        // so both lines of code  work
//        self.dismissViewControllerAnimated(true, completion: nil)
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        learnSetImage.image = selectedImage
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}

