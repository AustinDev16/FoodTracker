//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Austin on 8/1/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    
    @IBOutlet weak var nameTextField: UITextField!
   
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    /* 
    This value is passed by 'MealTableViewController' from the segue or as part of a new meal
 */
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Handle user input in text field through a delegate
        nameTextField.delegate = self
        checkValidMealName()
        
    }

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        // disable save button while typing
        saveButton.enabled = false
    }
    
    func checkValidMealName(){
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMealName()
        navigationItem.title = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        // Dismiss picker upon user cancellation
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        photoImageView.image = selectedImage
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    // MARK: Navigation
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    // configure view controller before it's presented
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = nameTextField.text ?? ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            
            meal = Meal(name: name, photo: photo, rating: rating)
        }
    }
    
    
    // MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        
        // Hide keyboard if visible
        nameTextField.resignFirstResponder()
        
        //
        let imagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = .PhotoLibrary
        
        imagePickerController.delegate = self
        
        presentViewController(imagePickerController, animated: true, completion: nil)
        
        
    }




}

