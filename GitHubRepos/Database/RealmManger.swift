//
//  RealmManger.swift
//  GitHubRepos
//
//  Created by Abdelrahman Sobhy on 4/20/21.
//

import Foundation
import RealmSwift

class RealmManger {
    private static let realm = try! Realm()
    private init() { }

    static func setObject(_ object: Object) {
        try? realm.write {
            realm.add(object)
        }
    }

    static func setObjectsList(_ objects: [Object]) {
        try? realm.write {
            realm.add(objects, update: .modified)
        }
    }
    
    static func deleteObjectsList(_ objects: [Object]) {
        try? realm.write {
            realm.delete(objects)
        }
    }
    
    static func getObjects<T: Object>(_ model: T.Type, limit: Int, page: Int, completion: (([T]) -> ())) {
        let objects = realm.objects(model)        
        var accumulate: [T] = [T]()
        for offset in (limit * page)..<(limit * (page + 1)) {
            accumulate.append(objects[offset])
        }
        completion(accumulate)
    }
    
    static func deleteObject(_ object: Object){
        try? realm.write{
            realm.delete(object)
        }
    }
}
