//
//  PostController.swift
//  continuumCK
//
//  Created by Matthew O'Connor on 10/15/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit
import CloudKit

class PostController {
    static let shared = PostController()
    var post: [Post] = []
    
    func addComment(text: String, post: Post, completion: @escaping (_ comment: Comment)->Void) {
        let newComment = Comment(text: text, post: post)
        post.comments.append(newComment)
    }
    
    func createPostWith(image: UIImage, caption: String, completion: @escaping (_ post: Post?)-> Void) {
        let newPost = Post(caption: caption, photo: image)
        post.append(newPost)
    }
}
