//
//  ViewController.swift
//  GitHubRepos
//
//  Created by Abdelrahman Sobhy on 4/19/21.
//

import UIKit

class ReposViewController: UIViewController {
    
    @IBOutlet weak var reposTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    let viewModel = ReposViewModel()
    
    var searchResult = [Repositories](){
        didSet{
            DispatchQueue.main.async {
                self.reposTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reposTableView.keyboardDismissMode = .onDrag
        bindData()
        viewModel.getData()
    }
    
    func bindData(){
        self.viewModel.repositories.bind { [weak self] repos in
            self?.searchResult = repos
        }
        
        self.viewModel.errorMessage.bind { [weak self] message in
            self?.alert(message: message)
        }

    }

}
extension ReposViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepoTableViewCell") as? RepoTableViewCell else {return RepoTableViewCell()}
        cell.cunfigureCell(with: self.searchResult[indexPath.row])
        return cell
    }
    
    
}

extension ReposViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        DispatchQueue.global().async {
            if searchText.count >= 2 {
                let result = self.viewModel.repositories.value.filter {$0.name.localizedCaseInsensitiveContains(searchText)}
                    self.searchResult = result
            }else {
                self.searchResult = self.viewModel.repositories.value
            }
        }

    }
}
