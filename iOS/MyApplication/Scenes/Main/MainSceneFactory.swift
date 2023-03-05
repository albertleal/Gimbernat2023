//
//  MainSceneFactory.swift
//  MyApplication
//
//  Created by ESLealAl on 20/3/23.
//

import SwiftUI

struct MainSceneFactory {
    private let navigator: AppNavigator
    private let sessionDataSource: SessionDataSource
    private let capsulesDataSource: CapsulesDataSource


    init(_ navigator: AppNavigator,
         sessionDataSource: SessionDataSource,
         capsulesDataSource: CapsulesDataSource
    ){
        self.navigator = navigator
        self.sessionDataSource = sessionDataSource
        self.capsulesDataSource = capsulesDataSource
    }

    func create() -> some View {
        let vm = MainSceneViewModel(
            navigator: self.navigator,
            sessionDataSource: self.sessionDataSource,
            capsulesDataSource: self.capsulesDataSource
        )
        return MainViewScene(vm)
    }
}

