//
//  ARViewController.swift
//  Wack-A-Nutcracker
//
//  Created by Miguel on 5/11/21.
//

import UIKit
import RealityKit

class ARViewController: UIViewController {

    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var arview: ARView!
    @IBOutlet weak var mainTitle: UIButton!
    @IBOutlet weak var countDownLabel: UILabel!
    var points = 0
    var highestScore = 0
    var count = 30
    var timer = false
    var gameEnd = false
    var wackAnchor:Wack.WackANutcracker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        score.text = String(points);
        countDownLabel.text = String(count)
        wackAnchor = try! Wack.loadWackANutcracker()
        wackAnchor.generateCollisionShapes(recursive: true)

        arview.scene.anchors.append(wackAnchor)
        
        wackAnchor.actions.start.onAction = { _ in
            self.changeTitle()
            if(self.highestScore>0){
                self.mainTitle.setTitle("Highest Score: \(self.highestScore)", for: .normal)
            }
            self.points = 0
            self.score.text = String(self.points)
            self.count = 30
            self.gameEnd = false
            if(self.timer == false){
                self.startTimer()
                self.timer = true
            }
            
        }
        
        wackAnchor.actions.onePoint.onAction = { _ in
            self.addPoints(by:1)
            self.addTime(by: 15)
        }
        wackAnchor.actions.twoPoint.onAction = { _ in
            self.addPoints(by:5)
            self.addTime(by: 30)
        }
        wackAnchor.actions.threePoint.onAction = { _ in
            self.addPoints(by:10)
            self.addTime(by: 30)
        }
        wackAnchor.actions.reset.onAction = { _ in
            //
        }
        wackAnchor.actions.gameEnd.onAction = { _ in
            self.count = 0
            if(self.points > self.highestScore){
                self.highestScore = self.points
            }
            self.mainTitle.setTitle("Highest Score: \(self.highestScore)", for: .normal)
            self.gameEnd = true
        }
    }
    @objc func update() {
        if(self.count > 0) {
            self.count -= 1
            countDownLabel.text = String(self.count)
        }else{
            if(gameEnd == false){
                wackAnchor.notifications.timesUp.post()
            }
            self.count = 0
        }
    }
    
    @IBAction func clickBegin(_ sender: Any) {
        wackAnchor.notifications.gameStart.post()
        
    }
    func startTimer(){
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    func addTime(by time: Int){
        self.count += time
        score.text = String(self.points)
        countDownLabel.text = String(self.count)
    }
    func addPoints(by points: Int){
        self.points += points
        score.text = String(self.points)
    }
    func changeTitle(){
        mainTitle.setTitle("Hit the Nutcrackers", for: .normal)
    }
    
    func resetGAme(){
        // scene change cancels everything
    }
    
}
