//
//  HomeViewController.swift
//  Tap Weather Man
//
//  Created by Dinesh Sharma on 29/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var imgLogo: UIImageView!

    @IBOutlet var imgCurrentLocation: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        for image in imgCurrentLocation {
            image.layer.cornerRadius = 20
        }
        imgLogo.layer.cornerRadius = 100
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
    
    @IBAction func btnCurrentWeather(_ sender: Any) {
    }
    

    @IBAction func btnSearchLocation(_ sender: Any) {
    }
    
    @IBAction func btnAppInfo(_ sender: Any) {
    }
}
