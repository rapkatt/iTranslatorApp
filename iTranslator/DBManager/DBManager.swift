import UIKit
import RealmSwift

class DBManager {

    var database: Realm
    static let sharedInstance = DBManager()
    
    init() {
        database = try! Realm()
    }
    
    func getDataFromDB() -> Results<Word> {
        let results: Results<Word> = database.objects(Word.self)
        return results
    }
    
    func addData(object: Word){
        try! database.write {
            database.add(object)
        }
    }
    
    func deleteFromDb(object: Word)   {
        try!   database.write {
            database.delete(object)
        }
        deleteItem()
    }
    
    func deleteItem() {
         let result = getDataFromDB()
         if result.count > 25 {
             try!   database.write {
                 database.delete(result.sorted(byKeyPath: "date", ascending: false).last!)
             }
         }
     }
}

    
