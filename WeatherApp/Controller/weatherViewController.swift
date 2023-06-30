//
//  ViewController.swift
//  weatherApp
//
//  Created by Dinesh Sharma on 19/11/22.
//

import UIKit
import CoreLocation

class weatherViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var locationName: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var btnImage: UIImageView!
    @IBOutlet weak var locationTemp: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    
    var weatherManager = WeatherManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnImage.layer.cornerRadius = 20
        searchTextField.delegate = self
        weatherManager.delegate = self
        
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
    }
    
    
    @IBAction func btnDescTapped(_ sender: Any) {
        if(locationName.text != "-") {
            if let descVC = self.storyboard?.instantiateViewController(withIdentifier: "DescriptionVC") as? DescriptionViewController {
                self.navigationController?.pushViewController(descVC, animated: true)
            }
        }
    }
    
}


//MARK: - UITextFieldDelegate

extension weatherViewController: UITextFieldDelegate {
    
    @IBAction func searchTapped(_ sender: Any) {
        searchTextField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if(searchTextField.text != nil){
            return true
        }else {
            searchTextField.placeholder = "Type Something"
            return false
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        return true
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let cityName = textField.text!
        weatherManager.fetchWeather(cityName: cityName)
        searchTextField.text = ""
        
    }
}


//MARK: - WeatherManagerDelegate


extension weatherViewController: WeatherManagerDelegate {
    
    func updateUI(weather: WeatherModel) {
        DispatchQueue.main.async {
//            self.descLabel.text = weather.description
            self.locationTemp.text = weather.tempString
            self.locationName.text = weather.name
            print(weather.conditionImage)
            self.locationImage.image = UIImage(named: weather.conditionImage)
            
            Global.temp = weather.tempString
            Global.name = weather.name
            Global.humidity = weather.humidity
            Global.pressure = weather.pressure
            Global.temp_max = weather.temp_max
            Global.temp_min = weather.temp_min
            Global.feels_like = weather.feels_like
            Global.description = weather.description
        }
    }
    
}





