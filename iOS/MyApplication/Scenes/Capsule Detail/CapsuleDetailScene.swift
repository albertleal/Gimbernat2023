//
//  CapsuleDetailScene.swift
//  MyApplication
//
//  Created by ESLealAl on 20/3/23.
//

import SwiftUI

struct CapsuleDetailScene: View {
    @ObservedObject private var viewModel: CapsuleDetailViewModel
    @Environment(\.dismiss) var dismiss
    
    
    init(_ viewModel: CapsuleDetailViewModel){
        self.viewModel = viewModel
    }

    var body: some View {
        VStack{
            AsyncImage(url: URL(string: (self.viewModel.capsule.heroImageUrl) ?? self.viewModel.capsule.imageUrl)){ image in
                image.resizable().aspectRatio(contentMode: ContentMode.fit)
            } placeholder: {
                Image(systemName: "photo")
            }.frame(width: 64, height: 64)
            .cornerRadius(8)
            .padding(.vertical, 8)
            
            ScrollView{
                VStack(spacing: 8) {
                    Group {
                        Text("Flavor Profile")
                            .font(.subheadline)
                            .fontWeight(.bold)

                        Text(self.viewModel.capsule.flavorProfile)
                            .font(.body)

                        Spacer().frame(height: 8)
                    }
                    Group {
                        
                        Text("Origin")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text(self.viewModel.capsule.origin)
                            .font(.body)
                        
                        Spacer().frame(height: 8)
                    }
                    Group {
                        Text("Intensity")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text("\(self.viewModel.capsule.intensity)")
                            .font(.body)
                        
                        Spacer().frame(height: 8)
                    }
                    Group {
                        Text("Price")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text("$\(self.viewModel.capsule.price, specifier: "%.2f")")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                        
                        Spacer().frame(height: 8)
                    }
                    Group {
                        Text("Categories")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text(self.viewModel.capsule.categories.joined(separator: ", "))
                            .font(.body)
                        
                        Spacer().frame(height: 16)
                    }
                    Group {
                        Text("Description")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        
                        Text(self.viewModel.capsule.description)
                            .font(.body)
                        
                        Spacer().frame(height: 150)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)
            }
        }
        
    }
}

struct CapsuleDetailScene_Previews: PreviewProvider {
    static var previews: some View {
        let vm = CapsuleDetailViewModel(capsule: Capsule())
        CapsuleDetailScene(vm)
    }
}
