//
//  LoadingView.swift
//  MyApplication
//
//  Created by ESLealAl on 23/3/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack{
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

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
