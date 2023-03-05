//
//  LoginSceneFactory.swift
//  MyApplication
//
//  Created by ESLealAl on 20/3/23.
//

import SwiftUI

struct LoginSceneFactory {
    private let navigator: AppNavigator
    private let sessionDataSource: SessionDataSource
    
    init(_ navigator: AppNavigator, sessionDataSource: SessionDataSource){
        self.navigator = navigator
        self.sessionDataSource = sessionDataSource
    }
    
    func create() -> some View {
        let vm = LoginSceneViewModel(
            navigator: self.navigator,
            sessionDataSource: self.sessionDataSource
        )
        return LoginScene(vm)
    }
}
