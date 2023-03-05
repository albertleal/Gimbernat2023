//
//  WelcomeSceneFactory.swift
//  MyApplication
//
//  Created by ESLealAl on 20/3/23.
//

import SwiftUI

struct WelcomeSceneFactory {
    private let navigator: AppNavigator
    
    init(_ navigator: AppNavigator){
        self.navigator = navigator
    }
    
    func create() -> some View {
        let vm = WelcomeSceneViewModel(navigator: self.navigator)
        return WelcomeScene(vm)
    }
}
