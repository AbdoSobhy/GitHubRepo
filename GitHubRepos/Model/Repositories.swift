//
//  Repositories.swift
//  GitHubRepos
//
//  Created by Abdelrahman Sobhy on 4/19/21.
//

import Foundation
import RealmSwift

class Repositories: Object, Codable {
    dynamic var id: Int = 0
    dynamic var name: String = ""
    dynamic var owner: Owner = Owner()
    
    required init() {
        self.id = 0
        self.name = ""
        self.owner = Owner()
    }
    
    init(id: Int, name: String, owner: Owner) {
        self.id = id
        self.name = name
        self.owner = owner
    }
    
}

// MARK: - Owner
class Owner: Codable {
    dynamic var id: Int = 0
    dynamic var login: String = ""
    dynamic var avatarURL: String = ""
    
    init() {
        self.id = 0
        self.login = ""
        self.avatarURL = ""
    }
    
    init(id: Int, login: String, avatarURL: String) {
        self.id = id
        self.login = login
        self.avatarURL = avatarURL
    }

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
    }
}
