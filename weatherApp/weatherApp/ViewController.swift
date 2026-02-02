//
//  ViewController.swift
//  weatherApp
//
//  Created by Deepinderpal Singh on 24/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var weatherView: UIView!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var updateTime: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(gestureFired(_gesture:)))
        swipeGesture.numberOfTouchesRequired = 1
        swipeGesture.direction = .left
        
        weatherView.addGestureRecognizer(swipeGesture)
    }
    
    @objc func gestureFired(_gesture: UISwipeGestureRecognizer){
       
        if _gesture.direction == .left{
            
            
            self.tabBarController!.selectedIndex += 1
            print(" selected index be pincode :  \(tabBarController?.selectedIndex ?? 0)")
            
            if tabBarController?.selectedIndex != 0 {
                let pincodeVC = self.storyboard?.instantiateViewController(withIdentifier: "pincode") as! pincode
                self.navigationController?.pushViewController(pincodeVC, animated: true)
            }
        }
    }


    
    func fetchData()
    {
        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=398ed4d717c84924ad390054242410&q=india&aqi=no")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else
            {
                print("error occured while accessing data with url")
                return
            }
            var fulWeatherData:WeatherData?
            do
            {
                fulWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            }
            catch
            {
                print("error occured while decoding json into swift structure \(error)")
            }
            
            DispatchQueue.main.async {
                self.updateTime.text = "Updated : \(fulWeatherData!.current.last_updated)"
                self.countryLabel.text = "Country : \(fulWeatherData!.location.country)"
                print(" Country : \(fulWeatherData!.location.country)")
                self.regionLabel.text = "Region: \(fulWeatherData!.location.region)"
                self.windLabel.text = "Wind (Km/Hr) : \(fulWeatherData!.current.wind_kph)"
                self.humidityLabel.text = "Humidity : \(fulWeatherData!.current.humidity)"
                self.temperatureLabel.text = "Temperature (Celsius) : \(fulWeatherData!.current.temp_c)"
            }
        })
        dataTask.resume()
    }

    @IBAction func refreshAction(_ sender: UIButton) {
        fetchData()
    }
    
    
    @IBAction func moveToPincode(_ sender: UIButton) {
        let pincodeVC = self.storyboard?.instantiateViewController(withIdentifier: "pincode") as! pincode
                self.navigationController?.pushViewController(pincodeVC, animated: true)
    }
    
}

