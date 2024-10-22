//
//  AccountViewController.swift
//  IOSApp
//
//  Created by INFOMERICA1 on 07/05/24.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var accountImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        accountImage.backgroundColor = .lightGray
        accountImage.layer.masksToBounds = true
        accountImage.layer.cornerRadius = accountImage.frame.height/2

    }
    


}
