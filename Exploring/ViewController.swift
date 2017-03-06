//
//  ViewController.swift
//  Exploring
//
//  Created by Chutipon Hirankanokkul on 3/6/2560 BE.
//  Copyright © 2560 Chutipon Hirankanokkul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var initStock: UITextField!
    @IBOutlet weak var holdStock: UITextField!
    @IBOutlet weak var month: UITextField!
    @IBOutlet weak var prodCost: UITextField!
    @IBOutlet weak var demand: UITextField!
    @IBOutlet weak var stock: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button.layer.cornerRadius = 5
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPressed(_ sender: UIButton) {
        let prod = prodCost.text!.components(separatedBy: ",").map{Int($0)!}
        let dem = demand.text!.components(separatedBy: ",").map{Int($0)!}
        let st = stock.text!.components(separatedBy: ",").map{Int($0)!}
        

//        let temp = Info(initStock: Int(initStock.text!)!,holdCost: Int(holdStock.text!)!,month: Int(month.text!)!,prodCost: prod,demand: dem,stock: st)
        performSegue(withIdentifier: "showResult", sender: nil)
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        <#code#>
//    }

}

