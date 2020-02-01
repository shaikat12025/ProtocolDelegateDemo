//
//  ProfileVC.swift
//  ProtocolDelegateDemo
//
//  Created by sadidur rahman on 31/1/20.
//  Copyright © 2020 pathao. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var profileNameLabel: UILabel!
    @IBOutlet var profileInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        defaultProfile()
    }
    
    func defaultProfile() {
        let defaultProfile = Profile(name: "shaikat", info: "Testing", icon: #imageLiteral(resourceName: "facebook") , color: #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1))
        UserDefaults.standard.set(2, forKey: imageIcon)
        UserDefaults.standard.set(3, forKey: profileColor)
        applyProfile(defaultProfile)
    }
    
    func applyProfile(_ profile: Profile){
        profileImageView.image = profile.icon.withRenderingMode(.alwaysTemplate)
        profileImageView.tintColor = profile.color
        profileNameLabel.text = profile.name
        profileInfoLabel.text = profile.info
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let settingsVC = storyboard.instantiateViewController(withIdentifier: "SettingsVC") as? SettingsVC else {
            return
        }
        settingsVC.delegate = self
        navigationController?.pushViewController(settingsVC, animated: true)
    }
}

extension ProfileVC : SettingsVCDelegate {
    func didChangeProfile(_ profile: Profile) {
        applyProfile(profile)
    }
}
