//
//  ActDetailsViewController.swift
//  HackathonPrototype
//
//  Created by Tejas Upmanyu on 25/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit


class ActDetailsViewController: UITableViewController {

    var detailItem: [String: String]!
    var texts : [String]!
    var Headings : [String]!
    var indexOfCell = 0
    var viewImage = ["hands","girl_flower","fr1"]

    
    @IBOutlet weak var HeaderImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard detailItem != nil else { return }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share(sender:)))
        HeaderImageView.image = UIImage(named: viewImage[indexOfCell])
        if let title = detailItem["title"]{
            
            if let body = detailItem["description"]{
                
                if let punishment = detailItem["punishments"]{
                    
                    if let references = detailItem["references"]{
                        
                        texts = [body,punishment,references]
                        Headings = [title,"Punishments & Fines","References"]
                        
                    }
                }
                
            }
        }

        
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ActDetailsTableViewCell
        cell.CellHeaderLabel.text? = Headings[indexPath.row]
        cell.CellTextView.text? = texts[indexPath.row]
        
        return cell
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.estimatedRowHeight = 500
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    func share(sender:UIView){
        
        
        let textToShare = "Check out the new Butterflies & Unicorns iOS App and get yourself up to date with the child related acts and laws."
        
        
        let objectsToShare = [textToShare]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        activityVC.popoverPresentationController?.sourceView = sender
        self.present(activityVC, animated: true, completion: nil)
    }


}
