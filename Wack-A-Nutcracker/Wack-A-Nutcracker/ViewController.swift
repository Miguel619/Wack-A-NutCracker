//
//  ViewController.swift
//  Wack-A-Nutcracker
//
//  Created by Miguel on 5/6/21.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    var wackAnchor:Wack.WackANutcracker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        wackAnchor = try! Wack.loadWackANutcracker()
        wackAnchor.generateCollisionShapes(recursive: true)
        
        arView.scene.anchors.append(wackAnchor)
        
    }
    @IBAction func startGame(_ sender: Any) {
        wackAnchor.notifications.gameStart.post()
    }
}
