//
//  WelcomeViewController.swift
//  Tap Weather Man
//
//  Created by Dinesh Sharma on 29/03/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var btnNextImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnNextImage.layer.cornerRadius = 20
        
        if(defaults.bool(forKey: "isLaunched")) {
            if let  homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeViewController {
                
                self.navigationController?.pushViewController(homeVC, animated: false)
                
            }
        }
        
    }
    
    
    
    @IBAction func btnNext(_ sender: Any) {
        defaults.set(true, forKey: "isLaunched")
    }
    
}
