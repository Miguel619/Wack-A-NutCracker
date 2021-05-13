//
//  SignUpViewController.swift
//  Wack-A-Nutcracker
//
//  Created by Miguel on 5/6/21.
//

import UIKit
import RealityKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var newEmail: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var newPass: UITextField!
    
    var WackAR:Wack.WackANutcracker!
    override func viewDidLoad() {
        super.viewDidLoad()
        newEmail.layer.cornerRadius = 22
        signupButton.layer.cornerRadius = 22
        newPass.layer.cornerRadius = 22
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func createAccount(_ sender: Any) {
        if newEmail.text?.isEmpty == true {
            print("Please enter email")
            return
        }
        if newPass.text?.isEmpty == true {
            print("Please enter a password")
            return
        }
        signUp()
    }
    @IBAction func backToSignin(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func signUp(){
        Auth.auth().createUser(withEmail: newEmail.text!, password: newPass.text!){ (authResult, error) in
            guard let user = authResult?.user, error == nil else {
                print("Error \(error?.localizedDescription)")
                return
            }
            // after sign up
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Start")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
            
        }
        
        
    }
    
}
