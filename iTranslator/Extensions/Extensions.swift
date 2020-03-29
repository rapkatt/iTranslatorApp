//
//  Extensions.swift
//  iTranslator
//
//  Created by Baudunov Rapkat on 3/29/20.
//  Copyright © 2020 Baudunov Rapkat. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire
import SwiftyJSON

extension ViewController{
        func makeRequest(words: String){

            AF.request("\(url)translate?key=\(key)&lang=\(lang)&text=\(words)&ui=ru".addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)
                .responseJSON{(response) in
                    switch response.result{
                    case .success(let value):
                        let json = JSON(value);
                        self.secondWord = json["text"][0].stringValue
                        self.translatedText.text = self.secondWord
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
}
