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
import MessageUI

class ContactDetailsTableViewController: UITableViewController {

    @IBOutlet var ContactMap: MKMapView!
    
    @IBOutlet weak var dismissPopUpButton: UIButton!
    @IBOutlet weak var HeaderImageView: UIImageView!
    
    var detailItem: [String: String]!
    var texts : [String]!
    var Headings : [String]!
    var FloatLatitude: Float!
    var FloatLongitude: Float!
    var span: MKCoordinateSpan!
    var indexOfCell = 0
    var viewImage = ["boys","girl_flower","boys"]
    
    var fontSize: CGFloat = 19.0
    var effect: UIVisualEffect!
    
    @IBOutlet weak var VisualEffectView: UIVisualEffectView!
    @IBOutlet var SettingsPopUp: UIView!
    @IBOutlet var ContactsPopup: UIView!
    @IBOutlet weak var LightSwitch: UISwitch!
    @IBOutlet weak var FontSlider: UISlider!
    
    @IBOutlet weak var dismissContactButton: UIButton!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var mailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBAction func SettingsButton(_ sender: UIButton) {
        animateIn()
    }
    @IBAction func DismissPopUp(_ sender: UIButton) {
        animateOut()
        VisualEffectView.effect = nil
    }
    @IBAction func FontSizeSlider(_ sender: UISlider) {
        fontSize = CGFloat(FontSlider.value)
        tableView.reloadData()
    }
    @IBOutlet weak var dismissContactsButton: UIButton!

    @IBAction func dismissContacts(_ sender: UIButton) {
        
        animateOutContacts()
        
                VisualEffectView.effect = nil

    }
    
    @IBAction func websiteButton(_ sender: UIButton) {
        
        if let url = URL(string: websiteLabel.text!){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    
    
    @IBAction func mailButton(_ sender: UIButton) {
        //sendEmail()
    }
    
//    func sendEmail() {
//        let composeVC = MFMailComposeViewController()
//        composeVC.mailComposeDelegate = self
//        // Configure the fields of the interface.
//        composeVC.setToRecipients([mailLabel.text!])
//        composeVC.setSubject("")
//        composeVC.setMessageBody("", isHTML: false)
//        // Present the view controller modally.
//        self.present(composeVC, animated: true, completion: nil)
//    }
    
//    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
//        controller.dismiss(animated: true)
//    }
    
    @IBAction func ContactsButton(_ sender: UIButton) {
        animateInContacts()
    }
    
    
    @IBAction func phoneButton(_ sender: UIButton) {
        
        guard let number = URL(string: "telprompt://" + phoneLabel.text!) else { return }
        UIApplication.shared.open(number, options: [:], completionHandler: nil)

    }
    
   
    @IBOutlet weak var visitButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var MailButton: UIButton!
    
    @IBOutlet weak var NightModeLabel: UILabel!
    
    
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
        
        effect = VisualEffectView.effect
        VisualEffectView.effect = nil
        SettingsPopUp.layer.cornerRadius = 10
        ContactsPopup.layer.cornerRadius = 10
        
        visitButton.layer.cornerRadius = 5
        MailButton.layer.cornerRadius = 5
        callButton.layer.cornerRadius = 5
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(share(sender:)))
        HeaderImageView.image = UIImage(named: viewImage[indexOfCell])
        
        dismissContactButton.layer.cornerRadius = 5
        dismissPopUpButton.layer.cornerRadius = 5
        
        guard detailItem != nil else { return }
        span = MKCoordinateSpanMake(0.002, 0.002)
        
        if let name = detailItem["name"]{
            if let address = detailItem["address"]{
                if let details = detailItem["details"]{
                    if let lat = detailItem["lattitude"]{
                        if let long = detailItem["longitude"]{
                            if let phone = detailItem["phone"]{
                                if let mail = detailItem["mail"]{
                                    if let website = detailItem["website"]{
                                        
                                        Headings = [name,"Address"]
                                        texts = [details,address]
                                        mailLabel.text = mail
                                        phoneLabel.text = phone
                                        websiteLabel.text = website
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
                    }
                    
                    
                }
                
            }
            navigationItem.title = name
        }
        
        
    }
    
    func animateIn() {
        self.view.addSubview(SettingsPopUp)
        SettingsPopUp.center = self.HeaderImageView.center
        
        SettingsPopUp.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        SettingsPopUp.alpha = 0
        
        UIView.animate(withDuration: 0.4, animations: {self.VisualEffectView.effect = self.effect
            self.SettingsPopUp.alpha = 1
            self.SettingsPopUp.transform = CGAffineTransform.identity
        })
    }
    
    func animateOut()
    {
        UIView.animate(withDuration: 0.3, animations: {self.SettingsPopUp.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.SettingsPopUp.alpha = 0
        }, completion: {(success: Bool) in self.SettingsPopUp.removeFromSuperview()})
    }
    
    func animateInContacts() {
        self.view.addSubview(ContactsPopup)
        ContactsPopup.center = self.HeaderImageView.center
        
        ContactsPopup.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        ContactsPopup.alpha = 0
        
        UIView.animate(withDuration: 0.4, animations: {self.VisualEffectView.effect = self.effect
            self.ContactsPopup.alpha = 1
            self.ContactsPopup.transform = CGAffineTransform.identity
        })
    }
    
    func animateOutContacts()
    {
        UIView.animate(withDuration: 0.3, animations: {self.ContactsPopup.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.ContactsPopup.alpha = 0
        }, completion: {(success: Bool) in self.ContactsPopup.removeFromSuperview()})
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
