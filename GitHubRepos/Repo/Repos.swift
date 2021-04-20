//
//  Repos.swift
//  GitHubRepos
//
//  Created by Abdelrahman Sobhy on 4/20/21.
//

import Foundation

protocol Repositorie {
    func getRepos(completionHandeler: @escaping (Result<[Repositories], Error>)->Void)
}

class RepositorieImpl: Repositorie {
    
    func getRepos(completionHandeler: @escaping (Result<[Repositories], Error>) -> Void) {
        ApiRequest.getRepo(url: "https://api.github.com/repositories") { response in
            switch response {
            case .success(let repos):
                completionHandeler(.success(repos))
            case .failure(let error):
                completionHandeler(.failure(error))
            }
        }
    }
    
}
