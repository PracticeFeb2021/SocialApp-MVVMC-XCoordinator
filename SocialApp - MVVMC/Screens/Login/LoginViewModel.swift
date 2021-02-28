//
//  HomeViewModel.swift
//  SocialApp-MVVMC
//
//  Created by Oleksandr Bretsko on 2/27/21.
//


import UIKit
import XCoordinator

protocol LoginViewModelP: class {
    
    //MARK: Inputs
    
    func loginButtonTapped()
}

class LoginViewModel: LoginViewModelP {
    
    //MARK: - Inputs

    func loginButtonTapped() {
        appRouter.trigger(.home)
    }

    //MARK: - Private properties
    
    private let netService: NetworkingServiceP
    private let loginRouter: UnownedRouter<LoginRoute>
    private let appRouter: UnownedRouter<AppRoute>

    // MARK: - Init
    
    init(netService: NetworkingServiceP,
         loginRouter: UnownedRouter<LoginRoute>,
         appRouter: UnownedRouter<AppRoute>) {
        
        self.loginRouter = loginRouter
        self.appRouter = appRouter
        self.netService = netService
    }
}

