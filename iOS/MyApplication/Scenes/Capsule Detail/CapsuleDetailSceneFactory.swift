//
//  CapsuleDetailSceneFactory.swift
//  MyApplication
//
//  Created by ESLealAl on 23/3/23.
//

import SwiftUI

struct CapsuleDetailSceneFactory {
    private let capsule: Capsule

    init(capsule: Capsule
    ){
        self.capsule = capsule
    }

    func create() -> some View {
        let vm = CapsuleDetailViewModel(capsule: self.capsule)
        return CapsuleDetailScene(vm)
    }

}
