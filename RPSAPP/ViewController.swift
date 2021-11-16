//
//  ViewController.swift
//  RPSAPP
//
//  Created by BRYAN RUIZ on 11/8/21.
//

import UIKit

class ViewController: UIViewController,UITabBarControllerDelegate {

    var tabBarController2: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let i = tabBarController {
        print("tab bar exists")
        i.delegate = self
        tabBarController2 = i
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func clearData(_ sender: UIButton) {
        let nvc = tabBarController2.viewControllers![3] as! ViewController4
        nvc.rToMs.removeAll()
        nvc.tabelView.reloadData()
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(nvc.rToMs) {
        UserDefaults.standard.set(encoded, forKey: "SDATA")
            }
        }
    
}
    

