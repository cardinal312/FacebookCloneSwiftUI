//
//  MarketPlaceViewModel.swift
//  FacebookClone
//
//  Created by Macbook on 24/2/24.
//

import Foundation

class MarketPlaceViewModel: ObservableObject {
    
    @Published var items: [Item] = [
        .init(id: UUID().uuidString, item_name: "1 bad 1 bathroom", item_price: 950, imageName: "appartment1"),
        .init(id: UUID().uuidString, item_name: "1 bad 1 bath flat", item_price: 800, imageName: "appartment2"),
        .init(id: UUID().uuidString, item_name: "2015 BMW", item_price: 2600, imageName: "car1"),
        .init(id: UUID().uuidString, item_name: "2020 Mercedes", item_price: 44, imageName: "car2"),
        .init(id: UUID().uuidString, item_name: "corner sofa", item_price: 80, imageName: "sofa1"),
        .init(id: UUID().uuidString, item_name: "corner sofa", item_price: 86, imageName: "sofa2")
    ]
}
