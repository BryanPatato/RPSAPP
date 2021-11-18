//
//  ViewController3.swift
//  RPSAPP
//
//  Created by BRYAN RUIZ on 11/9/21.
//

import UIKit

class ViewController3: UIViewController,UINavigationControllerDelegate,UITabBarControllerDelegate {

    @IBOutlet weak var labelOutlet: UILabel!
    var rand = Int.random(in: 0...2)
    var timer = Timer()
    var rToM:[[Int]] = [[]]
    var tabBarController2: UITabBarController!
    var colors:color = .blue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let i = tabBarController {
        print("tab bar exists")
        i.delegate = self
        tabBarController2 = i
        }
        rToM.remove(at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = colorsSs()
        
    }
    
    func colorsSs() -> UIColor{
        switch colors {
        case .blue:
            return UIColor.blue
        case .green:
            return UIColor.green
        case .pink:
            return UIColor.systemPink
        case .red:
            return UIColor.red
        case .yellow:
            return UIColor.yellow
        }
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
                let encoder = JSONEncoder()
                if let encoded = try? encoder.encode(nvc.rToMs) {
                        UserDefaults.standard.set(encoded, forKey: "SDATA")
                rToM.removeAll()
                }
            }
        }
    
    @IBAction func slider(_ sender: UISlider) {
        switch Int(sender.value){
        case 0:
             let m:[Int] = [rand,0]
             rToM.append(m)
        if rand == 0 {
            labelOutlet.text =  "its a tie"
        } else if rand == 2{
            labelOutlet.text = "you beat sissors"
        } else {
            labelOutlet.text = "paper beat you"
        }
        rand = Int.random(in: 0...2)
        case 1:
            let m:[Int] = [rand,1]
            rToM.append(m)
        if rand == 0 {
            labelOutlet.text = "you beat rock"
        } else if rand == 1{
            labelOutlet.text = "its a tie"
        } else {
            labelOutlet.text = "sissors beat you"
        }
        rand = Int.random(in: 0...2)
        case 2:
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
        default:
            break
        }
    }

}
