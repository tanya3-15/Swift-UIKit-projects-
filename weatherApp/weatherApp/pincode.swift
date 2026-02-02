//
//  pincode.swift
//  weatherApp
//
//  Created by Deepinderpal Singh on 25/10/24.
//

import UIKit

class pincode: UIViewController {
    
    @IBOutlet var pincodeView: UIView!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var placelabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var pincodelabel: UILabel!
    @IBOutlet weak var txtpincode: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeGesture1 = UISwipeGestureRecognizer(target: self, action: #selector(gesturemoveToWeather(_gesture:)))
        swipeGesture1.numberOfTouchesRequired = 1
        swipeGesture1.direction = .right
        
        pincodeView.addGestureRecognizer(swipeGesture1)
    }
    
    @IBAction func moveToView(_ sender: UIButton) {
        let weatherVC = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(weatherVC, animated: true)
    }
    
    @objc func gesturemoveToWeather(_gesture: UISwipeGestureRecognizer){
        
        guard let tabBarController = self.tabBarController else { return }
        
        if _gesture.direction == .right {
            // Move to the previous tab (decrement selected index)
            var newIndex = tabBarController.selectedIndex - 1
            
            // Ensure the index does not go below zero
            if newIndex < 0 {
                newIndex = 0
            }
            
            tabBarController.selectedIndex = newIndex
            print("Selected index after right swipe: \(tabBarController.selectedIndex)")
            
            if tabBarController.selectedIndex == 0 {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

    
    func fetchData(){
        let getPincode:String = txtpincode.text!
        let url = URL(string: "https://api.zippopotam.us/IN/\(getPincode)")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data, response, error) in
            guard let data = data, error == nil else{
                print("Error occured while accessing data with url")
                return
            }
            var pincodeDetail:PincodeData?
            do{
                pincodeDetail = try JSONDecoder().decode(PincodeData.self, from: data)
            }
            catch
            {
                print("Error occured while decodig JSON into swift structure")
            }
            DispatchQueue.main.async{
                self.pincodelabel.text = "Pincode : \(pincodeDetail!.postcode)"
                self.countryLabel.text = "Country : \(pincodeDetail!.country)"
                self.placelabel.text = "Place Name : \(pincodeDetail!.places[0].placename)"
                self.placelabel.text = "Place Name : \(pincodeDetail!.places[0].placename)"
                self.stateLabel.text = "State : \(pincodeDetail!.places[0].state)"
                self.longitudeLabel.text = "Longitude : \(pincodeDetail!.places[0].longitude)"
                self.latitudeLabel.text = "Latitude : \(pincodeDetail!.places[0].latitude)"
            }
        })
        dataTask.resume()
    }

    @IBAction func SearchPincodeBtn(_ sender: UIButton) {
        if txtpincode.text?.count ?? 0 < 1 {
            let alert = UIAlertController(title: "Alert", message: "Please fill pincode", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            fetchData()
        }
    }
}
