//
//  SideBarView.swift
//  FindSomeJoe
//
//  Created by robevans on 11/8/21.
//

import SwiftUI

struct SideBarView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            Color("Background")
                .shadow(color: .black.opacity(colorScheme == .dark ? 1.0 : 0.3), radius: 4)
            VStack(alignment: .leading) {
                SideBarIconView(text: "Map", image: "map")
                SideBarIconView(text: "Favorites", image: "star")
                SideBarIconView(text: "Settings", image: "gear")
                Spacer()
            }
            .padding(.top, 45)
        }
        .frame(width: 225)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}

struct SideBarIconView: View {
    let text: String
    let image: String

    var body: some View {
        HStack{
            Image(systemName: image)
            Text(text)
                .fontWeight(.semibold)
            Spacer()
        }
        .padding()
    }
}
