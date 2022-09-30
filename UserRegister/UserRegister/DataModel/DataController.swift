//
//  DataController.swift
//  ProjetoVerao2024
//
//  Created by user226746 on 9/16/22.
//
import SwiftUI
import Foundation
import CoreData

class DataController : ObservableObject{
    
    let container = NSPersistentContainer(name: "UserModel")
    
    init(){
        container.loadPersistentStores{ description, error in
                                       if let error = error{
                                           print("Erro ao carregar os daods \(error)") }
    }
}
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
        }
        catch{
            let error = error as NSError
            print("Erro ao salvar os dados no contexto \(error)")
        }
    }
    func addUser(firstName: String, lastName: String, email: String, password: String, context: NSManagedObjectContext){
        
        let user = User(context: context)
        
        user.firstName = firstName
        user.lastName = lastName
        user.email = email
        user.password = password
        user.id = UUID()
        user.insertionDate = Date()
       
        save(context: context)
    }
    func editUser(userOld: User, firstName: String, lastName: String, email: String, password: String, context: NSManagedObjectContext){
        userOld.firstName = firstName
        userOld.lastName = lastName
        userOld.email = email
        userOld.password = password
        userOld.insertionDate = Date()
        save(context: context)
    }
    func deleteUser(offsets: IndexSet, context: NSManagedObjectContext, user: FetchedResults<User> ){
        offsets.map{ user[$0]}
            .forEach(context.delete)
        
        save(context: context)
    }
        
}


