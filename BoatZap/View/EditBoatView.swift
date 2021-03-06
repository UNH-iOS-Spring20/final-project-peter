//
//  EditBoatView.swift
//  BoatZap
//
//  Created by Peter Aurigemma on 3/31/20.
//  Copyright © 2020 Peter Aurigemma. All rights reserved.
//

import SwiftUI

struct EditBoatView: View {
    @ObservedObject var boat: Boat
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            Group {
                VStack(spacing: 25) {
                    Text("Edit \(boat.name)")
                        .font(.largeTitle)
                        .foregroundColor(Color.blue)
                    HStack {
                        Text("Boat Name:")
                            .foregroundColor(Color.blue)
                        TextField("Enter Name", text: $boat.name)
                            .accentColor(.yellow)
                            .padding(3)
                            .background(Color.blue)
                    }
                    HStack {
                        Text("Boat Type:")
                            .foregroundColor(Color.blue)
                        TextField("Enter type", text: $boat.type)
                            .accentColor(.yellow)
                            .padding(3)
                            .background(Color.blue)
                    }
                    HStack {
                        Text("Boat Make:")
                            .foregroundColor(Color.blue)
                        TextField("Enter Make", text: $boat.make)
                            .accentColor(.yellow)
                            .padding(3)
                            .background(Color.blue)
                    }
                    HStack {
                        Text("Boat Length:")
                            .foregroundColor(Color.blue)
                        TextField("Enter Length", text: $boat.length)
                            .accentColor(.yellow)
                            .padding(3)
                            .background(Color.blue)
                    }
                    HStack {
                        Text("Boat Price:")
                            .foregroundColor(Color.blue)
                        TextField("Enter Price", text: $boat.price)
                            .accentColor(.yellow)
                            .padding(3)
                            .background(Color.blue)
                    }
                    HStack {
                        Text("Boat Address:")
                            .foregroundColor(Color.blue)
                        TextField("Enter Address", text: $boat.address)
                            .accentColor(.yellow)
                            .padding(3)
                            .background(Color.blue)
                    }
                    
                    Button(action: {
                        self.updateBoat()
                    }) {
                        Text("Save")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.center)
                    .padding(10)
                    .background(Color.blue)
                    .cornerRadius(15)
                    Spacer()
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Error"), message: Text(Variables.alertText), dismissButton: .default(Text("OK")))
                }
            }
            .padding()
        }
    }
    
    func updateBoat() {
        
        if Double(boat.price) == nil {
            print("price is NOT a double")
            Variables.alertText = "The selling price can only contain numbers and one decimal point"
            self.showingAlert.toggle()
        }
        else {
            if (Double(Variables.oldPrice) !=  Double(boat.price)){
                print("***** Price changed from \(Variables.oldPrice) to \(boat.price)")
            }
            else {
                print("***** No price change ")
            }
            
            if !boat.name.isEmpty && !boat.type.isEmpty && !boat.make.isEmpty && !boat.length.isEmpty && !boat.price.isEmpty && !boat.address.isEmpty {
                boatsCollectionRef.document(boat.id).setData(boat.data)
                
                showNotification()
                
                dismiss()
            } else {
                Variables.alertText = "All Fields must be filled in to save"
                self.showingAlert.toggle()
            }
        }
    }
    
    func showNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "Boat \(boat.name) Price Changed"
        content.subtitle = "from $\(Variables.oldPrice) to $\(boat.price)"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }
    
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct EditBoatView_Previews: PreviewProvider {
    static var previews: some View {
        EditBoatView(boat: Boat.example)
    }
}
