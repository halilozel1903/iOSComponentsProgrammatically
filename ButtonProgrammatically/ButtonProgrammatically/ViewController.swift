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
        myButton.frame = CGRect(x: 45, y: 300, width: 280, height: 140) // boyutları
        myButton.center = self.view.center // hizalanması
        myButton.setTitle("TurkishKit", for: .normal) // başlık içeriği
        myButton.setTitleColor(UIColor.red, for: .normal)  // başlığın rengi
        view.addSubview(myButton) // button ekleme
        
       
        
        
        
        
        
    }
    
    
}
