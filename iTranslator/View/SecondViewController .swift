//
//  SecondViewController .swift
//  iTranslator
//
//  Created by Baudunov Rapkat on 3/27/20.
//  Copyright © 2020 Baudunov Rapkat. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController:UIViewController, UICollectionViewDataSource{
    
  
    
    
    
    

    var item: Word?
    var savedItems: Results<Word>!
    
    override func viewDidLoad() {
        if let save: Results<Word> = DBManager.sharedInstance.getDataFromDB(){
            savedItems = save
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Container
        let items = savedItems[indexPath.row]

        configureText(for:cell,with: items)
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return savedItems.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let item = savedItems[indexPath.row]
//        configureText(for:cell, with: item)
//        return cell
//    }
     func configureText(for cell: Container, with item: Word) {
        cell.firstText.text = item.nativeWord
        cell.secondText.text = item.translatedWord
//        cell.textLabel?.text = item.nativeWord
//        cell.detailTextLabel?.text = item.translatedWord
       }

}
