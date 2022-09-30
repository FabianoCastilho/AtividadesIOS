//
//  ContentView.swift
//  UserRegister
//
//  Created by user226746 on 9/22/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest ( sortDescriptors: [SortDescriptor(\.insertionDate, order : .reverse)] )
    var user: FetchedResults<User>
    
    @State var isAddView : Bool = false
    
    var body: some View {
        
        NavigationView{
            VStack{
                VStack{
                    Text("REGISTERED USERS")
                        .bold()
                        .font(.largeTitle)
                        .fontWeight(.medium)
                        .foregroundColor(Color.blue)
                }
                
                List{
                    ForEach(user) { user in
                        NavigationLink(destination: EditUserView(user: user)){
                            
                            UserDetailView( firstName: user.firstName ?? "", lastName: user.lastName ?? "", email: user.email ?? "", password: user.password ?? "", insertionDate: user.insertionDate ?? Date())
                        }
                        .padding()
                    }
                    .onDelete(perform: deleteUser)
                }
               // .navigationTitle("REGISTERED USERS")
                .toolbar{ ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        isAddView = true
                        } label: { Label("Add Label", systemImage: "person.badge.plus")
                        }
                    }
                }
                .sheet(isPresented: $isAddView, content:{
                    AddUserView(isAddView: $isAddView)
                })
            }
        }
    }
    func deleteUser(offset:IndexSet) {
            DataController().deleteUser(offsets: offset, context: managedObjectContext, user: user)
        }
}
struct UserDetailView : View{
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    var password: String = ""
    var insertionDate : Date = Date()
    var body: some View{
        
        HStack{
            VStack(alignment: .leading){
                HStack(spacing: 5){
                    Image(systemName: "person")
                        .foregroundColor(.gray)
                    EditText(text : "Name: \(firstName) \(lastName)")
                }
                HStack(spacing: 5){
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                    EditText(text: "Email: \(email)")
                }
                Text(calcTimeSince(date: insertionDate))
            }
        }
    }
}
func calcTimeSince(date : Date) -> String{
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hours = minutes / 60
    let days = hours / 24
    
    if minutes < 60 {
        return "\(minutes) minutos atrás"
    }
    else if( minutes >= 60 && hours < 24){
        return "\(hours) horas atrás"
    }
    else{
        return "\(days) dias atrás"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

  
