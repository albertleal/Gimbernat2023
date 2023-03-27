//
//  CapsuleDetailViewModel.swift
//  MyApplication
//
//  Created by ESLealAl on 23/3/23.
//

import Foundation

class CapsuleDetailViewModel: ObservableObject {
    @Published var capsule: Capsule
    
    init(capsule: Capsule) {
        self.capsule = capsule
    }
}
