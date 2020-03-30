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
     
     var item: Word?
     var secondWord:String = ""
    
    
    @IBOutlet weak var imageRus: UIImageView!
    @IBOutlet weak var imageEng: UIImageView!
    @IBOutlet weak var textForTranslate: UITextView!
    @IBOutlet weak var changer: UIButton!
    @IBOutlet weak var translatedText: UITextView!
    
    @IBAction func langChanger(_ sender: Any) {
        if ServerManager.shared.lang.description == "en-ru"{
            ServerManager.shared.lang = "ru-en"
            imageEng.image = UIImage(named: "rus")
            imageRus.image = UIImage(named: "eng")
            
        }else{
            ServerManager.shared.lang  = "en-ru"
            imageEng.image = UIImage(named: "eng")
            imageRus.image = UIImage(named: "rus")
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        pictureCheker(item: ServerManager.shared.lang )
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        [
            textView.heightAnchor.constraint(equalToConstant: 50)
            ].forEach{$0.isActive = true}
        textView.delegate = self
        textView.isScrollEnabled = false
    }
   
    
    @objc func runTimedCode(){
        ServerManager.shared.makeRequest(words: textForTranslate.text, completion:setTranslateToField(translate:) )
    }
    
    func setTranslateToField(translate: String) {
        translatedText.text = translate
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
    



