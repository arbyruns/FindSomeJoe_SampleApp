//
//  CoffeeShopView.swift
//  FindSomeJoe
//
//  Created by robevans on 11/6/21.
//

import SwiftUI

struct CoffeeShopView: View {
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

struct CoffeeShopView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopView()
        CoffeeShopView()
            .colorScheme(.dark)
    }
}

struct ShopAddressView: View {
    @StateObject var shopData = ShopData()
    @Environment(\.openURL) var openURL


    var body: some View {
        ZStack {
            Color("Color1")
                .cornerRadius(30)
            VStack {
                HStack {
                    Text(shopData.shopName)
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    Spacer()
                }
                HStack {
                    Image(systemName: "map")
                        .font(.callout)
                        .foregroundColor(Color("SkyBlue"))
                    Text(shopData.shopAddress)
                        .font(.callout)
                        .foregroundColor(Color("SkyBlue"))
                    Spacer()
                    Image(systemName: "star.fill")
                        .foregroundColor(Color("Color4"))
                    Text("\(String(format: "%.1f", shopData.shopRating))")
                        .font(.callout)
                        .foregroundColor(Color("SkyBlue"))
                }
                .padding(.horizontal)
                .padding(.bottom)
                .foregroundColor(.secondary)
                HStack{
                    Image(systemName: "phone")
                        .font(.callout)
                        .foregroundColor(Color("SkyBlue"))
                    Link(shopData.shopPhone, destination: URL(string: "tel:8005551212")!)
                        .font(.callout)
                        .foregroundColor(Color("SkyBlue"))
                    Spacer()
                    Button(action: {
                        openURL(URL(string: "https://www.coffee.com")!)
                    }) {
                        Image(systemName: "globe")
                            .font(.callout)
                            .foregroundColor(Color("SkyBlue"))
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                .foregroundColor(.secondary)
                Divider()
                    .frame(width: 250)
                Text("Reviews")
                    .bold()
                    .font(.title2)
                Text("Great Place")
                    .bold()
                    .font(.subheadline)
                    .padding(.top)
                Capsule()
                    .fill(Color("Color5"))
                    .frame(width: 105, height: 3)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .padding()
                Text("Great Place")
                    .bold()
                    .font(.subheadline)
                    .padding(.top)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .padding()
            }
        }
    }
}
