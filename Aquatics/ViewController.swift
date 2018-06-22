//
//  ViewController.swift
//  Aquatics
//
//  Created by Christian Anetzberger on 11.06.18.
//  Copyright © 2018 Deepness Industries. All rights reserved.
//
// Das ist soooo toll!


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sideNavConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideNavBackgroundBlur: UIVisualEffectView!
    @IBOutlet weak var sideNavView: UIView!
    @IBOutlet weak var aquarium_1: UIImageView!
    @IBOutlet weak var aquarium_2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // SideNavigation gesture open
       sideNavConstraint.constant = -200
        aquarium_1.layer.cornerRadius = 15
        aquarium_2.layer.cornerRadius = 15
        aquarium_1.layer.zPosition = 1
        aquarium_2.layer.zPosition = 2
        sideNavView.layer.zPosition = 10000
    }

    
    
    @IBAction func SideNacGestureSwipeToggle(_ sender: UIPanGestureRecognizer) {
   
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view).x
            if translation > 0 {    //swipe right
                
                if sideNavConstraint.constant < 20 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.sideNavConstraint.constant += translation
                        self.view.layoutIfNeeded()
                    })
                }
                
            } else {    //swipe left
                
                if sideNavConstraint.constant > -200 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.sideNavConstraint.constant += translation / 7
                        self.view.layoutIfNeeded()
                    })
                }
                
            }

        } else if sender.state == .ended {

            if sideNavConstraint.constant < -50 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.sideNavConstraint.constant = -200
                    self.view.layoutIfNeeded()
                })
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.sideNavConstraint.constant = 0
                    self.view.layoutIfNeeded()
                })
            }

        }
    }
}

