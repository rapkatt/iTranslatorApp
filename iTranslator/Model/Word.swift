import RealmSwift
import Foundation

class Word: Object {

    @objc dynamic var nativeWord = ""
    @objc dynamic var translatedWord = ""
    @objc dynamic var date: Date = Date()

}
