//
//  ViewScene.swift
//  MyApplication
//
//  Created by ESLealAl on 20/3/23.
//

import SwiftUI

struct MainViewScene: View {
    
    @ObservedObject private var viewModel: MainSceneViewModel
    @State var selectedDetent: PresentationDetent = .medium

    init(_ viewModel: MainSceneViewModel){
        self.viewModel = viewModel
        viewModel.fetch()
    }

    var body: some View {
        ZStack {
            Color.gimberBackground().zIndex(0).ignoresSafeArea(.all)
            List {
                ForEach(viewModel.capsules, id: \.id) { capsule in
                    NavigationLink(destination:CapsuleDetailScene(capsule: capsule)) {
                        CapsuleItem(capsule: capsule)
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .secondaryAction) {
                Button {
                    self.viewModel.logout()
                } label: {
                    Text("Logout")
                }
            }
            ToolbarItem(placement: .secondaryAction) {
                Button {
                    self.viewModel.navigateToSettings()
                } label: {
                    Text("Settings")
                    
                }
            }
        }
        .sheet(isPresented: self.$viewModel.isSheetEnabled) {
            settings
                .presentationDetents([.medium], selection: self.$selectedDetent)
                .presentationDragIndicator(.hidden)
        }
        
    }
    
    var settings: some View {
        NavigationView {
            VStack{
                Text("Hello curious")
                    .font(.body)
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        self.viewModel.isSheetEnabled = false
                    } label: {
                        Text("close")
                    }
                }
            }
        }
    }
}

struct ViewScene_Previews: PreviewProvider {
    static var previews: some View {
        MainViewScene(MainSceneViewModel(navigator: nil, sessionDataSource: nil, capsulesDataSource: nil))
    }
}
