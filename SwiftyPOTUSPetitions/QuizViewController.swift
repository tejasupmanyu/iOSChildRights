//
//  QuizViewController.swift
//  SwiftyPOTUSPetitions
//
//  Created by Tejas Upmanyu on 13/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit
import AVFoundation

class QuizViewController: UIViewController {
    
    
    let questions = ["Child Labour act prevents children working upto the age of?", "What is the minimum age of marriage for girls?", "sexual harassment is a crime?"]
    let answers = [["14", "12", "384"], ["18", "16", "21"], ["Yes", "No", "None"]]
    
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0
//    var player: AVPlayer?
//    let videoURL = Bundle.main.url(forResource: "bg", withExtension: "mp4")

    @IBOutlet weak var backGround: UIImageView!
    @IBOutlet weak var scoreBoard: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
   
    @IBOutlet weak var thumbs: SpringImageView!
    
    
    override func viewDidAppear(_ animated: Bool) {
        newQuestion()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
//        // Do any additional setup after loading the view.
//        
//        player = AVPlayer(url: videoURL!)
//        player?.actionAtItemEnd = .none
//        player?.isMuted = true
//        
//        let playerLayer = AVPlayerLayer(player: player)
//        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
//        playerLayer.zPosition = -1
//        
//        playerLayer.frame = view.frame
//        
//        view.layer.addSublayer(playerLayer)
//        
//        player?.play()
//        
//        
//        
//        
//        
//        // if video ends, will restart
//        
//        func playerItemDidReachEnd() {
//            player!.seek(to: kCMTimeZero)
//        }
        
    

}
    
    
    
    
    @IBAction func perform(_ sender: UIButton) {
        if (sender.tag == Int(rightAnswerPlacement))
        {
            print ("RIGHT!")
             thumbs.image = UIImage(named: "thumbsup")
            thumbs.alpha = 1
            thumbs.animation = "pop"
            thumbs.animate()
            UIView.animate(withDuration: 1, animations: {
            self.thumbs.alpha = 0
            })
            points += 1
            scoreBoard.text = String(points)
        }
        else
        {
            print ("WRONG!!!!!!")
            thumbs.image = UIImage(named: "thumbsdown")
            thumbs.alpha = 1
            thumbs.animation = "pop"
            thumbs.animate()
            UIView.animate(withDuration: 1, animations: {
                self.thumbs.alpha = 0
            })

            
        }
        
        if (currentQuestion != questions.count)
        {
            newQuestion()
        }
        else
        {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
                // do stuff 4 seconds later
            }
            if let vc = storyboard?.instantiateViewController(withIdentifier: "showScore") as? ScoreViewController {
                // 2: success! Set its property
                vc.score = points
                
                // 3: now push it onto the navigation controller
                navigationController?.pushViewController(vc, animated: true)
            }
        }

    }
    
    func newQuestion()
    {
        questionLabel.text = questions[currentQuestion]
        
        
        rightAnswerPlacement = arc4random_uniform(2) + 1
        
        var button: UIButton = UIButton()
        var x = 1
        for i in 1...2 {
            
            button = view.viewWithTag(i) as! UIButton
            
            if i == Int(rightAnswerPlacement){
                button.setTitle(answers[currentQuestion][0], for: .normal)
            }
            else
            {
                button.setTitle(answers[currentQuestion][x], for: .normal)
                x = 2
            }
            
        }
        currentQuestion += 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
