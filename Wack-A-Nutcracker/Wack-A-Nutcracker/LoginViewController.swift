//
//  LoginViewController.swift
//  Wack-A-Nutcracker
//
//  Created by Miguel on 5/6/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var SIgninButton: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var sign: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.layer.cornerRadius = 22
        SIgninButton.layer.cornerRadius = 22
        password.layer.cornerRadius = 22
        
        // Looks for single or multiple taps.
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // checkUserInfo()
    }
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func signinTapped(_ sender: Any) {
        checkCred()
        
    }
    
    @IBAction func signupTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Signup")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
    func checkCred() {
        if username.text?.isEmpty == true {
            print("Please enter an email")
            return
        }
        if password.text?.isEmpty == true {
            print("Please enter a password")
            return
        }
        login()
    }
    
    func login() {
        Auth.auth().signIn(withEmail: username.text!, password: password.text!) { [weak self] authResult, error in
            guard let strongSelf = self else {return}
            if let error = error {
                print(error.localizedDescription)
                self?.sign.text = error.localizedDescription
                return
            }
            self!.checkUserInfo()
        }
    }
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            Manager.messageText.append(self.username.text!)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "Start")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
        
    }
    
}
