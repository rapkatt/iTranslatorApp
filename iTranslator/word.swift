import RealmSwift

class Word: Object {

    @objc dynamic var nativeWord = ""
    @objc dynamic var translatedWord = ""
    @objc dynamic var changedDate = Date()
    //@objc dynamic var language: Language? = nil

}
