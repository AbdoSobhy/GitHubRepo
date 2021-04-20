//
//  RepoTableViewCell.swift
//  GitHubRepos
//
//  Created by Abdelrahman Sobhy on 4/20/21.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    @IBOutlet weak var repoAvater: UIImageView!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var ownerName: UILabel!
    
    func cunfigureCell(with object: Repositories){
        if let image = loadImage(imageUrl: object.owner.avatarURL) {
            self.repoAvater.image = image
        } else {
            self.repoAvater.isHidden = true
        }
        self.repoName.text = object.name
        self.ownerName.text = object.owner.login
    }
    
    func loadImage(imageUrl: String) -> UIImage?{
        guard let url = URL(string: imageUrl) else {return nil}
        do {
            let data = try Data(contentsOf: url)
            return UIImage(data: data)
        } catch {
            return nil
        }
    }

}
