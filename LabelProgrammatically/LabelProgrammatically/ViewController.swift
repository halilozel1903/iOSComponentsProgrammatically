//
//  ViewController.swift
//  LabelProgrammatically
//
//  Created by Halil Özel on 26.10.2018.
//  Copyright © 2018 Halil Özel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // label nesnesi olusturuldu.
        let myLabel = UILabel()
        
        // label'ın ekranda nerede ve nasıl gözükeceğini belirttik.
        myLabel.frame = CGRect(x: 75, y: 240, width: 280, height: 140)
        
        // label nesnesine String değer atandı.
        myLabel.text = "Label Programmatically"
        
        // text değerinin fontu ve boyutu ayarlandı.
        myLabel.font = UIFont(name: "Helvetica-Bold", size: 15)
        
        // text'in rengi belirlendi.
        myLabel.textColor = UIColor.gray
        
        // arka plan rengi ayarlandı.
        myLabel.backgroundColor = UIColor(red: 254 / 255, green: 208 / 255, blue: 55 / 255, alpha: 0.5)
        
        // gölge rengi ayarlandı.
        myLabel.shadowColor = UIColor.red
        
        // gölge yazıda ne şekilde gözükecek
        myLabel.shadowOffset = CGSize(width: 2, height: 2)
        
        // label ortaya hizalandı.
        myLabel.textAlignment = NSTextAlignment.center
        
        // sözcük sınırlamasına göre satırı kırma
        myLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        // label'da vurgulanacak olan kelimenin rengi
        myLabel.highlightedTextColor = UIColor.black
        
        // vurgulama için bir renk kullanılacak mı diye cevap arar.
        myLabel.isHighlighted = true
        
        // Kullanıcı etkileşimlerine giribilmesi için true verdik.
        myLabel.isUserInteractionEnabled = true
        
        // ekranda gözükmesi için true verdik.
        myLabel.isEnabled = true
        
        // satır değeri olarak 0 verildi.
        myLabel.numberOfLines = 0
        
        // label'ın kapasitesine göre yazı tip boyutunu ayarlama
        myLabel.adjustsFontSizeToFitWidth = true
        
        
        // label'ın nasıl görüntüleneceğini ayarlayan kısım
        myLabel.baselineAdjustment = UIBaselineAdjustment.alignCenters
        
        
        // bileşen olarak eklendi.
        self.view.addSubview(myLabel)
        
        
    }


}

