//
//  DescriptionViewController.swift
//  Tap Weather Man
//
//  Created by Dinesh Sharma on 29/03/23.
//

import UIKit

class DescriptionViewController: UIViewController {
    

    @IBOutlet weak var btnImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        btnImage.layer.cornerRadius = 20
        
        descLabel.text = "There is \(Global.description) in \(Global.name) currently!"
    }
    

}

