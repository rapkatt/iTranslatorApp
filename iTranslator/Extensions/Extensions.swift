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

//extension HistoryViewController{
//    func textViewDidChangeSelection(_ textView: UITextView) {
//
//        let size = CGSize(width: view.frame.width, height: .infinity)
//        let estimatedSize = textView.sizeThatFits(size)
//        
//        textView.constraints.forEach{ (constaint) in
//            if constaint.firstAttribute == .height{
//                constaint.constant = estimatedSize.height
//            }
//            
//        }
//    }
//    
//}


extension TranslateViewController{
    
    func textViewDidChange(_ textView: UITextView) {
        refreshTimer()
    }
    
    func refreshTimer(){
        transTimer?.invalidate()
        transTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: false)
    }
    
    func firstBritishPicture(){
        imageEng.image = UIImage(named: "eng")
        imageRus.image = UIImage(named: "rus")
    }
    func firstRussianPicture(){
        imageEng.image = UIImage(named: "rus")
        imageRus.image = UIImage(named: "eng")
    }
    
}

