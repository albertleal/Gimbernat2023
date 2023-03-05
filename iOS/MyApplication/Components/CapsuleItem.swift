//
//  CapsuleItem.swift
//  MyApplication
//
//  Created by ESLealAl on 23/3/23.
//

import SwiftUI

struct CapsuleItem: View {
    @State var capsule: Capsule

    var body: some View {
        HStack(spacing: 16) {
            AsyncImage(url: URL(string: capsule.imageUrl)){ image in
                image.resizable().aspectRatio(contentMode: ContentMode.fit)
            } placeholder: {
                Image(systemName: "photo")
            }.frame(width: 64, height: 64)
            .cornerRadius(8)
            .padding(.vertical, 8)
            
            VStack(alignment: .leading, spacing: 4) {
                   Text(capsule.name)
                       .font(.title)
                       .lineLimit(1)
                       .truncationMode(.tail)
                   
                   Text(capsule.description)
                        .font(.caption)
                       .lineLimit(3)
                       .truncationMode(.tail)
                   
                   Text("$\(capsule.price, specifier: "%.2f")")
                       .font(.body)
                       .fontWeight(.semibold)
                       .foregroundColor(.green)
                       .lineLimit(1)
                       .truncationMode(.tail)
                   
                   Text("Origin: \(capsule.origin)")
                       .font(.caption2)
                       .lineLimit(1)
                       .truncationMode(.tail)
                   
                   Text("Favour: \(capsule.flavorProfile)")
                       .font(.caption2)
                       .lineLimit(1)
                       .truncationMode(.tail)
                   
                   Text("Intensity: \(capsule.intensity)")
                       .font(.caption2)
                       .lineLimit(1)
                       .truncationMode(.tail)
               }
               .frame(maxWidth: .infinity, alignment: .leading)
        }.padding(.horizontal, 0)
        
    }
}

struct CapsuleItem_Previews: PreviewProvider {
    static var previews: some View {
        var capsule = Capsule(name: "Ristretto", imageUrl: "http://sample.com")
        CapsuleItem(capsule: capsule)
    }
}
