//
//  Repositories.swift
//  GitHubRepos
//
//  Created by Abdelrahman Sobhy on 4/19/21.
//

import Foundation

struct Repositories: Codable {
    let id: Int
    let name: String
    let owner: Owner
}

// MARK: - Owner
struct Owner: Codable {
    let id: Int
    let login: String
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case login, id
        case avatarURL = "avatar_url"
    }
}
