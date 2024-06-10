//
//  ViewController.swift
//  userDefaults
//
//  Created by Андрей Васильев on 10.06.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        var red = UserDefaults.standard.float(forKey: "red")
        var green = UserDefaults.standard.float(forKey: "green")
        var blue = UserDefaults.standard.float(forKey: "blue")
        
        view.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: 1.0)
    }

    @IBAction func changeColor(_ sender: Any) {
        view.backgroundColor = UIColor.random()
    }
    
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        var red = CGFloat.random()
        var green = CGFloat.random()
        var blue = CGFloat.random()
        
        let defaults = UserDefaults.standard
        defaults.set(red, forKey: "red")
        defaults.set(green, forKey: "green")
        defaults.set(blue, forKey: "blue")
        
        return UIColor(
           red:   red,
           green: green,
           blue:  blue,
           alpha: 1.0
        )
    }
}
