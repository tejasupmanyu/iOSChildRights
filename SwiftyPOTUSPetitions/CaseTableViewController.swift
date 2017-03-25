//
//  CaseTableViewController.swift
//  SwiftyPOTUSPetitions
//
//  Created by Tejas Upmanyu on 13/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit

class CaseTableViewController: UITableViewController,UISearchResultsUpdating {
    
    var cases = [[String: String]]()
    var filteredCases = [[String: String]]()
    let resultSearchController = UISearchController(searchResultsController: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filteredCases = cases
        self.resultSearchController.searchResultsUpdater = self
        self.resultSearchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        self.tableView.tableHeaderView = self.resultSearchController.searchBar
        self.tableView.reloadData()
        
        
        
        let backgroundImage = UIImage(named: "teach.jpg")
        let imageView = UIImageView(image: backgroundImage)
        self.tableView.backgroundView = imageView
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        imageView.contentMode = .scaleAspectFill
        
        navigationItem.title = "Child Acts - Case Studies"
        
        let filePath = Bundle.main.url(forResource: "sampleCases", withExtension: "json")
        
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
        
        for law in json["Cases"].arrayValue
        {
            
            let title = law["title"].stringValue
            let story = law["story"].stringValue

            let obj = ["title":title,"story":story]
            
            cases.append(obj)
        }
        filteredCases = cases
        tableView.reloadData()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCases.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.7)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Case", for: indexPath)
        let thisCase = filteredCases[indexPath.row]
        
        cell.textLabel?.text = thisCase["title"]
        
        return cell
    }
    
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text! == "" {
            filteredCases = cases
        }
        else{
            filteredCases = cases.filter({($0["title"]?.lowercased().contains(searchController.searchBar.text!.lowercased()))!})
        }
        
        self.tableView.reloadData()
    }


    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading; please try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Case") as? CaseDetailsViewController {
            // 2: success! Set its property
            vc.detailItem = cases[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    

}
