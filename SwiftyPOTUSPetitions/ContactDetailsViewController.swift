//
//  ContactDetailsViewController.swift
//  SwiftyPOTUSPetitions
//
//  Created by Tejas Upmanyu on 13/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit

class ContactDetailsViewController: UIViewController {

    var detailItem: [String: String]!
    
    @IBOutlet weak var contactName: UILabel!
    
    @IBOutlet weak var contacts: UILabel!
    @IBOutlet weak var contactDetails: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share(sender:)))

        guard detailItem != nil else { return }
        
        if let name = detailItem["name"]{
            if let address = detailItem["address"]{
                if let details = detailItem["details"]{
                    
                contactName.text = name
                contacts.text = address
                contactDetails.text = details
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
