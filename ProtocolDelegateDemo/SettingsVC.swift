//
//  SettingsVC.swift
//  ProtocolDelegateDemo
//
//  Created by sadidur rahman on 31/1/20.
//  Copyright © 2020 pathao. All rights reserved.
//

import UIKit

protocol SettingsVCDelegate {
    func didChangeProfile(_ profile: Profile)
}

class SettingsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet var nametextfield: UITextField!
    @IBOutlet var infotextfield: UITextField!
    @IBOutlet var imageCollectionView: UICollectionView! 
    @IBOutlet var colorCollectionView: UICollectionView!
    
    var delegate: SettingsVCDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageNib = UINib(nibName: "ImageCell", bundle: nil)
        self.imageCollectionView.register(imageNib, forCellWithReuseIdentifier: "ImageCell")
        
        let colorNib = UINib(nibName: "ColorCell", bundle: nil)
        self.colorCollectionView.register(colorNib, forCellWithReuseIdentifier: "ColorCell")
        
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        
        let imageLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        imageLayout.sectionInset = UIEdgeInsets(top: 20, left: 5, bottom: 10, right: 5)
        imageLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3.5, height: 100)
        imageLayout.minimumInteritemSpacing = 5
        imageLayout.minimumLineSpacing = 5
        imageLayout.scrollDirection = .horizontal
        imageCollectionView?.collectionViewLayout = imageLayout
        
        let colorLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        colorLayout.sectionInset = UIEdgeInsets(top: 20, left: 5, bottom: 10, right: 5)
        colorLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 4.6 , height: 30)
        colorLayout.minimumLineSpacing = 5
        colorLayout.minimumInteritemSpacing = 5
        colorLayout.scrollDirection = .horizontal
        colorCollectionView?.collectionViewLayout = colorLayout
        
    }
    
    func selectedProfile() {
        let selectedProfile = Profile(name: nametextfield.text ?? "",
                                      info: infotextfield.text ?? "",
                                      icon: imageArray[UserDefaults.standard.integer(forKey: imageIcon)],
                                      color:  colorArray[UserDefaults.standard.integer(forKey: profileColor)])
        delegate?.didChangeProfile(selectedProfile)
        //print(selectedProfile)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        selectedProfile()
        navigationController?.popViewController(animated: true)
    }
    
}

extension SettingsVC {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var itemCount = 0
        if collectionView == imageCollectionView {
            itemCount =  imageArray.count
            return itemCount
        } else if collectionView == colorCollectionView {
            itemCount =  colorArray.count
            return itemCount
        } else {
            return itemCount
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell()
        if collectionView == imageCollectionView {
            guard let imageCell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell else {
                return cell
            }
            imageCell.itemImageView.image = imageArray[indexPath.row]
            cell = imageCell
            
        } else if collectionView == colorCollectionView {
            guard let colorCell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell else {
                return cell
            }
            colorCell.bgView.backgroundColor = colorArray[indexPath.row]
            cell = colorCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == imageCollectionView {
            let imageCell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell
            imageCell?.itemImageView.image = imageArray[indexPath.row]
            let selectedImageIndex = Int(indexPath.row)
            print(selectedImageIndex)
            UserDefaults.standard.set(selectedImageIndex, forKey: imageIcon)
        } else if collectionView == colorCollectionView {
             let colorCell = imageCollectionView.dequeueReusableCell(withReuseIdentifier: "ImageCell", for: indexPath) as? ImageCell
            colorCell?.bgView.backgroundColor = colorArray[indexPath.row]
            let selectedColorIndex = Int(indexPath.row)
            print(selectedColorIndex)
            UserDefaults.standard.set(selectedColorIndex, forKey: profileColor)
        }
    }
}
