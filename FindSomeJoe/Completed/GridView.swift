//
//  GridView.swift
//  FindSomeJoe
//
//  Created by robevans on 11/9/21.
//

import SwiftUI

struct GridView: View {
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
                    }
                    .padding(.leading)
                    HStack {
                        Text(shop.shopOpen ? "Open" : "Closed")
                            .foregroundColor(.white)
                            .font(.footnote)
                    }
                    .padding(.leading)
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(shop: CoffeeShops(shopName: "Not Just Coffee", shopAddress: "Some Address", shopOpen: true, shopRating: 4.5, shopPhone: "123-321-2323", shopWebsite: "www.rickroll.com", shopImage: "coffeeShop1"))
    }
}
