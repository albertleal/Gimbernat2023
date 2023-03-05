//
//  LoginSceneView.swift
//  MyApplication
//
//  Created by ESLealAl on 20/3/23.
//
//https://codingwithmohit.com/mobile/jetpack_compose_vs_swiftui/
import SwiftUI

struct LoginScene: View {
    @ObservedObject private var viewModel: LoginSceneViewModel
    @State var email: String = "albert.leal@eug.es"
    @State var password: String = "P455w0rd#"
    
    init(_ viewModel: LoginSceneViewModel){
        self.viewModel = viewModel
    }

    var form: some View {
        VStack{
            Spacer()
            Text("Login").font(.largeTitle)
            
            if(viewModel.erroMessage != nil) {
                Text(viewModel.erroMessage!)
                    .font(.subheadline)
                    .foregroundColor(.red)
            }
            
            TextField("Email", text: self.$email)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
                .padding(.bottom, 16)
            
            SecureField("Password", text: self.$password)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.default)
                .padding(.bottom, 16)
            
            Divider()
            HStack{
                Button {
                    self.viewModel.signUp(email: self.email, password: self.password)
                } label: {
                    Text("Sign Up")
                }
                Spacer()
                Button {
                    self.viewModel.login(email: self.email, password: self.password)
                } label: {
                    Text("Log In")
                }
            }
            Spacer()
        }.padding(.horizontal, 20)
    }
    var body: some View {
        ZStack{
            form
            if(self.viewModel.isLoading){
                Color.clear
                    .background(
                    .thinMaterial,
                    in: RoundedRectangle(cornerRadius: 8, style: .continuous)
                    ).ignoresSafeArea()
                VStack{
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            }
            
            
        }
    }
}

struct LoginSceneView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScene(LoginSceneViewModel(navigator: nil, sessionDataSource: nil))
    }
}
