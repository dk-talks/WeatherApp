//
//  CurrentWeatherViewController.swift
//  Tap Weather Man
//
//  Created by Dinesh Sharma on 29/03/23.
//

import UIKit
import CoreLocation

class CurrentWeatherViewController: UIViewController {

    var locationManager = CLLocationManager()
    var weatherManager = WeatherManager()
    
    @IBOutlet weak var btnmage: UIImageView!
    
    @IBOutlet weak var locationTemp: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var locationName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnmage.layer.cornerRadius = 20
        
        locationManager.delegate = self
        weatherManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()

        weatherManager.delegate = self
        
        let refreshBarButton = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(refreshButtonTapped))
        navigationItem.rightBarButtonItem = refreshBarButton
        
    }
    
    @objc func refreshButtonTapped() {
        locationManager.requestLocation()
    }
    
    
    @IBAction func btnShowDescTapped(_ sender: Any) {
        if(locationName.text != "-") {
            if let descVC = self.storyboard?.instantiateViewController(withIdentifier: "DescriptionVC") as? DescriptionViewController {
                self.navigationController?.pushViewController(descVC, animated: true)
            }
        }
    }
    

}

//MARK: - CLLocationManagerDelegate

extension CurrentWeatherViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            weatherManager.fetchWeather(lat: lat, lon: lon)
        }
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error in fetching location: \(error.localizedDescription)")
    }
    
}


//MARK: - WeatherManagerDelegate


extension CurrentWeatherViewController: WeatherManagerDelegate {
    
    func updateUI(weather: WeatherModel) {
        DispatchQueue.main.async {
//            self.descLabel.text = weather.description
            self.locationTemp.text = weather.tempString
            self.locationName.text = weather.name
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
