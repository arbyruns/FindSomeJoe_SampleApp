//
//  SwiftUIView.swift
//  FindSomeJoe
//
//  Created by robevans on 11/6/21.
//

import SwiftUI
//https://coolors.co/ede0d4-e6ccb2-ddb892-b08968-7f5539-9c6644

class ShopData: ObservableObject {
    @Published var shopName = "Not Just Coffee"
    @Published var shopAddress = "123 some address"
    @Published var shopOpen = false
    @Published var shopRating = 5.0
    @Published var shopPhone = "123-123-1234"
    @Published var shopWebsite = "www.bing.com"
    @Published var shopImage = "coffeeShop3"
}

struct CoffeeShops: Identifiable {
    var id = UUID()
    var shopName: String
    var shopAddress: String
    var shopOpen: Bool
    var shopRating: Double
    var shopPhone: String
    var shopWebsite: String
    var shopImage: String
}

let CoffeeShopItems = [
    CoffeeShops(shopName: "Coffee Mirage", shopAddress: "2361 Union Street, Seattle, Washington, 98001", shopOpen: true, shopRating: 3.4, shopPhone: "206-555-0159", shopWebsite: "wwww.coffeemirage.io", shopImage: "coffeeShop1"),
    CoffeeShops(shopName: "The Coffee Table", shopAddress: "1321 Union Street, Seattle, Washington, 98001", shopOpen: false, shopRating: 4.4, shopPhone: "206-555-5389", shopWebsite: "wwww.cofeetable.com", shopImage: "coffeeShop2"),
    CoffeeShops(shopName: "Cafe Studio", shopAddress: "4828 Conaway Street, Seattle, Washington, 98101", shopOpen: true, shopRating: 4.0, shopPhone: "206-555-6464", shopWebsite: "wwww.cafestudio.net", shopImage: "coffeeShop3"),
    CoffeeShops(shopName: "Just Coffee", shopAddress: "3749 University Street, Seattle, Washington, 98119", shopOpen: true, shopRating: 5.0, shopPhone: "206-555-0128", shopWebsite: "wwww.justcoffee.com", shopImage: "coffeeShop4"),
    CoffeeShops(shopName: "Coffee Beans", shopAddress: "2729 University Street, Seattle, Washington, 98119", shopOpen: false, shopRating: 3.8, shopPhone: "206-555-5782", shopWebsite: "wwww.coffeemirage.io", shopImage: "coffeeShop5"),
    CoffeeShops(shopName: "Coffee Cup", shopAddress: "2365 Owagner Lane, Seattle, Washington, 98109", shopOpen: true, shopRating: 4.2, shopPhone: "206-555-1294", shopWebsite: "wwww.coffeemirage.io", shopImage: "coffeeShop6"),
    CoffeeShops(shopName: "JavaHut", shopAddress: "1000 Conaway Street, Seattle, Washington, 98101", shopOpen: false, shopRating: 4.7, shopPhone: "206-555-6464", shopWebsite: "wwww.javaHut.com", shopImage: "coffeeShop7")
    ]
