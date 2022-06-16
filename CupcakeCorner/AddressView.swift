//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Roman Zherebko on 16.06.2022.
//

import SwiftUI

struct AddressView: View {
    @State var orderDetails: OrderDetails
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $orderDetails.name)
                TextField("Street address", text: $orderDetails.streetAddress)
                TextField("City", text: $orderDetails.city)
                TextField("Zip", text: $orderDetails.zip)
            }
            
            Section {
                NavigationLink {
                    CheckoutView(orderDetails: orderDetails)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(orderDetails.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(orderDetails: OrderDetails())
        }
    }
}
