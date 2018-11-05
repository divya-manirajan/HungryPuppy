//
//  ViewController.swift
//  PuppyGame
//
//  Created by Divya Manirajan on 10/29/18.
//  Copyright © 2018 Divya Manirajan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    var munch = AVAudioPlayer()
    
    var points = 0
    
    @IBOutlet weak var pup: UIImageView!
    
    @IBOutlet weak var end: UIImageView!
    
    @IBOutlet weak var reset: UIButton!
    
    @IBOutlet weak var Points: UILabel!
    @IBOutlet weak var bone: UIImageView!
    
    override func viewDidLoad() {
        end.image = UIImage()
        points = 0
        Points.text = ("Points: \(points)")
        
        super.viewDidLoad()
        let sound = Bundle.main.path(forResource: "Yee", ofType: "mp3")
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch{
            print(error)
        }
        let sound2 = Bundle.main.path(forResource: "Yee", ofType: "mp3")
        do{
            munch = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch{
            print(error)
        }

        
        
    }
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        
        if ((pup.center.x > (bone.center.x - 31) && pup.center.x < (bone.center.x + 31)) && pup.center.y > (bone.center.y - 15) && pup.center.y < (bone.center.y + 15) ){
            
            var x = CGFloat(arc4random_uniform(300)) + 20
            var y = CGFloat(arc4random_uniform(640)) + 20
            
            bone.center = CGPoint(x: x, y: y)
            
            points += 1

            Points.text = ("Points: \(points)")
            
            
            
            if(points == 15){
                end.image = UIImage(named: "end")
                audioPlayer.play()
            }
            
        }
        
       
        }
   
    
    
    @IBAction func reset(_ sender: Any) {
        points = 0
        Points.text = ("Points: \(points)")
        end.image = UIImage()
        audioPlayer.stop()
        audioPlayer.currentTime = 0
    }
    
    }

    





