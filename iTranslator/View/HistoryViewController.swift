//
//  SecondViewController .swift
//  iTranslator
//
//  Created by Baudunov Rapkat on 3/27/20.
//  Copyright © 2020 Baudunov Rapkat. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController:UIViewController, UICollectionViewDataSource, UITextViewDelegate{
    
    var item: Word?
    var savedItems: Results<Word>?
    
    override func viewDidLoad() {
        savedItems = DBManager.sharedInstance.getDataFromDB()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        }
        
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedItems!.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Container
        cell.contentView.isUserInteractionEnabled = true
        let items: Word = (savedItems!.sorted(byKeyPath: "date", ascending: false)[indexPath.row])
        configureText(for:cell,with: items)
        return cell
    }

     func configureText(for cell: Container, with item: Word) {
        cell.firstText.text = item.nativeWord
        cell.SecondText.text = item.translatedWord
       }

}

//extension HistoryViewController{
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        if let item = savedItems?.sorted(byKeyPath: "date", ascending: false)[indexPath.row] {
//
//        let approximateWidthOfBioTextView = view.frame.width - 12 - 50 - 12 - 2
//        let size = CGSize(width: approximateWidthOfBioTextView, height: 1000)
//
//            let estimatedFrame = NSString(string: item.nativeWord + item.translatedWord).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: nil, context: nil)
//
//            return CGSize(width: view.frame.width, height: estimatedFrame.height + 110)
//    }
//
//        return CGSize(width: view.frame.width, height: 100)
//    }
//
//
//
//}
