//
//  AddUserView.swift
//  UserRegister
//
//  Created by user226746 on 9/24/22.
//
import SwiftUI

struct AddUserView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State private var hideShow: Bool = true
    
    
    @Binding var isAddView : Bool
    var body: some View {
        Form{
            Section{
                VStack{
                    EditTextField(title: "First Name",editText: $firstName)
                   
                    EditTextField(title: "Last Name", editText: $lastName)
                      
                    EditTextField(title:"Email", editText: $email)
                    
                    HideShowView(password: $password, hideShow: $hideShow)
                  
                }
                HStack{
                    Button("Submit"){
                        DataController().addUser(firstName: firstName, lastName: lastName, email: email, password: password, context: managedObjectContext)
                        isAddView = false
                    }.tint(.blue)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .controlSize(.large)
                        .padding()
                    Button("Cancel"){
                        isAddView = false
                    }.tint(.red)
                        .buttonStyle(.borderedProminent)
                        .buttonBorderShape(.capsule)
                        .controlSize(.large)
                }
            }
        }
    }
}

