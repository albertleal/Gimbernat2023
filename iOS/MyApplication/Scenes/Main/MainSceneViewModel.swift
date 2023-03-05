//
//  MainSceneViewModel.swift
//  MyApplication
//
//  Created by ESLealAl on 20/3/23.
//

import Foundation


class MainSceneViewModel: ObservableObject {
    private let navigator: AppNavigator?
    private let sessionDataSource: SessionDataSource?
    private let capsulesDataSource: CapsulesDataSource?
    
    @Published var capsules = [Capsule]()
    @Published var isSheetEnabled = false
    
    init(navigator: AppNavigator?,
         sessionDataSource: SessionDataSource?,
         capsulesDataSource: CapsulesDataSource?
    ) {
        self.navigator = navigator
        self.sessionDataSource = sessionDataSource
        self.capsulesDataSource = capsulesDataSource
    }
    
    func fetch() {
        
        self.capsulesDataSource?.subscribe(callback: { capsules in
            DispatchQueue.main.async {
                self.capsules = capsules
            }
        })
    }
    
    func navigateToSettings(){
        self.isSheetEnabled = true
    }
    
    func logout(){
        self.sessionDataSource?.signOutUser()
        self.navigator?.navigateTo(route: .PUBLIC)
    }
}
