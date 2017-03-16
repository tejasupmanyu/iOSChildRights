//
//  HomeViewController.swift
//  SwiftyPOTUSPetitions
//
//  Created by Tejas Upmanyu on 13/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var stakeButton: RoundButton!
    @IBOutlet weak var quizButton: RoundButton!
    @IBOutlet weak var actsButton: RoundButton!
    @IBOutlet weak var caseButton: RoundButton!
    @IBOutlet weak var PressButton: RoundButton!
    
    @IBOutlet weak var creditsButton: RoundButton!
    
    var stakeButtonCenter: CGPoint!
    var quizButtonCenter: CGPoint!
    var actsButtonCenter: CGPoint!
    var caseButtonCenter: CGPoint!
    var PressButtonCenter: CGPoint!
    var creditsButtonCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        PressButton.setTitle("More", for: .normal)
        
        stakeButtonCenter = stakeButton.center
        quizButtonCenter = quizButton.center
        actsButtonCenter = actsButton.center
        caseButtonCenter = caseButton.center
        PressButtonCenter = PressButton.center
        creditsButtonCenter = creditsButton.center
        
        // Do any additional setup after loading the view.
        
        stakeButton.center = PressButton.center
        actsButton.center = PressButton.center
        quizButton.center = PressButton.center
        caseButton.center = PressButton.center
        creditsButton.center = PressButton.center
        
        stakeButton.alpha = 0
        actsButton.alpha = 0
        quizButton.alpha = 0
        caseButton.alpha = 0
        creditsButton.alpha = 0
        
        
        navigationItem.title = "Butterflies & Unicorns"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func PressButton(_ sender: RoundButton) {
        
        if PressButton.currentTitle == "More"{
            
            
            UIView.animate(withDuration: 0.5, animations: {
            
                self.actsButton.alpha = 0.7
                self.caseButton.alpha = 0.7
                self.stakeButton.alpha = 0.7
                self.quizButton.alpha = 0.7
                self.creditsButton.alpha = 0.7
                
                
                
                self.actsButton.center = self.actsButtonCenter
                self.caseButton.center = self.caseButtonCenter
                self.stakeButton.center = self.stakeButtonCenter
                self.quizButton.center = self.quizButtonCenter
                self.creditsButton.center = self.creditsButtonCenter
                

                
            
            })
            
            PressButton.setTitle("Hide", for: .normal)
            
            PressButton.borderWidth = 10
            
        }
            else{
            
            UIView.animate(withDuration: 0.3, animations: {
                self.actsButton.alpha = 0
                self.caseButton.alpha = 0
                self.stakeButton.alpha = 0
                self.quizButton.alpha = 0
                self.creditsButton.alpha = 0
                
                self.actsButton.center = self.PressButton.center
                self.caseButton.center = self.PressButton.center
                self.stakeButton.center = self.PressButton.center
                self.quizButton.center = self.PressButton.center
                self.creditsButton.center = self.PressButton.center
            
            })
            
            PressButton.setTitle("More", for: .normal)
            PressButton.alpha = 0.7
            PressButton.borderWidth = 2
            }
        
    }
    
        
    
        
}


