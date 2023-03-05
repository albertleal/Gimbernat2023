//
//  WelcomeScene.swift
//  MyApplication
//
//  Created by ESLealAl on 20/3/23.
//

import SwiftUI

struct WelcomeScene: View {
    @ObservedObject private var viewModel: WelcomeSceneViewModel
    
    init(_ viewModel: WelcomeSceneViewModel){
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            Spacer()
            Text("Welcome").font(.largeTitle)
            Text("Lorem ipsum").font(.body)

            Spacer()
            NavigationLink("Navigate to Login") {
                viewModel.navigateView()
            }
            Spacer(minLength: 15.0)
           
        }
        
    }
}

struct WelcomeScene_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScene(WelcomeSceneViewModel(navigator: nil))
    }
}
