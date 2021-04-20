//
//  ReposViewModel.swift
//  GitHubRepos
//
//  Created by Abdelrahman Sobhy on 4/20/21.
//

import Foundation

class ReposViewModel {
    let repo = RepositorieImpl()

    var repositories: Dynamic = Dynamic<[Repositories]>([])
    var errorMessage: Dynamic = Dynamic<String>("")
    
    var dataCount: Int { repositories.value.count }
    
    func getData() {
        repo.getRepos { [weak self] response in
            switch response {
            case .success(let repos):
                self?.repositories.value = repos
            case .failure(let error):
                self?.errorMessage.value = error.localizedDescription
            }
        }
    }
}
