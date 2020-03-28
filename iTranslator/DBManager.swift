import UIKit
import RealmSwift

class DBManager {

    var database: Realm
    static let sharedInstance = DBManager()
    
    private init() {
        database = try! Realm()
    }
    
    func getDataFromDB() -> Results<Word> {
        let results: Results<Word> = database.objects(Word.self)
        return results
    }
    
    func addData(object: Word)   {
        try! database.write {
            database.add(object)
            print("Added new object")
        }
    }
    
    func deleteFromDb(object: Word)   {
        try!   database.write {
            database.delete(object)
        }
    }
}

    
