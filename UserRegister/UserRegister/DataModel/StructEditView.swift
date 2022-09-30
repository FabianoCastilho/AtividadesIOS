//
//  StructEditView.swift
//  UserRegister
//
//  Created by user226746 on 9/26/22.
//

import SwiftUI

struct EditText: View {
    var text : String
    
    
    var body: some View {
    Text(text)
            .textFieldStyle(.roundedBorder)
            .font(.callout)
            .frame(maxWidth:300 , alignment: .center)
            .cornerRadius(20)
            .padding(.vertical, 5)
    }
}
struct EditTextField: View {
    var title : String = ""
    @Binding  var editText: String
    
    var body: some View {
        TextField(title, text: $editText )
            .textFieldStyle(.roundedBorder)
            .font(.callout)
            .frame(maxWidth:300)
            .cornerRadius(20)
            .padding(.vertical, 5)
    }
}
struct HideShowView : View{
    @Binding var password: String
    @Binding var hideShow: Bool
    
    var body: some View {
        HStack{
            if self.hideShow{
                EditTextField(title:"Password", editText: $password)
            }
            else {
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .font(.callout)
                    .frame(maxWidth:300)
                    .cornerRadius(20)
                    .padding(.vertical, 5)
            }
            Button(action: {
                self.hideShow.toggle()}){
                    Image(systemName: self.hideShow ? "eye" : "eye.slash")
                        .foregroundColor((self.hideShow == true) ? .gray : .secondary)
                }
        }
    }
}

