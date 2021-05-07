//
//  LoginViewController.swift
//  Wack-A-Nutcracker
//
//  Created by Miguel on 5/6/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var SIgninButton: UIButton!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.layer.cornerRadius = 22
        SIgninButton.layer.cornerRadius = 22
        password.layer.cornerRadius = 22
    }
    
    @IBAction func signinTapped(_ sender: Any) {
    }
    
    @IBAction func signupTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Signup")
        vc.modalPresentationStyle = .overFullScreen
        present(vc, animated: true)
    }
    
}
