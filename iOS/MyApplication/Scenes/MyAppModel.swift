//
//  MyAppModel.swift
//  MyApplication
//
//  Created by ESLealAl on 20/3/23.
//

import Foundation
enum AppRoutes {
    case PUBLIC
    case PRIVATE
}

class MyAppModel: ObservableObject {
    @Published var currentRoute: AppRoutes = .PUBLIC
    @Published var isLoading = true
}

protocol AppNavigator {
    func navigateTo( route: AppRoutes)
    func showLoading(_ enabled: Bool)
}

extension MyAppModel: AppNavigator {
    func showLoading(_ enabled: Bool = true) {
        self.isLoading = enabled
    }
    
    func navigateTo(route: AppRoutes) {
        self.currentRoute = route
    }
}
