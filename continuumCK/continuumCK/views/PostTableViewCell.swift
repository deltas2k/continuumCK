//
//  PostTableViewCell.swift
//  continuumCK
//
//  Created by Matthew O'Connor on 10/15/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    
    @IBOutlet weak var commentCountLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!

    
    func updateViews() {
        guard let post = post else {return}
        photoImageView.image = post.photo
        captionLabel.text = post.caption
        commentCountLabel.text = "\(post.comments.count)"
    }

}
