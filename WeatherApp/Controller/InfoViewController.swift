//
//  InfoViewController.swift
//  Tap Weather Man
//
//  Created by Dinesh Sharma on 30/03/23.
//

import UIKit

class InfoViewController: UIViewController {
    
    
    @IBOutlet weak var lblInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        lblInfo.text = """
        WeatherApp Man is a wonderful application to know weather of your favorite location.
        If you want to get your current location weather information then click on "Current Location Weather" Button and allow app to access your location to fetch your weather.
        Or if you want to search for a city then you can do so, just type in the name of your desired city and click "go" button from keyboard.
        It gives you detailed description of the weather and more information like humidity, pressure min and max temperature etc.
        Enjoy it!
        """
    }
    
   

}
