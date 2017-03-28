//
//  tutorialViewController.swift
//  SwiftyPOTUSPetitions
//
//  Created by Tejas Upmanyu on 14/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit
import PaperOnboarding

class tutorialViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {

    @IBOutlet weak var onBoard: onBoard!
    @IBOutlet weak var getStarted: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        onBoard.dataSource = self
        onBoard.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func onboardingItemsCount() -> Int {
        return 5
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let bgColorOne = UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1)
        let bgColorTwo = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)
        let bgColorThree = UIColor(red: 168/255, green: 200/255, blue: 78/255, alpha: 1)
        let bgColorFour = UIColor(red: 60/255, green: 158/255, blue: 122/255, alpha: 1)
        
        let bgColorFive = UIColor(red: 40/255, green: 200/255, blue: 180/255, alpha: 1)
        

        
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
        let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
        
        return [("v","Hello!","Designed and Crafted by VisionArray in India","",bgColorFive,UIColor.white,UIColor.white,titleFont,descriptionFont),("list","Single Platform. All laws.","Butterflies and Unicorns provides a unique, single and unified platform for all the child related acts in the republic of India.","",bgColorOne,UIColor.white,UIColor.white,titleFont,descriptionFont),
                ("book","Case Studies","Butterflies and Unicorns provides numerous enthralling case studies & stories to impart knowledge of child related acts at a deeper level.","",bgColorTwo,UIColor.white,UIColor.white,titleFont,descriptionFont),
                ("stake","Know who care","Complete knowledge of various stakeholders at your fingertips.","",bgColorThree,UIColor.white,UIColor.white,titleFont,descriptionFont),
                ("mind","Let's be inQUIZitive","Amazing quiz game to keep the things game and making children learn through questions.","",bgColorFour,UIColor.white,UIColor.white,titleFont,descriptionFont)
                ][index]
        
        
    }
    
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 4{
            UIView.animate(withDuration: 0.3, animations: {self.getStarted.alpha = 1})
        }
    }
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 3{
            if self.getStarted.alpha == 1{
                UIView.animate(withDuration: 0.2, animations: {self.getStarted.alpha=0})
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func gotStarted(_ sender: UIButton) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set("true", forKey: "onBoardingComplete")
        userDefaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
