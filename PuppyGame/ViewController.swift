//
//  ViewController.swift
//  PuppyGame
//
//  Created by Divya Manirajan on 10/29/18.
//  Copyright © 2018 Divya Manirajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var location = CGPoint(x: 100, y: 100)
    
    var points = 0
    
    @IBOutlet weak var pup: UIImageView!
    
    @IBOutlet weak var bone: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x:view.center.x + translation.x,
                                  y:view.center.y + translation.y)
        }
        recognizer.setTranslation(CGPoint.zero, in: self.view)
        if(pup.center == bone.center){
            var w = 78
            var z = 89
            location = CGPoint(x: w, y: z)
            pup.center = location
        }
        
        }
     
    }
        //location
        //if loop
    




