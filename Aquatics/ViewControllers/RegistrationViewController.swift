//
//  RegistrationViewController.swift
//  Aquatics
//
//  Created by Christian Anetzberger on 16.06.18.
//  Copyright © 2018 Deepness Industries. All rights reserved.
//


// Import Alamofire
import Alamofire

import UIKit


class RegistrationViewController: UIViewController {

    //Defined a constant that holds the URL for our web service
    let URL_USER_REGISTER = "https://aquatics.deepness.industries/aquatics-app/v1/register.php"
    
    //View variables
    @IBOutlet weak var registrationInputUsername: UITextField!
    @IBOutlet weak var registrationInputPassword: UITextField!
    @IBOutlet weak var registrationInputEmail: UITextField!
    @IBOutlet weak var registrationInputName: UITextField!
    @IBOutlet weak var registrationInputPhone: UITextField!
    @IBOutlet weak var registrationFeedbackLabel: UILabel!
    
    
    
    //Button action
    @IBAction func registrationButtonSignup(_ sender: UIButton) {
        
        //creating parameters for the post request
        let parameters: Parameters=[
            "username":registrationInputUsername.text!,
            "password":registrationInputPassword.text!,
            "name":registrationInputName.text!,
            "email":registrationInputEmail.text!,
            "phone":registrationInputPhone!
        ]
        
        //Sending http post request
        Alamofire.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    self.registrationFeedbackLabel.text = jsonData.value(forKey: "message") as! String?
                }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let registrationToolBar = UIToolbar()
        registrationToolBar.sizeToFit()
        
        let registrationToolBarFlexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        
        let registrationToolBarButtonDone = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.registrationButtonDoneClicked))
        
        registrationToolBar.setItems([registrationToolBarFlexibleSpace, registrationToolBarButtonDone], animated: false)
        
        registrationInputUsername.inputAccessoryView = registrationToolBar
        registrationInputPassword.inputAccessoryView = registrationToolBar
        registrationInputEmail.inputAccessoryView = registrationToolBar
        registrationInputName.inputAccessoryView = registrationToolBar
        registrationInputPhone.inputAccessoryView = registrationToolBar
        
    }
    
    @objc func registrationButtonDoneClicked() {
        view.endEditing(true)
    }

}
