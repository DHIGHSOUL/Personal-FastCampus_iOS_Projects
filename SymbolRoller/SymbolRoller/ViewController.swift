//
//  ViewController.swift
//  SymbolRoller
//
//  Created by ROLF J. on 2023/03/26.
//

import UIKit

class SymbolRollerViewController: UIViewController {
    
    let symbolds: [String] = ["sun.min", "moon", "cloud", "wind", "snowflake"]

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: 심볼에서, 하나를 임의로 추출해서 이미지와 텍스트를 설정한다
        
        symbolChange()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func symbolChange(_ sender: Any) {
        symbolChange()
    }
    
    func symbolChange() {
        let symbol = symbolds.randomElement()!
        imageView.image = UIImage(systemName: symbol)
        label.text = symbol
    }
}

