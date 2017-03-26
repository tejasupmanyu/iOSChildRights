//
//  ContactDetailsTableViewController.swift
//  HackathonPrototype
//
//  Created by Tejas Upmanyu on 26/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ContactDetailsTableViewController: UITableViewController {

    @IBOutlet var ContactMap: MKMapView!
    
    @IBOutlet weak var HeaderImage: UIImageView!
    
    var detailItem: [String: String]!
    var texts : [String]!
    var Headings : [String]!
    var FloatLatitude: Float!
    var FloatLongitude: Float!
    var span: MKCoordinateSpan!
    var indexOfCell = 0
    var viewImage = ["boys","girl_flower","boys"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share(sender:)))
        HeaderImage.image = UIImage(named: viewImage[indexOfCell])
        guard detailItem != nil else { return }
        span = MKCoordinateSpanMake(0.002, 0.002)
        
        if let name = detailItem["name"]{
            if let address = detailItem["address"]{
                if let details = detailItem["details"]{
                    if let lat = detailItem["lattitude"]{
                        if let long = detailItem["longitude"]{
                            
                            Headings = [name,"Address"]
                            texts = [details,address]
                            FloatLatitude = NSString(string: lat).floatValue
                            FloatLongitude = NSString(string: long).floatValue
                            if let flat = FloatLatitude{
                                print(flat)
                                if let flong = FloatLongitude{
                                    print(flong)
                                    let location = CLLocationCoordinate2DMake(CLLocationDegrees(flat), CLLocationDegrees(flong))
                                    let region = MKCoordinateRegionMake(location, span)
                                    ContactMap.setRegion(region, animated: true)
                                    let annotation = MKPointAnnotation()
                                    annotation.coordinate = location
                                    annotation.title = name
                                    annotation.subtitle = address
                                    
                                    ContactMap.addAnnotation(annotation)
                                    
                                }
                            }
                            
                            
                        }
                    }
                    
                    
                }
                
            }
            navigationItem.title = name
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
        return 2
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
