//
//  CreditsViewController.swift
//  SwiftyPOTUSPetitions
//
//  Created by Tejas Upmanyu on 16/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit

class CreditsViewController: UITableViewController {
    
    var details = [["name":"Tejas Upmanyu","job":"iOS Developer","bio":"Brother's Keeper.","image":"me"],["name":"Shabbir Hussain","job":"Android Developer","bio":"Something in a few lines","image":"shabbir"],["name":"Shivam Bharadwaj","job":"Web Developer","bio":"Something in a few lines","image":"c1"],["name":"Sidhant Mishra","job":"Design & Support","bio":"Something in a few lines","image":"c1"],["name":"Kavya Gupta","job":"Data Curator & Design","bio":"Something in a few lines","image":"kavya"],["name":"Nidhi Tiwari","job":"Data Curator & Design","bio":"Something in a few lines","image":"c1"]]
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationItem.title = "Team VisionArray"
       
        
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
        return details.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PeopleTableViewCell
        var person = details[indexPath.row]
        cell.backgroundImage.image = UIImage(named: person["image"]!)
        cell.nameLabel.text = person["name"]
        cell.jobLabel.text = person["job"]
        cell.bioLabel.text = person["bio"]
        return cell
    }
 

    
}
