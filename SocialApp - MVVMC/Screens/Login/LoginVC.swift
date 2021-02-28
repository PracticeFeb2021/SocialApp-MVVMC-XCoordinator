//
//  LoginVC.swift
//  SocialApp-MVVMC
//
//  Created by Oleksandr Bretsko on 2/27/21.
//

import UIKit

class LoginVC: UIViewController {
    
    var viewModel: LoginViewModelP!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Login"
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        viewModel.loginButtonTapped()
    }
}
