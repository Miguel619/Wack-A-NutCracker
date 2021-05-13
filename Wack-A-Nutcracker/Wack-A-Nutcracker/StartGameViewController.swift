//
//  StartGameViewController.swift
//  Wack-A-Nutcracker
//
//  Created by Miguel on 5/9/21.
//

import UIKit


class StartGameViewController: UIViewController {

    // @IBOutlet weak var ArView: ARView!
    
    // var wackAnchor:Wack.WackANutcracker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        wackAnchor = try! Wack.loadWackANutcracker()
//        wackAnchor.generateCollisionShapes(recursive: true)
//
//        ArView.scene.anchors.append(wackAnchor)
    }
    

    
    @IBAction func startPressed(_ sender: Any) {
        // wackAnchor.notifications.gameStart.post()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "ARView")
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
}
