//
//  MyApp.swift
//  MyApp
//
//  Created by ESLealAl on 16/2/23.
//
import SwiftUI
import FirebaseCore

@main
struct MyApp: App {
    ///A reference to the appdelegate method needed to initialize Firebase
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @ObservedObject private var myAppModel: MyAppModel = MyAppModel()
 
    private var sessionDataSource: SessionDataSource = SessionDataSource()
    private var capsulesDataSource: CapsulesDataSource = CapsulesDataSource()
    
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                content
                if(self.myAppModel.isLoading){
                    LoadingView()
                }
            }.onAppear {
                myAppModel.currentRoute = sessionDataSource.isLoggedIn() ? .PRIVATE : .PUBLIC
                self.myAppModel.showLoading(false)
            }
            
        }
    }
    
    @ViewBuilder
    var content: some View {
            switch myAppModel.currentRoute {
            case .PUBLIC:
                NavigationView{
                    WelcomeSceneFactory(self.myAppModel)
                        .create()
                        .navigationTitle("Welcome")
                        .environmentObject(myAppModel)
                }
                    
            case .PRIVATE:
                NavigationView{
                    MainSceneFactory(self.myAppModel,
                                     sessionDataSource: self.sessionDataSource,
                                     capsulesDataSource: self.capsulesDataSource)
                        .create()
                        .navigationTitle("Capsule List")
                    .environmentObject(myAppModel)
                    
                }
        }
    }
}
