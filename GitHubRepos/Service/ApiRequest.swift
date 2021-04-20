//
//  SignUpSuccess.swift
//  HealthCareSystem
//
//  Created by Abdelrahman Sobhy on 4/15/21.
//  Copyright © 2021 ALATRAF. All rights reserved.
//


import Foundation
import SwiftyJSON

class ApiRequest{
    
    static func getRepo(url : String,  completionHandeler: @escaping (Result<[Repositories],Error>) -> Void) {
        
        guard let url = URL(string: url) else {return}
        URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error{ completionHandeler(.failure(error)) }
            
            if let data = data {
                do {
                    let json = try JSON(data: data)
                    var repos = [Repositories]()
                        for (_,subJson):(String, JSON) in json {

                            guard let id = subJson["id"].int, let name = subJson["name"].string else {return}
                            guard let ownerName = subJson["owner"]["login"].string, let ownerid = subJson["owner"]["id"].int, let avatarUrl = subJson["owner"]["avatar_url"].string else {return}
                            let owner = Owner(id: ownerid, login: ownerName, avatarURL: avatarUrl)
                            repos.append(Repositories(id: id, name: name, owner: owner))
                    }
                    DispatchQueue.main.sync {
                        completionHandeler(.success(repos))
                    }
                    
                } catch  {
                    completionHandeler(.failure(error))
                }
                }
            
        }.resume()
    }
    
}
