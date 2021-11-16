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
            GeometryReader { geo in
                VStack {
                   ShopAddressView()
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct CoffeeShopView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeShopView()
        CoffeeShopView()
            .colorScheme(.dark)
    }
}
