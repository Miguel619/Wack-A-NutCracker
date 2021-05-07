//
//  SignUpViewController.swift
//  Wack-A-Nutcracker
//
//  Created by Miguel on 5/6/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var newUsername: UITextField!
    @IBOutlet weak var newEmail: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var newPass: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        newUsername.layer.cornerRadius = 22
        newEmail.layer.cornerRadius = 22
        signupButton.layer.cornerRadius = 22
        newPass.layer.cornerRadius = 22
        
    }
    

    @IBAction func createAccount(_ sender: Any) {
    }
    @IBAction func backToSignin(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
}
