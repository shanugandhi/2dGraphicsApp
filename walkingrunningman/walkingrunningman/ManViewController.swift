//
//  ViewController.swift
//  walkingrunningman
//
//  Created by Shanu Gandhi on 9/17/16.
//  Copyright © 2016 Shanu Gandhi. All rights reserved.
//

import UIKit

class ManViewController: UIViewController {

    var value=50.0
    
    
    @IBOutlet weak var passingwalkvalue: UISlider!
    
    @IBOutlet var passingval: UISwipeGestureRecognizer!
    
    @IBAction func swipetowalk(_ sender: UISwipeGestureRecognizer) {
        mann.color = UIColor.blue
        
}
        
        
    @IBAction func flooronoff(_ sender: UISwitch) {
      if  sender.isOn{
        mann.ison = true
      }
    else {
        mann.ison = false }
        
        
    }
    
    @IBAction func handsmovementupanddown(_ sender: UISlider) {
        mann.handsval(handvalue: CGFloat(sender.value))
        
    }
   
        
    
        
    @IBOutlet weak var handsmovement: UISlider!{
    didSet{
    handsmovement.transform = CGAffineTransform(rotationAngle: CGFloat(-M_PI_2))
    }
    }
    
    
    @IBOutlet weak var displaywalkvalue: UILabel!
    
    
    
    @IBOutlet weak var mann: Man!
    @IBAction func slider(_ sender: UISlider) {
        mann.setwalk(walkValue: CGFloat(sender.value))
        displaywalkvalue.text! = (String(sender.value))
    }

    @IBOutlet weak var man: Man!

}

