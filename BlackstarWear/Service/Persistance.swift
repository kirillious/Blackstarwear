//
//  Persistance.swift
//  BlackstarWear
//
//  Created by Kirill on 05.07.2021.
//Swift Compiler Warning Group

import Foundation
import RealmSwift

class PersistantItems: Object {
    @objc dynamic var productName = ""
    @objc dynamic var price = ""
    @objc dynamic var colorName = ""
    @objc dynamic var size = ""
}

class CartList {
    let item = List<PersistantItems>()
}

class Persistance {
    static let shared = Persistance()
    let realm = try! Realm()
    let fileManager = FileManager.default
    
    func savingProduct(product: PersistantItems) {
        try! realm.write {
            realm.add(product)
        }
        
    }
    
    func deletingProduct(index: Int) {
        try! realm.write {
            realm.delete(realm.objects(PersistantItems.self)[index])
        }
    }
    
    func savingImages(_ data: NSData, fileName: Date) -> Void {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSS"
        let dateString = df.string(from: fileName)

        let fileName = dateString + "image.jpeg"
        let fileURL = documentsDirectory.appendingPathComponent(fileName)


            do {
                try data.write(to: fileURL)
            } catch let error {
                print("error saving file with error", error)
            }
        }
    
    
    func gettingURLS() -> [URL]? {
        
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil).filter { $0.lastPathComponent.contains("image.jpeg") }
                .sorted(by: {
                    let date0 = try $0.promisedItemResourceValues(forKeys:[.contentModificationDateKey]).contentModificationDate!
                    let date1 = try $1.promisedItemResourceValues(forKeys:[.contentModificationDateKey]).contentModificationDate!
                    return date0.compare(date1) == .orderedAscending
                 })
            
            
            var URLlist: [URL] = []
            
            for item in fileURLs {

                URLlist.append(item)
                
            }
            
            return URLlist
            
        } catch {
            print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
        }
        return nil
        
    }
    
    func deletingFileAt(_ path: URL) {
        do {
        try fileManager.removeItem(at: path)
        } catch {
            print("There is no such a file")
        }
    }
    
 }
    
