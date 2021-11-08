//
//  ContentView.swift
//  FindSomeJoe
//
//  Created by robevans on 11/6/21.
//

import SwiftUI

struct ContentView: View {

    let data = (1...CoffeeShopItems.count).map { "Item \($0)" }

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    @Environment(\.colorScheme) var colorScheme

    @State var showSheet = false
    @State var showFullCover = false
    @State var showSideBar = false
    @State var sidebarOffSet = CGSize.zero
    @ObservedObject var shopData: ShopData

    var body: some View {
        ZStack {
            Color("Background")
                .edgesIgnoringSafeArea(.all)
            VStack {
                HeaderView(showSideBar: $showSideBar)
                HStack {
                    Image(systemName: "map")
                        .font(.callout)
                    Text("\(CoffeeShopItems.count) Coffee Shops near you")
                        .font(.callout)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .foregroundColor(.secondary)
                .padding(.horizontal)
                .padding(.vertical, 8)
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(CoffeeShopItems){ shop in
                            ShopView(shop: shop)
                                .padding(.top)
                                .shadow(color: .black.opacity(colorScheme == .dark ? 1.0 : 0.3), radius: 4)
                                .onTapGesture {
                                    showSheet = true
                                    shopData.shopName = shop.shopName
                                    shopData.shopPhone = shop.shopPhone
                                    shopData.shopRating = shop.shopRating
                                    shopData.shopAddress = shop.shopAddress
                                    shopData.shopImage = shop.shopImage
                                }
                        }
                        .sheet(isPresented: $showSheet, content:{ CoffeeShopView(shopData: shopData)})
                        .fullScreenCover(isPresented: $showFullCover, content: {CoffeeShopView()})
                    }
                }
            }
            if showSideBar {
                HStack {
                    SideBarView()
                        .opacity(2 - Double(abs(sidebarOffSet.width / 75)))
                        .offset(x: self.sidebarOffSet.width)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in self.sidebarOffSet = gesture.translation }
                                .onEnded { value in
                                    switch self.sidebarOffSet.width {
                                    case ...(-100.105):
                                        withAnimation(.easeIn(duration: 0.5)) {
                                            showSideBar = false
                                            sidebarOffSet = CGSize.zero
                                        }
                                    default:
                                        withAnimation(.easeIn(duration: 0.5)) {
                                            sidebarOffSet = CGSize.zero
                                            print("mmmm")
                                        }
                                    }
                                }
                        )
                    Spacer()
                }
                .onTapGesture {
                    withAnimation {
                    showSideBar = false
                    }
                }
            }
        }
        .transition(.opacity)
        .animation(.easeIn)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(shopData: ShopData())
        ContentView(shopData: ShopData())
            .colorScheme(.dark)
    }
}

struct ShopView: View {

    var shop: CoffeeShops
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                Color("Color1")
                    .frame(width: 185, height: 225)
                    .clipShape(RoundedRectangle(cornerRadius: 23))
                VStack {
                    Image(shop.shopImage)
                        .resizable()
                        .frame(width: 175, height: 165)
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 23))
                        .padding(.horizontal, 8)
                        .padding(.top, 8)
                        .overlay(
                            VStack{
                                Spacer()
                                ZStack{
                                    Capsule()
                                        .fill(Color("Color5"))
                                        .frame(width: 90, height: 25)
                                        .padding(.leading)
                                    HStack {
                                        Spacer()
                                        Image(systemName: "star.fill")
                                            .foregroundColor(Color.yellow)
                                            .font(.footnote)
                                        Text("\(String(format: "%.1f", shop.shopRating))")
                                            .font(.footnote)
                                        Spacer()
                                    }
                                    .padding()
                                }

                            }
                        )
                    HStack {
                        Text(shop.shopName)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.leading)
                    HStack {
                        Text(shop.shopOpen ? "Open" : "Closed")
                            .foregroundColor(.secondary)
                            .font(.footnote)
                        Spacer()
                    }
                    .padding(.leading)
                }
            }
        }
    }
}
