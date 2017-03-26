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
    var viewImage = ["hands","girl_flower","gr1"]
    var fontSize: CGFloat = 19.0
    
    @IBOutlet weak var LightSwitch: UISwitch!
    @IBOutlet weak var FontSlider: UISlider!
    
    @IBAction func FontSizeSlider(_ sender: Any){
        fontSize = CGFloat(FontSlider.value)
        tableView.reloadData()
    }
    @IBOutlet weak var NightModeLabel: UILabel!
    @IBOutlet weak var HeaderImageView: UIImageView!
    
    @IBAction func LightSwitch(_ sender: UISwitch) {
        if sender.isOn{
           tableView.reloadData()
           print("did it change?")
           
        }
        else
        {
            print("Turned OFF")
            tableView.reloadData()
            UIView.animate(withDuration: 0.5, animations: { self.NightModeLabel.alpha = 1})
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard detailItem != nil else { return }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share(sender:)))
        HeaderImageView.image = UIImage(named: viewImage[indexOfCell])
        LightSwitch.isOn = false
        
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
        
        // change fontSize According to slider
        let defaultFont = UIFont(name: "AvenirNext-Regular", size: 19.0)
        cell.CellTextView.font = UIFont(name: (defaultFont!.fontName), size: fontSize)
        
        if LightSwitch.isOn{
            cell.backgroundColor = UIColor.black
            cell.CellTextView.backgroundColor = UIColor.black
            cell.CellTextView.textColor = UIColor.white
            return cell
        }
        else
        {
            cell.backgroundColor = UIColor.white
            cell.CellTextView.backgroundColor = UIColor.white
            cell.CellTextView.textColor = UIColor.black
            return cell
        }
        
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
