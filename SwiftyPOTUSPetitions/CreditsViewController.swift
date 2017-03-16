//
//  CreditsViewController.swift
//  SwiftyPOTUSPetitions
//
//  Created by Tejas Upmanyu on 16/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit

class CreditsViewController: UITableViewController {
    
    var details = [["name":"Tejas Upmanyu","job":"iOS Developer","bio":"Brother's Keeper.","image":"me"],["name":"Shabbir Hussain","job":"Android Developer","bio":"Something in a few lines","image":"shabbir"],["name":"Shivam Bharadwaj","job":"Web Developer","bio":"Something in a few lines","image":"c1"],["name":"Sidhant Mishra","job":"Design & Support","bio":"Something in a few lines","image":"c1"],["name":"Kavya Gupta","job":"Data Curator & Design","bio":"Something in a few lines","image":"c1"],["name":"Nidhi Tiwari","job":"Data Curator & Design","bio":"Something in a few lines","image":"c1"]]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
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
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
