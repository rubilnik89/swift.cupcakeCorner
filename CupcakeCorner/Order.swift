//
//  Order.swift
//  CupcakeCorner
//
//  Created by Roman Zherebko on 16.06.2022.
//

import SwiftUI

class Order: ObservableObject, Codable {
    enum CodingKeys: CodingKey {
        case orderDetails
    }
    
    @Published var orderDetails: OrderDetails = OrderDetails()
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(orderDetails, forKey: .orderDetails)
    }
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        orderDetails = try container.decode(OrderDetails.self, forKey: .orderDetails)
    }
}

struct OrderDetails: Codable {
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.trimmed().isEmpty || streetAddress.trimmed().isEmpty || city.trimmed().isEmpty || zip.trimmed().isEmpty {
            return false
        }
        
        return true
    }
        
    var cost: Double {
        var cost = Double(quantity) * 2
        
        cost += (Double(type) / 2)
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}
