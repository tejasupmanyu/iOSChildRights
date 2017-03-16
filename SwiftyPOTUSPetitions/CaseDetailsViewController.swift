//
//  CaseDetailsViewController.swift
//  SwiftyPOTUSPetitions
//
//  Created by Tejas Upmanyu on 13/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit

class CaseDetailsViewController: UIViewController {

    var detailItem: [String: String]!
    
    @IBOutlet weak var caseTitle: UILabel!
    
    @IBOutlet weak var caseDetails: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share(sender:)))
        guard detailItem != nil else { return }
        
        if let title = detailItem["title"]{
            if let story = detailItem["story"]{
                
                caseTitle.text = title
                caseDetails.text = story
                
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
