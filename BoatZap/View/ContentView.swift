//
//  ContentView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 2/17/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI
import Firebase

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("BoatZap Navagator")
                    .font(.largeTitle)
                    .foregroundColor(Color.blue)
                NavigationLink(destination: UserInfoView()) {
                    Text("New Users View")
                }
                NavigationLink(destination: SellerHomeView()) {
                    Text("Seller Home View")
                }
                NavigationLink(destination: BuyerHomeView()) {
                    Text("Buyer Home View")
                }
                NavigationLink(destination: CreditView()) {
                    Text("Credits")
                }
            }
        }
//            .onAppear() {
//        let db = Firestore.firestore()
//        db.collection("users").getDocuments() {
//            (querySnapshot, err) in
//                if let err = err {
//                    print("Error getting documents: \(err)")
//
//                }else {
//                    for document in querySnapshot!.documents {
//                        print("\(document.documentID) => \(document.data())")
//                    }
//                }
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
