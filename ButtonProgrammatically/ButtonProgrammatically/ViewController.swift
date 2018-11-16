//
//  ViewController.swift
//  ButtonProgrammatically
//
//  Created by Halil Özel on 16.11.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var myButton : UIButton! // button nesnesi
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myButton = UIButton(type: .system) // button tipi
        myButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // içerik eki ne kadar
        myButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // baslik eki ne kadar
        
        myButton.frame = CGRect(x: 45, y: 300, width: 280, height: 140)
        
        myButton.setTitle("TurkishKit", for: .normal)
        
        
        
        view.addSubview(myButton)
        
    }
    
    
}
