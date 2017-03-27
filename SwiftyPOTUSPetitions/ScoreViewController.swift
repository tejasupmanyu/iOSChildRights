//
//  ScoreViewController.swift
//  SwiftyPOTUSPetitions
//
//  Created by Tejas Upmanyu on 15/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit


class ScoreViewController: UIViewController {

    var score: Int?
    var s = ""
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var rewardImage: UIImageView!
    @IBOutlet weak var scoreBoard: UILabel!
    @IBOutlet weak var highScoreBoard: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
        navigationItem.hidesBackButton = true
        rewardImage.alpha = 0.0
        homeButton.alpha = 1.0
        let userDefaults = UserDefaults.standard
        var highScore = userDefaults.integer(forKey: "highScore")
        
        
        
        
        
        if let v = score{
            s = "\(v)"
            if highScore < v{
                highScore = v
                userDefaults.set(highScore, forKey: "highScore")
                UIView.animate(withDuration: 0.3, animations: {
                self.rewardImage.alpha = 1})
            }
        }
        
        scoreBoard.text = s
        highScoreBoard.text = String(highScore)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
