//
//  PostsTableViewCell.swift
//  IOSApp
//
//  Created by INFOMERICA1 on 27/05/24.
//

import UIKit
struct PostsTableViewCellViewModel {
    let imageName: String
    let likesCount: String
}

class PostsTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var postsImageView: UIImageView!
    
    @IBOutlet weak var likesLabel: UILabel!
    
    func setupView(model: PostsTableViewCellViewModel){
        self.postsImageView.image = UIImage(named: model.imageName)
        self.likesLabel.text = "\(model.likesCount)Likes"
        
        
    }
}
