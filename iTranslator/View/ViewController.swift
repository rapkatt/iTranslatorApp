//
//  ViewController.swift
//  iTranslator
//
//  Created by Baudunov Rapkat on 3/24/20.
//  Copyright © 2020 Baudunov Rapkat. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController,UITextViewDelegate {
     var transTimer: Timer?
     var lang = NSLocalizedString("en-ru", comment: "Language label")
     var item: Word?
     var secondWord:String = ""
    let url = "https://translate.yandex.net/api/v1.5/tr.json/"
    let key = "trnsl.1.1.20200324T142745Z.2120f2a51bea64cc.727157bc6cf44fe7463be9c0e0c0d3d916116b87"
    
    @IBOutlet weak var imageRus: UIImageView!
    @IBOutlet weak var imageEng: UIImageView!
    @IBOutlet weak var textForTranslate: UITextView!
    @IBOutlet weak var changer: UIButton!
    @IBOutlet weak var translatedText: UITextView!
    
    @IBAction func langChanger(_ sender: Any) {
        if lang == "en-ru"{
            lang = "ru-en"
            imageEng.image = UIImage(named: "rus")
            imageRus.image = UIImage(named: "eng")
            
        }else{
            lang = "en-ru"
            imageEng.image = UIImage(named: "eng")
            imageRus.image = UIImage(named: "rus")
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        pictureCheker(item: lang)
    }
   
    
    @objc func runTimedCode(){
        makeRequest(words: textForTranslate.text)
    }
    func pictureCheker(item:String){
        if item == "en-ru"{
            imageEng.image = UIImage(named: "eng")
            imageRus.image = UIImage(named: "rus")
        }
        else{
            imageEng.image = UIImage(named: "rus")
            imageRus.image = UIImage(named: "eng")
        }
    }
    
}
    



