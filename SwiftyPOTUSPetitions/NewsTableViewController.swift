//
//  NewsTableViewController.swift
//  HackathonPrototype
//
//  Created by Tejas Upmanyu on 29/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    var articles = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        performSelector(inBackground: #selector(fetchJSON), with: nil)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
    }
    
    func fetchJSON() {
        let urlString: String
        
       
        urlString = "https://newsapi.org/v1/articles?source=the-times-of-india&sortBy=top&apiKey=8d2c815b8c5b46a58006b5d3883ed362"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                let json = JSON(data: data)
                
                if json["status"].stringValue == "ok" {
                    self.parse(json: json)
                    return
                }
            }
        }
        
        
        performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
    }
    
    func parse(json: JSON) {
        for result in json["articles"].arrayValue {
            let title = result["title"].stringValue
            let description = result["description"].stringValue
            let url = result["url"].stringValue
            let urlToImage = result["urlToImage"].stringValue
            
            let obj = ["title": title, "desc": description, "url": url,"urlToImage":urlToImage]
            articles.append(obj)
        }
        
        tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
    }

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed; please check your connection and try again.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articles.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleViewCell
        
        let article = articles[indexPath.row]
        
        cell.NewsTitle.text = article["title"]
        cell.NewsDescription.text = article["desc"]
        if let image = try? UIImage(data: Data(contentsOf: URL(string: article["urlToImage"]!)!))
        {
            cell.ThumbNail.image = image
        }
        
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailNews") as? DetailNewsViewController {
            // 2: success! Set its property
            vc.detailItem = articles[indexPath.row]
            vc.indexOfCell = indexPath.row
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }

    }

}
