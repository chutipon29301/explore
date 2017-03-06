//
//  Input.swift
//  Exploring
//
//  Created by Admin on 3/6/2560 BE.
//  Copyright © 2560 Chutipon Hirankanokkul. All rights reserved.
//

import UIKit

class Info{
    var initStock: Int!
    var holdCost: Int!
    var month: Int!
    var prodCost: [Int]!
    var demand: [Int]!
    var stock: [Int]!
    
    
    init(initStock: Int!,holdCost: Int!,month: Int!,prodCost: [Int]!,demand: [Int]!,stock: [Int]!) {
        self.initStock = initStock
        self.holdCost = holdCost
        self.prodCost = prodCost
        self.demand = demand
        self.stock = stock
    }
    func calProd() -> [Int] {
        var temp: [Int]!
        for i in 0...month{
            temp[i] = demand[i]-stock[i]
        }
        return temp
    }
    func calStockCost() -> [Int] {
        var temp: [Int]!
        for i in 0...month{
            temp[i] = stock[i] * holdCost
        }
        return temp
    }
    func calMonthProdCost() -> [Int] {
        var temp: [Int]!
        var prod = calProd()
        for i in 0...month{
              temp[i] = prod[i] * prodCost[i]
        }
        
        return temp
    }
    func calMonthCost() -> [Int] {
        var temp: [Int]!
        var stockcost = calStockCost()
        var monthProdCost = calMonthProdCost()
        for i in 0...month{
            temp[i] = stockcost[i] * monthProdCost[i]
        }
        
        return temp
    }
    
    
}
