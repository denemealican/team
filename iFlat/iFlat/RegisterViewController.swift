//
//  RegisterViewController.swift
//  iFlat
//
//  Created by Özge Meva Demiröz on 01/12/2016.
//  Copyright © 2016 SE 301. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var user = User()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var countryPickerView: UIPickerView!
    @IBOutlet weak var birtDarePackerView: UIDatePicker!
    @IBOutlet weak var genderPickerView: UIPickerView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        repeatPasswordTextfield.delegate = self
        
        passwordTextField.delegate = self
        
        nameTextField.delegate = self
        
        lastNameTextField.delegate = self
        
        genderPickerView.delegate = self
        genderPickerView.dataSource = self
        
        countryPickerView.dataSource = self
        countryPickerView.delegate = self
        
        
    }
        
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func nameTextFieldEditingEnd(_ sender: UITextField) {
        
        user.name = sender.text
     
    }
    
    @IBAction func lastNameTextFieldEditingEnd(_ sender: UITextField) {
        
        user.surname = sender.text
    }
    
    @IBAction func emailTextFieldEditingEnd(_ sender: UITextField) {
        
        user.email = sender.text
    }
    
    @IBAction func passwordTextFieldEditingEnd(_ sender: UITextField) {
        
        user.password = sender.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            
            return User.staticGender[row]
        }
            
        else {
            
            return User.allCountryList[row]
        }
        
        
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    

    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0{
            
            return User.staticGender.count
        }
            
        else {
            
            return User.allCountryList.count
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 0{
            
            user.Gender  = User.staticGender[row]
            
            
        }
        
        if pickerView.tag == 1{
            
            
            // user.country
        }
        
        
        
    }
    
    
    
    func passwordCheck()->Bool{
        
        if user.password == repeatPasswordTextfield.text {
            
            return true
        }
            
        else {
            
            return false
        }
    }
    

   
    
}
 

