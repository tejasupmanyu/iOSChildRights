//
//  DetailViewController.swift
//  SwiftyPOTUSPetitions
//
//  Created by Tejas Upmanyu on 21/02/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {
    
    var detailItem: [String: String]!
    
    
    @IBOutlet weak var lawTitle: UILabel!
    
    @IBOutlet weak var referencesDetails: UILabel!
    @IBOutlet weak var punishmentDetails: UILabel!
    @IBOutlet weak var lawDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share(sender:)))
        guard detailItem != nil else { return }
        
        if let title = detailItem["title"]{
            
            if let body = detailItem["description"]{
                
                if let punishment = detailItem["punishments"]{
                    
                    if let references = detailItem["references"]{
                        
                        lawTitle.text = title
                        lawDescription.text  = body
                        punishmentDetails.text = punishment
                        referencesDetails.text = references
                        
                    }
                }
                
                
                
                
            }
        }
        navigationItem.title = title
        
        
    }
    
    func share(sender:UIView){
        
        
        let textToShare = "Check out the new Butterflies & Unicorns iOS App and get yourself up to date with the child related acts and laws."
        
        
            let objectsToShare = [textToShare]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            activityVC.popoverPresentationController?.sourceView = sender
            self.present(activityVC, animated: true, completion: nil)
            }
    
}
