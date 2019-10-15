//
//  PostDetailTableViewController.swift
//  continuumCK
//
//  Created by Matthew O'Connor on 10/15/19.
//  Copyright © 2019 Matthew O'Connor. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    
    var post: Post? {
        didSet {
            updateViews()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func commentButtonTapped(_ sender: Any) {
    }
    @IBAction func shareButtonTapped(_ sender: Any) {
    }
    @IBAction func followButtonTapped(_ sender: Any) {
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let post = post else {return 0}
        return post.comments.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath)
        let comment = post?.comments[indexPath.row]
        cell.textLabel?.text = comment?.text
        cell.detailTextLabel?.text = comment?.timestamp.stringWith(dateStyle: .medium, timeStyle: .short)
        return cell
    }
    
    
    func updateViews() {
        guard let post = post else {return}
        photoImageView.image = post.photo
    }
    
    func presentCommentAlert() {
        let alertController = UIAlertController(title: "Add a comment", message: "add a comment to this photo", preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "you're comment here"
            textField.autocorrectionType = .yes
            textField.autocapitalizationType = .sentences
        }
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel)
        let commentAction = UIAlertAction(title: "comment", style: .default) { (_) in
            guard let commentText = alertController.textFields?.first?.text, !commentText.isEmpty,
                let post = self.post else {return}
            PostController.shared.addComment(text: commentText, post: post) { (comment) in
                //
            }
            self.tableView.reloadData()
        }
        alertController.addAction(cancelAction)
        alertController.addAction(commentAction)
        present(alertController, animated: true)
    }
}
