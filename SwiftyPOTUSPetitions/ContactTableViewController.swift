//
//  ContactTableViewController.swift
//  SwiftyPOTUSPetitions
//
//  Created by Tejas Upmanyu on 13/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit

class ContactTableViewController: UITableViewController {

    var contacts = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backgroundImage = UIImage(named: "hands.jpg")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        imageView.contentMode = .scaleAspectFill
        
        navigationItem.title = "Child Care - Stakeholders"
        
        let filePath = Bundle.main.url(forResource: "sampleContacts", withExtension: "json")
        
        if let url = filePath {
            if let data = try? Data(contentsOf: url) {
                let json = JSON(data: data)
                parse(json: json)
                return
                
            }
        }
        
        showError()
    }
    
    func parse(json: JSON) {
        
        for law in json["Contacts"].arrayValue
        {
            
            let name = law["name"].stringValue
            let address = law["address"].stringValue
            let details = law["details"].stringValue
            let obj = ["name":name,"address":address,"details":details]
            
            contacts.append(obj)
        }
        
        tableView.reloadData()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.7)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Contact", for: indexPath)
        let thisCase = contacts[indexPath.row]
        
        cell.textLabel?.text = thisCase["name"]
        
        return cell
    }
    
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading; please try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Contact") as? ContactDetailsViewController {
            // 2: success! Set its property
            vc.detailItem = contacts[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
