//
//  PostListViewModel.swift
//  SocialApp
//
//  Created by Oleksandr Bretsko on 1/2/2021.
//

import UIKit
import XCoordinator

protocol PostListViewModelP: class {
    
    //MARK: Outputs
    
    var didUpdatePosts: (() -> Void)? {get set}
    
    var posts: [Post] {get}
    
    //MARK: Inputs
    
    func ready()
    
    func didSelectPost(at index: Int)
    
    func logoutButtonPressed()
}


class PostListViewModel: PostListViewModelP { 
    
    //MARK: - Outputs
    
    var didUpdatePosts: (() -> Void)?
    
    private(set) var posts: [Post] = [Post]() {
        didSet {
            didUpdatePosts?()
        }
    }
    
    //MARK: - Inputs
    
    func ready() {
        netService.loadPosts { [weak self] result in
            switch result {
            case .failure(let error):
                //TODO: handle error
                print("ERROR: \(error)")
                
            case .success(let posts):
                DispatchQueue.main.async { [weak self] in
                    self?.posts = posts
                }
            }
        }
        
        netService.loadPosts { [weak self] result in
            switch result {
            case .failure(let error):
                //TODO: handle error
                print("ERROR: \(error)")
                
            case .success(let posts):
                print("INFO: \(posts.count) posts received from network")
                DispatchQueue.main.async { [weak self] in
                    guard let strongSelf = self else {
                        return
                    }
                    strongSelf.posts = posts
                    strongSelf.didUpdatePosts?()
                }
            }
        }
    }
    
    func didSelectPost(at index: Int) {
        let post = posts[index]
        router.trigger(.post(post))
    }
    
    func logoutButtonPressed() {
        router.trigger(.logout)
    }
    
    //MARK: - Private properties
    
    private let netService: NetworkingServiceP
    private let router: UnownedRouter<PostsRoute>
    
    // MARK: - Init
    
    init(router: UnownedRouter<PostsRoute>,
         netService: NetworkingServiceP) {
        self.router = router
        self.netService = netService
    }
}

