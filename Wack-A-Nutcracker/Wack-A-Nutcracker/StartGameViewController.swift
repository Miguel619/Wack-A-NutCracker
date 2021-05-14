//
//  StartGameViewController.swift
//  Wack-A-Nutcracker
//
//  Created by Miguel on 5/9/21.
//

import UIKit


class StartGameViewController: UIViewController {

    @IBOutlet weak var userDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userDisplay.text = Manager.messageText[0]


    }
    

    
    @IBAction func startPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "ARView")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
}
