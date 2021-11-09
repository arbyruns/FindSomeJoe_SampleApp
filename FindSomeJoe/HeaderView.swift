//
//  HeaderView.swift
//  FindSomeJoe
//
//  Created by robevans on 11/8/21.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showSideBar: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                withAnimation {
                    showSideBar = true
                }
            }) {
                Image(systemName: "line.3.horizontal.decrease")
                    .font(.title)
                    .padding(.bottom)
                    .foregroundColor(Color("Color5"))
            }
            HStack {
                Text("Find Some")
                    .bold()
                    .textCase(.uppercase)
                    .font(.largeTitle)
                Spacer()
            }
            HStack{
                Text("joe")
                    .bold()
                    .foregroundColor(Color("Color5"))
                    .textCase(.uppercase)
                    .font(.largeTitle)
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(showSideBar: .constant(false))
    }
}
