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
        myButton.frame = CGRect(x: 77, y: 426, width: 250, height: 60)
        myButton.center.x = self.view.center.x


        myButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // içerik eki ne kadar
        myButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // baslik eki ne kadar
        myButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) // resim eki ne kadar
        
        myButton.reversesTitleShadowWhenHighlighted = false
        myButton.adjustsImageWhenHighlighted = false
        myButton.adjustsImageWhenDisabled = false
        myButton.showsTouchWhenHighlighted = false
        
        
        
        
        myButton.setTitle("TurkishKit", for: .normal) // başlık içeriği
        myButton.setTitleColor(UIColor.red, for: .normal)  // başlığın rengi
        myButton.setTitleShadowColor(UIColor.black, for: .normal) // başlığın gölge rengi
        myButton.backgroundColor = UIColor.blue
        
       // let roundButton = UIImage(named: "btn.png")
        
       // myButton.setImage(roundButton, for: .normal)
        
        
        
        
        view.addSubview(myButton)
        
    }
    
    
}
