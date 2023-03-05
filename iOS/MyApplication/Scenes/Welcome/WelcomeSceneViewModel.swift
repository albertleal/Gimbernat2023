//
//  WelcomeSceneViewModel.swift
//  MyApplication
//
//  Created by ESLealAl on 20/3/23.
//

import SwiftUI

class WelcomeSceneViewModel: ObservableObject {
    private let navigator: AppNavigator?
    
    init(navigator: AppNavigator?) {
        self.navigator = navigator
    }
    
    func navigateView() -> some View{
        return LoginSceneFactory(self.navigator!, sessionDataSource: SessionDataSource())
            .create()

    }
}

