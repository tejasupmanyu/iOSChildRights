//
//  CarouselHomeViewController.swift
//  HackathonPrototype
//
//  Created by Tejas Upmanyu on 24/03/17.
//  Copyright © 2017 VisionArray. All rights reserved.
//

import UIKit

class CarouselHomeViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate{

    
    
    @IBOutlet weak var BackgroundImage: UIImageView!
    @IBOutlet weak var carouselView: UICollectionView!
    
    var BackGroundImageArray = ["HomeScreen","LaunchScreen","flag","boys","coverVisionArray"]
    var CellTitles = ["Acts","Case Studies","StakeHolders","Quiz","Credits"]
    var vcs = ["ActsList","CasesList","ContactsList","QuizStart","CreditsList"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        navigationController!.interactivePopGestureRecognizer?.delegate = self
        navigationItem.title = "Butterflies & Unicorns"
        
        carouselView.dataSource = self
        carouselView.delegate = self
        navigationItem.hidesBackButton = true
        
    }
    
     func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return CellTitles.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ThumbNail", for: indexPath) as! CarouselCollectionViewCell
        cell.cellBackground.image = UIImage(named: BackGroundImageArray[indexPath.row])
        cell.cellLabel.text = CellTitles[indexPath.row]
        BackgroundImage.image = UIImage(named: BackGroundImageArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: vcs[indexPath.row], sender: self)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension CarouselHomeViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if navigationController?.viewControllers.count == 1 {
            return true
        }
        
        if let navigationController = self.navigationController as? NavigationStack {
            navigationController.showControllers()
        }
        
        return false
    }
}


