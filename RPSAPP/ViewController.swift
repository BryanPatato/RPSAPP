//
//  ViewController.swift
//  RPSAPP
//
//  Created by BRYAN RUIZ on 11/8/21.
//

import UIKit

enum color{
    case blue,green,pink,red,yellow
}

class ViewController: UIViewController,UITabBarControllerDelegate {

    var tabBarController2: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let i = tabBarController {
        print("tab bar exists")
        i.delegate = self
        tabBarController2 = i
        }
        tabBarController2.tabBar.tintColor = UIColor.black
        tabBarController2.tabBar.unselectedItemTintColor = UIColor.black
        // Do any additional setup after loading the view.
    }

    @IBAction func clearData(_ sender: UIButton) {
        let nvc = tabBarController2.viewControllers![3] as! ViewController4
        while nvc.rToMs.count != 0 {
        print("it gone")
        nvc.rToMs.removeAll()
        nvc.tabelView.reloadData()
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(nvc.rToMs) {
        UserDefaults.standard.set(encoded, forKey: "SDATA")
            }
        }
    }
        
    
    @IBAction func colors(_ sender: UISegmentedControl) {
        let nvc2 = tabBarController2.viewControllers![1] as! ViewController2
        let nvc3 = tabBarController2.viewControllers![2] as! ViewController3
        let nvc4 = tabBarController2.viewControllers![3] as! ViewController4
        switch sender.selectedSegmentIndex{
        case 0:
            view.backgroundColor = UIColor.blue
            nvc2.colors = .blue
            nvc3.colors = .blue
            nvc4.colors = .blue
        case 1:
            view.backgroundColor = UIColor.green
            nvc2.colors = .green
            nvc3.colors = .green
            nvc4.colors = .green
        case 2:
            view.backgroundColor = UIColor.systemPink
            nvc2.colors = .pink
            nvc3.colors = .pink
            nvc4.colors = .pink
        case 3:
            view.backgroundColor = UIColor.red
            nvc2.colors = .red
            nvc3.colors = .red
            nvc4.colors = .red
        case 4:
            view.backgroundColor = UIColor.yellow
            nvc2.colors = .yellow
            nvc3.colors = .yellow
            nvc4.colors = .yellow
        default:
        break
        }
    }
    
}
    

