//
//  ViewController.swift
//  SwiftyPOTUSPetitions
//
//  Created by Tejas Upmanyu on 21/02/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchResultsUpdating{
    
    var laws = [[String: String]]()
    var filteredLaws = [[String: String]]()
    let resultSearchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidAppear(_ animated: Bool) {
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        filteredLaws = laws
    
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        self.tableView.reloadData()
        
        let backgroundImage = UIImage(named:"ActsHome.jpg")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        imageView.contentMode = .scaleAspectFill
        
        
        navigationItem.title = "Child Acts in India"
        
        
        let filePath = Bundle.main.url(forResource: "sampleLaw", withExtension: "json")
        
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
        
        for law in json["Acts"].arrayValue
        {
            
            let title = law["title"].stringValue
            let description = law["description"].stringValue
            let punishments = law["punishments"].stringValue
            let references = law["references"].stringValue
            let obj = ["title":title,"description":description,"punishments":punishments, "references": references]
            
            laws.append(obj)
        }
        filteredLaws = laws
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                   return self.filteredLaws.count
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.7)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        var law = filteredLaws[indexPath.row]
        cell.textLabel?.text = law["title"]
        cell.detailTextLabel?.text = law["description"]
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text! == "" {
            filteredLaws = laws
        }
        else{
            filteredLaws = laws.filter({($0["title"]?.lowercased().contains(searchController.searchBar.text!.lowercased()))!})
        }
        
        self.tableView.reloadData()
    }
    
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading; please try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ActDetails") as? ActDetailsViewController {
            // 2: success! Set its property
            vc.detailItem = laws[indexPath.row]
            vc.indexOfCell = indexPath.row

            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }

    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return UITableViewCellEditingStyle.delete
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
                let share = UITableViewRowAction(style: .default, title: "Share") { action, indexPath in
            print("share button tapped")
        }
        share.backgroundColor = UIColor.blue
        
        return [share]
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

