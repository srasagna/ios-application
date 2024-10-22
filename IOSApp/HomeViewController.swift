//
//  HomeViewController.swift
//  IOSApp
//
//  Created by INFOMERICA1 on 07/05/24.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    let images = ["Bg_1", "Bg_1", "Bg_1", "Bg_1", "Bg_1", "Bg_1", "Bg_1", "Bg_1"]
    let likes = ["5", "10", "6", "29", "17", "14", "27", "25"]
   
    @IBOutlet weak var postTableViewCell: UITableView!
    let posts: [PostsTableViewCellViewModel] = [
        .init(imageName: "Bg_1", likesCount: "10"),
        .init(imageName: "Bg_2", likesCount: "29"),
        .init(imageName: "Bg_3", likesCount: "17"),
        .init(imageName: "Bg_4", likesCount: "14"),
        .init(imageName: "Bg_5", likesCount: "27"),
        .init(imageName: "Bg_6", likesCount: "25"),
        .init(imageName: "Bg_7", likesCount: "30"),
        .init(imageName: "Bg_8", likesCount: "5")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTableViewCell.dataSource = self
        postTableViewCell.delegate = self
        let cell = UINib(nibName: "ReelsTableViewCell", bundle: .main)
        postTableViewCell.register(cell, forCellReuseIdentifier: "ReelsTableViewCell")

    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0  || section == 3{
            return 1
        }else{
            return posts.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 || indexPath.section == 3{
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReelsTableViewCell") as? ReelsTableViewCell
            return cell ?? UITableViewCell()
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostsTableViewCell") as? PostsTableViewCell
            cell?.setupView(model: posts[indexPath.row])
            return cell ?? UITableViewCell()
            
        }
        
    }
  
  

}

