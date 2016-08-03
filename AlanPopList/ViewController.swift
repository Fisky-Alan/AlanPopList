//
//  ViewController.swift
//  AlanPopList
//
//  Created by Fisky on 28/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    @IBAction func btnShowPopUp(sender: UIButton) {
  
        // class method
        
        
        
       
        
    AlanPopListView.initWithTitle(title: "Hello World", superview: self.view, options:["hi","hello"]) { (anIndex, selectedObject) in
     
        
        print("\(selectedObject as! String)")
        
        
        }
        // setting custom colour
        
//        AlanPopListView.initWithTitle(title: "Hello World", superview: self.view, options: ["hi","hello"], viewbgColor: UIColor.greenColor().colorWithAlphaComponent(0.1), tblBgColr: UIColor.blackColor(), titleColor: UIColor.greenColor(), titleLineColor: UIColor.greenColor(), tblItemTextColor: UIColor.greenColor()) { (anIndex, selectedObject) in
//            
//        }
        
        

    }

}

