//
//  RepositoriesViewController.swift
//  GitHubRepos
//
//  Created by Flavio on 17/10/2019.
//  Copyright © 2019 PedroHenrique. All rights reserved.
//

import UIKit
import PullToRefresh
import JGProgressHUD
import AlamofireImage


class RepositoriesViewController: UIViewController, RepositoriesView {
   
    var itensRepositories : [RepositoryItem] = []

    var presenter =  RepositoriesPresenter()
    let hud = JGProgressHUD(style: .light)
    
    @IBOutlet weak var tbRepositories: UITableView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewController = self
        configTableView()
        presenter.feachAllRepositories()
        
    }
    
    
    func configTableView(){
        
        let refresher = PullToRefresh()
        tbRepositories.addPullToRefresh(refresher) {

            self.presenter.feachAllRepositories()
        }
    }
    
    func feachAllRepositories(repositories: [RepositoryItem]) {
        
        itensRepositories = repositories
        tbRepositories.endAllRefreshing()
        tbRepositories.reloadData()
    }
    
    func errorFeachRespositories(error: String) {
        
        hud.textLabel.text = error
        hud.show(in: self.view)
        hud.dismiss(afterDelay: 3.0)
    }
    
    func displayLoadingView(show: Bool) {
        
        show ? hud.show(in: self.view) : hud.dismiss()
        
    }
    
    
    
    
    deinit {
        tbRepositories.removeAllPullToRefresh()
    }


}

extension RepositoriesViewController :  UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itensRepositories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellRepository", for: indexPath)
        
        let title = cell.viewWithTag(1000) as! UILabel
        let starsCount = cell.viewWithTag(1001) as! UILabel
        let subtitle = cell.viewWithTag(1002) as! UILabel
        let iv = cell.viewWithTag(1003) as! UIImageView
        let userName = cell.viewWithTag(1004) as! UILabel
        
        
        
        let item = itensRepositories[indexPath.row]
        
        title.text = item.fullName
        starsCount.text = "\(item.stargazersCount ?? 0)"
        subtitle.text = item.itemDescription
        userName.text = item.owner?.login
        
        if let url = URL(string: ((item.owner?.avatarUrl)!)){
            iv.af_setImage(withURL: url)
            iv.clipsToBounds = true
        }
        
        
        return cell
    }
    
    
    
    
}
