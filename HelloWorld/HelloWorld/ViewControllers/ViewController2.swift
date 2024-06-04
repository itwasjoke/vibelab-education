//
//  ViewController2.swift
//  HelloWorld
//
//  Created by Андрей Васильев on 04.06.2024.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    deinit {
        
    }
    
    

}
