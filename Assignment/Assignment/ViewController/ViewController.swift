//
//  ViewController.swift
//  Assignment
//
//  Created by mradulatray on 30/05/24.
//

import UIKit




class ViewController: UIViewController {
    
    // MARK: - OUTLETS
    // ===============
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - VARIABLES
    // =================
    let viewModel = ViewModel()
    
    // MARK: - VIEW LIFE CYCLE FUNCTIONS
    // =================================
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableViewSetUp()
        fetchPosts(page: self.viewModel.page)
    }
    
    func tableViewSetUp() {
        self.tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
    }
    
    func fetchPosts(page: Int) {
        guard !self.viewModel.isLoading else { return }
        self.viewModel.isLoading = true
        NetworkManager.shared.fetchPosts(page: page) { [weak self] posts in
            guard let self = self, let posts = posts else { return }
            DispatchQueue.main.async {
                self.viewModel.posts.append(contentsOf: posts)
                self.tableView.reloadData()
                self.viewModel.isLoading = false
                self.viewModel.page += 1
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
        let post = self.viewModel.posts[indexPath.row]
        cell.titleLabel.text = post.title
        cell.idLabel.text = String(post.id)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = self.viewModel.posts[indexPath.row]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let screen = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else { return
        }
        screen.detailViewModel.postData = self.viewModel.getPost(index: indexPath.row)
        guard let nvc = self.navigationController else { return }
        nvc.pushViewController(screen, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height * 2 {
            fetchPosts(page: self.viewModel.page)
        }
    }
}
