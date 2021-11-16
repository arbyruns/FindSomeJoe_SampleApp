//
//  ShopAddressView.swift
//  FindSomeJoe
//
//  Created by robevans on 11/16/21.
//

import SwiftUI

struct ShopAddressView: View {
    @StateObject var shopData = ShopData()
    @Environment(\.openURL) var openURL


    var body: some View {
        VStack {
            Text(shopData.shopName)
        }
    }
}

struct ShopAddressView_Previews: PreviewProvider {
    static var previews: some View {
        ShopAddressView()
    }
}
