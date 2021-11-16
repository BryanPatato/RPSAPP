//
//  ViewController2.swift
//  RPSAPP
//
//  Created by BRYAN RUIZ on 11/9/21.
//

import UIKit



class ViewController2: UIViewController,UINavigationControllerDelegate,UITabBarControllerDelegate{
    
    

    @IBOutlet weak var labelOutlet: UILabel!
    var rand:Int = Int.random(in: 0...2)
    var rToM:[[Int]] = [[]]
    var timer = Timer()
    var tabBarController2: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let i = tabBarController {
        print("tab bar exists")
        i.delegate = self
        tabBarController2 = i
        }
        rToM.remove(at: 0)
    }
    
    @objc func timerClear(){
        labelOutlet.text = ""
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        let nvc = tabBarController2.viewControllers![3] as! ViewController4
            print("did call 3")
            if rToM.isEmpty != true {
                for e in rToM { nvc.rToMs.append(e) }
                nvc.tabelView.reloadData()
                rToM.removeAll()
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(nvc.rToMs) {
                        UserDefaults.standard.set(encoded, forKey: "SDATA")
                rToM.removeAll()
                }
            }
        }
    
    @IBAction func paper(_ sender: UITapGestureRecognizer) {
        let m:[Int] = [rand,1]
        rToM.append(m)
        if rand == 0 {
            labelOutlet.text = "you beat rock"
        
        } else if rand == 2{
            labelOutlet.text = "sissors beat you"
        } else {
            labelOutlet.text = "its a tie"
        }
        rand = Int.random(in: 0...2)
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerClear), userInfo: nil, repeats: false)
    }
    
    @IBAction func rock(_ sender: UITapGestureRecognizer) {
        let m:[Int] = [rand,0]
        rToM.append(m)
        if rand == 0 {
            labelOutlet.text = "its a tie"
        
        } else if rand == 1{
            labelOutlet.text = "paper beat you"
        } else {
            labelOutlet.text = "you beat sissors"
        }
        rand = Int.random(in: 0...2)
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerClear), userInfo: nil, repeats: false)
    }
    
    @IBAction func sissors(_ sender: UITapGestureRecognizer) {
        let m:[Int] = [rand,2]
        rToM.append(m)
        if rand == 0 {
            labelOutlet.text = "rock beat you"
        } else if rand == 1{
            labelOutlet.text = "you beat paper"
        } else {
            labelOutlet.text = "its a tie"
        }
        rand = Int.random(in: 0...2)
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerClear), userInfo: nil, repeats: false)
    }
 
    
}
