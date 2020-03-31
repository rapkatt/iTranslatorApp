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

class TranslateViewController: UIViewController,UITextViewDelegate {
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
           firstRussianPicture()
            
        }else{
            ServerManager.shared.lang  = "en-ru"
            firstBritishPicture()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        pictureCheker(item: ServerManager.shared.lang )
    }
   
    
    @objc func runTimedCode(){
        ServerManager.shared.makeRequest(words: textForTranslate.text, completion:putTranslatedWord(translate:))
        
    }
    
    func putTranslatedWord(translate: String) {
        if translate.isEmpty{
            translatedText.text = "No internet connection"
        }else{
            translatedText.text = translate
            saveData()
        }
        
    }
    
    func pictureCheker(item:String){
        if item == "en-ru"{
            firstBritishPicture()
        }
        else{
            firstRussianPicture()
        }
    }
    
    
    
        func saveData(){
            let item = Word()
            item.nativeWord = textForTranslate.text
            item.translatedWord = translatedText.text
            if item.nativeWord != ""{
                DBManager.sharedInstance.addData(object: item)
            }
        }
    
}
    



