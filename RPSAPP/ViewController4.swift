//
//  ViewController4.swift
//  RPSAPP
//
//  Created by BRYAN RUIZ on 11/9/21.
//

import UIKit


class ViewController4: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var tabelView: UITableView!
    var blah:[Int] = [2,1]
    var imageAr:[String] = ["rock"]
    var s:[[Int]] = [[]]
    var rToMs:[[Int]] = [[]]
    var wins:Int = 0
    var losses:Int = 0
    var tie:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.delegate = self
        tabelView.dataSource = self
        rToMs.append(blah)
        rToMs.removeAll()
        imageAr.remove(at: 0)
        if let item  = UserDefaults.standard.data(forKey: "SDATA"){
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([[Int]].self, from: item){
                rToMs = decoded
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(rToMs.count)
        return rToMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if rToMs.isEmpty == false{
        switch rToMs[indexPath.row][0] {
            case 0:
                if rToMs[indexPath.row][1] == 0 {
                    imageAr.append("rock")
                    tie += 1
                } else if rToMs[indexPath.row][1] == 1{
                    imageAr.append("paper")
                    wins += 1
                } else {
                    imageAr.append("rock")
                   losses += 1
                }
            case 1:
                if rToMs[indexPath.row][1] == 0 {
                    imageAr.append("paper")
                    losses += 1
                } else if rToMs[indexPath.row][1] == 1{
                    imageAr.append("paper")
                    tie += 1
                } else {
                    imageAr.append("sissors")
                   wins += 1
                }
            case 2:
                if rToMs[indexPath.row][1] == 0 {
                    imageAr.append("rock")
                    wins += 1
                } else if rToMs[indexPath.row][1] == 1{
                    imageAr.append("sissors")
                    losses += 1
                } else {
                    imageAr.append("sissors")
                   tie += 1
                }
            default:
            break
            }
        let cell = tabelView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomCell
        cell.titleLabel.text = "game: \(indexPath.row+1)"
        cell.winsLabel.text = "wins: \(wins)"
        cell.lossesLabel.text = "loss: \(losses)"
            cell.imageV.image = UIImage(named: imageAr[indexPath.row])
        return cell
        }else {
        let cell = tabelView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomCell
        cell.titleLabel.text = "game: \(indexPath.row+1)"
        cell.winsLabel.text = "wins: \(wins)"
        cell.lossesLabel.text = "loss: \(losses)"
        return cell
        }
    }
    
}
