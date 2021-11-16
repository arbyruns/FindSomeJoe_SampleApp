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
            GeometryReader { geo in
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
                            GridView(shop: shop)
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
            .frame(width: geo.size.width, height: geo.size.height)
            .disabled(self.showSideBar ? true : false)
            .offset(x: self.showSideBar ? geo.size.width/2 : 0)
            if showSideBar {
                HStack {
                    SideBarView()
                        .frame(width: geo.size.width / 2)
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
