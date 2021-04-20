//  Alert+Extension.swift
//  GitHubRepos
//
//  Created by Abdelrahman Sobhy on 4/20/21.
//

import UIKit

extension UIViewController{
    
    func alert(title: String = "", message: String, actions: [(String, UIAlertAction.Style, ((UIAlertAction) -> Void))] = []) {
        
        let alerting = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for action in actions {
            alerting.addAction(UIAlertAction(title: action.0, style: action.1, handler: action.2))
        }
        self.present(alerting, animated: true, completion: nil)
    }
    


}
