//
//  ViewController.swift
//  SimpleWeather
//
//  Created by ROLF J. on 2023/03/27.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var temparatureLabel: UILabel!
    
    let cities: [String] = ["Seoul", "Tokyo", "LA", "Seattle"]
    let weather: [String] = ["cloud.fill", "sum.max.fill", "wind", "cloud.bolt.fill"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func changeButtonTapped(_ sender: Any) {
        print("Chagne city, image, temparature")
        
        cityLabel.text = cities.randomElement()!
        let imageName = weather.randomElement()!
        imageView.image = UIImage(systemName: imageName)?.withRenderingMode(.alwaysOriginal)
        let randomTemp = String(Int.random(in: 10..<30))
        temparatureLabel.text = "\(randomTemp)°"
    }
    
}

