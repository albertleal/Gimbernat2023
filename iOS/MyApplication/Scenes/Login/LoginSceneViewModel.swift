//
//  LoginSceneViewModel.swift
//  MyApplication
//
//  Created by ESLealAl on 20/3/23.
//

import Foundation

class LoginSceneViewModel: ObservableObject {
    private let navigator: AppNavigator?
    private let sessionDataSource: SessionDataSource?
    
    @Published var isLoading = false
    @Published var erroMessage: String?
    
    init(navigator: AppNavigator?, sessionDataSource: SessionDataSource?) {
        self.navigator = navigator
        self.sessionDataSource = sessionDataSource
    }
    
    func login(email: String, password: String) {
        Task {
            self.isLoading = true
        
            guard let logged = await self.sessionDataSource?.loginUser(email: email, password: password) else {
                return
            }
            //Is the user logged in?
            if(logged){
                self.navigator?.navigateTo(route: .PRIVATE)
            } else{
                self.erroMessage = "Incorrect Credentials"
            }
            
            self.isLoading = false
        
        }
    }
    
    func signUp(email: String, password: String) {
        Task {
            self.isLoading = true
            
            guard let logged = await self.sessionDataSource?.signUpUser(email: email, password: password) else {
                return
            }
            //Is the user logged in?
            if(logged){
                self.navigator?.navigateTo(route: .PRIVATE)
            } else{
                self.erroMessage = "Email already in use"
            }
            
            self.isLoading = false
        }
    }
}
