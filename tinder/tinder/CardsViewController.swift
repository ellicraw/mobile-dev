//
//  CardsViewController.swift
//  tinder
//
//  Created by Ellis Crawford on 10/29/18.
//  Copyright © 2018 Ellis Crawford. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardImageView: UIImageView!
    var cardInitialCenter: CGPoint!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardInitialCenter = cardImageView.center

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapCard(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "openProfile", sender: self)

    }
    
    @IBAction func didPanCard(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            
            print("Gesture began")
            
        }
        else if sender.state == .changed {
            
            if translation.x > 0 {
                cardImageView.center = CGPoint(x: self.cardInitialCenter.x + translation.x ,y: self.cardInitialCenter.y)
                cardImageView.transform = cardImageView.transform.rotated(by:0.003)
                
            } else if translation.x < 0 {
                cardImageView.center = CGPoint(x: self.cardInitialCenter.x + translation.x ,y: self.cardInitialCenter.y)
                cardImageView.transform = cardImageView.transform.rotated(by:-0.003)
            }
            print("Gesture is changing")
            
        } else if sender.state == .ended {
            
            print("Gesture ended")
            if translation.x > 50 {
                UIView.animate(withDuration: 0.5, animations: {
                    self.cardImageView.center = CGPoint(x: self.cardInitialCenter.x + 500 ,y: self.cardInitialCenter.y)
                })
            }
            else if translation.x < -50 {
                UIView.animate(withDuration: 0.5, animations: {
                    self.cardImageView.center = CGPoint(x: self.cardInitialCenter.x - 500 ,y: self.cardInitialCenter.y)
                })
            }
            else {
                cardImageView.center = cardInitialCenter
                cardImageView.transform = CGAffineTransform.identity
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        let vc = segue.destination as! ProfileViewController
        vc.profileImage = cardImageView.image!
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
