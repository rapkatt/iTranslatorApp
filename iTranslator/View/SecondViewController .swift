//
//  SecondViewController .swift
//  iTranslator
//
//  Created by Baudunov Rapkat on 3/27/20.
//  Copyright © 2020 Baudunov Rapkat. All rights reserved.
//

import UIKit
import RealmSwift

class SecondViewController: UITableViewController{
    

    var item: Word?
    var savedItems: Results<Word>!
    
    override func viewDidLoad() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        if let save: Results<Word> = DBManager.sharedInstance.getDataFromDB(){
            savedItems = save
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = savedItems[indexPath.row]
        configureText(for:cell, with: item)
        return cell
    }
     func configureText(for cell: UITableViewCell, with item: Word) {
        cell.textLabel?.text = item.nativeWord
        cell.detailTextLabel?.text = item.translatedWord
       }

}
