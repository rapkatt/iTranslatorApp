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
     var lang = "en-ru"
     var item: Word?
     var secondWord:String = ""
    
    

    
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
    }
    
    let url = "https://translate.yandex.net/api/v1.5/tr.json/"
        let key = "trnsl.1.1.20200324T142745Z.2120f2a51bea64cc.727157bc6cf44fe7463be9c0e0c0d3d916116b87"
        
        func makeRequest(words: String){

            AF.request("\(url)translate?key=\(key)&lang=\(lang)&text=\(words)&ui=ru".addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)
                .responseJSON{(response) in
                    switch response.result{
                    case .success(let value):
                        let json = JSON(value);
                        
                        self.secondWord = json["text"][0].stringValue
                        self.translatedText.text = self.secondWord
                        //print(self.translatedText.text)
                        let translated = self.translatedText.text
                        let item = Word()
                        item.nativeWord = words
                        item.translatedWord = translated!
                        if item.nativeWord != ""{
                        DBManager.sharedInstance.addData(object: item)
                        }
                    case .failure(_):
                        print("Error")
                    }
            }
                    
            
    }
    func textViewDidChange(_ textView: UITextView) {
        refreshTimer()
    }
    
    func refreshTimer(){
        transTimer?.invalidate()
        transTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: false)
    }
    
    @objc func runTimedCode(){
        makeRequest(words: textForTranslate.text)
    }
    
}
    



