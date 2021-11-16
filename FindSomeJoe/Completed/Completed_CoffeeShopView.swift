//
//  Completed_CoffeeShopView.swift
//  FindSomeJoe
//
//  Created by robevans on 11/16/21.
//

import SwiftUI

struct Completed_CoffeeShopView: View {
    @StateObject var shopData = ShopData()
    @State var setFavorite = false
    @State var animate = false

    var body: some View {
        ZStack {
            Color("Background")
            VStack {
                GeometryReader { geo in
                    VStack {
                        Image(shopData.shopImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geo.size.width, height: geo.size.height / 3, alignment: .center)
                            .edgesIgnoringSafeArea(.all)
                            .overlay(
                                VStack(alignment: .leading) {
                                    Button(action: {
                                        withAnimation {
                                            setFavorite.toggle()
                                            self.animate = true
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                            withAnimation {
                                                animate = false
                                            }
                                        }
                                    }) {
                                        Image(systemName: setFavorite ? "heart" : "heart.fill")
                                            .font(.largeTitle)
                                            .padding()
                                            .scaleEffect(animate ? 1.4 : 1.0)
                                            .foregroundColor(Color("Color4"))
                                        Spacer()
                                    }
                                    Spacer()
                                }
                            )
                        ScrollView(.vertical, showsIndicators: false) {
                            ShopAddressView(shopData: shopData)
                        }
                    }
                    .padding(.top, 28)
                }
//                .padding()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Completed_CoffeeShopView_Previews: PreviewProvider {
    static var previews: some View {
        Completed_CoffeeShopView()
    }
}
