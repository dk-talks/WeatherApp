//
//  MoreDetailsViewController.swift
//  Tap Weather Man
//
//  Created by Dinesh Sharma on 29/03/23.
//

import UIKit

class MoreDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var lblTemp: UILabel!
    @IBOutlet weak var lblFeelsLike: UILabel!
    @IBOutlet weak var lblTempMin: UILabel!
    @IBOutlet weak var lblTempMax: UILabel!
    @IBOutlet weak var lblPressure: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblTemp.text = Global.temp
        lblFeelsLike.text = String(Global.feels_like)
        lblTempMin.text = String(Global.temp_min)
        lblTempMax.text = String(Global.temp_max)
        lblPressure.text = String(Global.pressure)
        lblHumidity.text = String(Global.humidity)
        
    }
    

}
