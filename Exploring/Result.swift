//
//  Result.swift
//  Exploring
//
//  Created by Admin on 3/6/2560 BE.
//  Copyright © 2560 Chutipon Hirankanokkul. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "month")!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        return collectionView.dequeueReusableCell(withReuseIdentifier: "cost", for: indexPath)
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
}

class DisplayViewController: UITableViewController {
    var data: [[(name: String, value: String)]]!
    var rearrangeData: [(name: String, value: String, isCollapse: Bool)] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [
            [(name: "Title", value: "Month 1"), (name: "Cost A", value: "100"),(name: "Cost A", value: "200"),(name: "Cost C", value: "300"), (name: "Cost D", value: "400")],
            [(name: "Title", value: "Month 2"), (name: "Cost A", value: "100"),(name: "Cost A", value: "200"),(name: "Cost C", value: "300"), (name: "Cost D", value: "400")],
            [(name: "Title", value: "Month 3"), (name: "Cost A", value: "100"),(name: "Cost A", value: "200"),(name: "Cost C", value: "300"), (name: "Cost D", value: "400")]
        ]
        getRearrangeData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if rearrangeData[indexPath.row].name == "Title" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "monthCell")! as! MonthCell
            cell.labelName.text = rearrangeData[indexPath.row].name
            cell.dropDownImage.image = (rearrangeData[indexPath.row].isCollapse) ? #imageLiteral(resourceName: "ic_arrow_drop_down_black_24dp") : #imageLiteral(resourceName: "ic_arrow_drop_up_black_24dp")
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell")! as! DetailCell
            cell.labelName.text = rearrangeData[indexPath.row].name
            cell.value.text = rearrangeData[indexPath.row].value
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rearrangeData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (rearrangeData[indexPath.row].isCollapse && rearrangeData[indexPath.row].name != "Title") ? 0.0 : 44.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if rearrangeData[indexPath.row].name == "Title" {
            let start = indexPath.row
            rearrangeData[indexPath.row].isCollapse = !(rearrangeData[indexPath.row].isCollapse)
            var end = start
            while (end + 1 < rearrangeData.count) && rearrangeData[end + 1].name != "Title" {
                end += 1
                rearrangeData[end].isCollapse = !(rearrangeData[end].isCollapse)
            }
            tableView.beginUpdates()
            for _ in start ... end {
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            tableView.endUpdates()
        }
    }
    
    func getRearrangeData() {
        for x in data {
            for y in x {
                rearrangeData.append((name: y.name,value: y.value, isCollapse: true))
            }
        }
    }
}

class MonthCell: UITableViewCell {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var dropDownImage: UIImageView!
}

class DetailCell: UITableViewCell {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var value: UILabel!
}
