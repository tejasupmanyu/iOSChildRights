//
//  QuizLaunchViewController.swift
//  SwiftyPOTUSPetitions
//
//  Created by Tejas Upmanyu on 13/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit
import AVFoundation
class QuizLaunchViewController: UIViewController {
    
//    var audioPlayer : AVAudioPlayer? {
//        get {
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            return appDelegate.audioPlayer
//        }
//        set {
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            appDelegate.audioPlayer = newValue
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        playSound()
        perform(#selector(showNavController), with: nil, afterDelay: 1)
        
        
    }
    
//    func playSound()
//        
//    {
//        let musicPlay = NSURL(fileURLWithPath: Bundle.main.path(forResource: "nar", ofType: "mp3")!)
//        do{
//            audioPlayer = try AVAudioPlayer(contentsOf:musicPlay as URL)
//            audioPlayer?.prepareToPlay()
//            audioPlayer?.play()
//            audioPlayer?.numberOfLoops = -1
//            
//        }catch {
//            print("Error getting the audio file")
//        }
//    }
    
    
    
    
    func showNavController()
    {
        performSegue(withIdentifier: "QuizSplashScreen", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
