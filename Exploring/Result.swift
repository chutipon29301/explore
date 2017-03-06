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
    var rearrangeData: [(name: String, value: String)] = []
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
            return tableView.dequeueReusableCell(withIdentifier: "monthCell")!
        }else{
            return tableView.dequeueReusableCell(withIdentifier: "detailCell")!
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rearrangeData.count
    }
    
    func getRearrangeData() {
        for x in data {
            for y in x {
                rearrangeData.append(y)
            }
        }
    }
}
