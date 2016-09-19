//
//  Man.swift
//  walkingrunningman
//
//  Created by Shanu Gandhi on 9/17/16.
//  Copyright © 2016 Shanu Gandhi. All rights reserved.
//

import UIKit
@IBDesignable

class Man: UIView {
    @IBInspectable
    var walkValue:CGFloat = 50.0
    
    var color = UIColor.orange { didSet {setNeedsDisplay() } }
    var ison = false { didSet {setNeedsDisplay() } }
    var handvalue:CGFloat = 50.0
    
        func setwalk(walkValue: CGFloat) {
        print("walk value set")
        self.walkValue = walkValue
        print (walkValue)
        self.setNeedsDisplay()
        }
    
    
    func handsval(handvalue: CGFloat) {
        print("hand value set")
        self.handvalue = handvalue
        print (handvalue)
        self.setNeedsDisplay()
    }
    
    
    
    func displayfloor()-> UIBezierPath {
    
  let Path = UIBezierPath()
        Path.move(to: CGPoint(x: bounds.midX-350, y: (((bounds.midY+50)))))
        Path.addLine(to: CGPoint(x: bounds.midX+350, y: ((bounds.midY+50))))
        Path.lineWidth = 2.0
        Path.close()
        self.setNeedsDisplay()
        return Path
    }
        
    
    
    
    enum part {
        case left
        case right
    }
    
    func hands(Hand: part) -> UIBezierPath{
        let Path = UIBezierPath()
        Path.move(to: CGPoint(x: bounds.midX, y: (((bounds.midY-50)))))
        switch Hand {
        case .left:
            Path.addLine(to: CGPoint(x: bounds.midX - handvalue, y: ((bounds.midY))))
        case .right:
      
             Path.addLine(to: CGPoint(x: bounds.midX + handvalue, y: ((bounds.midY))))
        }
        
        Path.lineWidth = 2.0
        Path.close()
    return Path
    }
    
    func legs(leg: part) -> UIBezierPath{
        let Path = UIBezierPath()
        Path.move(to: CGPoint(x: bounds.midX, y: (((bounds.midY)))))
        
        
        switch leg {
        case .left:
            Path.addLine(to: CGPoint(x: bounds.midX - walkValue, y: ((bounds.midY)+50.0)))
        case .right:
            
            Path.addLine(to: CGPoint(x: bounds.midX + walkValue, y: ((bounds.midY)+50.0)))
        }
        
        Path.lineWidth = 2.0
        Path.close()
        return Path
    }
    
    
    
    
    
    
  
    override func draw(_ rect: CGRect) {
        color.set()
        
        let manFaceRadius = min(bounds.size.width, bounds.size.height)/8
        let manFaceCenter = CGPoint(x: (bounds.midX),y: (bounds.midY)/2)
        
        let manFace = UIBezierPath.init(arcCenter: manFaceCenter, radius:  manFaceRadius, startAngle: 0.0, endAngle: CGFloat(2*M_PI), clockwise: true)
        manFace.lineWidth = 2.0
    
        let body = UIBezierPath()
        body.move(to: CGPoint(x: bounds.midX, y: (((bounds.midY/2)+manFaceRadius))))
        body.addLine(to: CGPoint(x: bounds.midX, y: ((bounds.midY/2)+165.0)))
        body.lineWidth = 2.0
        body.close()
        
       
      
      
        
        
        
       // drawing face, body,legs
       let floorpath = displayfloor()
       manFace.stroke()
        if ison == true{
         floorpath.stroke()
        }
       body.stroke()
       hands(Hand:.left).stroke()
       hands(Hand:.right).stroke()
       legs(leg: .left).stroke()
       legs(leg:.right).stroke()
        }
        
        
       
        
      
        
        
        
        
        
        
        
        
        
        // Drawing code
    }
    


