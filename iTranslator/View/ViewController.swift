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
    

    @IBOutlet weak var textForTranslate: UITextView!
    
    @IBOutlet weak var translatedText: UITextView!
   
    @IBOutlet  var tester: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let url = "https://translate.yandex.net/api/v1.5/tr.json/"
        let key = "trnsl.1.1.20200324T142745Z.2120f2a51bea64cc.727157bc6cf44fe7463be9c0e0c0d3d916116b87"
        
        func makeRequest(words: String){
            
            AF.request("\(url)translate?key=\(key)&lang=ru&text=\(words)&ui=ru")
                .responseJSON{(response) in
                    switch response.result{
                    case .success(let value):
                        let json = JSON(value);
                        self.refreshTextFields()
                        self.translatedText.text = json["text"][0].stringValue
                        //self.resultLabel.text = json["text"][0].stringValue.capitalizingFirstLetter()
                    case .failure(let error):
                        print("error")
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
        //ServerManager.shared.translate(words: textForTranlate.text ?? "Cat")
        makeRequest(words: textForTranslate.text!)
    }
    
    
    func refreshTextFields(){
        //self.textForTranslate.text = ""
       // self.tranlatedText.text = ""
       // self.tester.text = ""
    }


}

