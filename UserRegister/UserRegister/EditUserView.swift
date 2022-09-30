//
//  EditUserView.swift
//  UserRegister
//
//  Created by user226746 on 9/24/22.
//

import SwiftUI

struct EditUserView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.dismiss) var dismiss
    
    var user: FetchedResults<User>.Element
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State private var hideShow: Bool = true
    
    var body: some View {
        
        Form {
            Section(){
                VStack{
                    EditTextField(title: "First Name",editText: $firstName)
                    
                    EditTextField(title: "Last Name", editText: $lastName)
                    
                    EditTextField(title:"Email", editText: $email)
                    
                    HideShowView(password: $password, hideShow: $hideShow)
                }
                .onAppear(){
                    firstName = user.firstName!
                    lastName = user.lastName!
                    email = user.email!
                    password = user.password!
                }
            }.padding()
            HStack{
                Spacer()
                Button("Edit"){
                    DataController().editUser(userOld: user, firstName: firstName, lastName: lastName, email: email, password: password, context: managedObjectContext)
                    dismiss()
                }.tint(.blue)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
                    .padding()
                
                Button("Cancel"){
                    dismiss()
                }.tint(.red)
                    .buttonStyle(.borderedProminent)
                    .buttonBorderShape(.capsule)
                    .controlSize(.large)
            }
        }
    }
}
