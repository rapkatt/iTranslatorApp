import Foundation
import Alamofire
import RealmSwift
import SwiftyJSON
class ServerManager {
    
    static let shared = ServerManager()
    
    let url = "https://translate.yandex.net/api/v1.5/tr.json/"
    let key = "trnsl.1.1.20200324T142745Z.2120f2a51bea64cc.727157bc6cf44fe7463be9c0e0c0d3d916116b87"
    var valueSaver = ""
    var lang = NSLocalizedString("en-ru", comment: "Language label")
    
    func makeRequest(words: String,completion: @escaping (String)-> ()){
        
        AF.request("\(url)translate?key=\(key)&lang=\(lang)&text=\(words)&ui=ru".addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!)
            .responseJSON{(response) in
                switch response.result{
                case .success(let value):
                    let json = JSON(value);
                    self.valueSaver =  json["text"][0].stringValue
                    DispatchQueue.main.async {
                        completion(self.valueSaver)
                    }
                case .failure(_):
                    DispatchQueue.main.async {
                        completion(self.valueSaver)
                    }
            }
        }
    }
    
}
