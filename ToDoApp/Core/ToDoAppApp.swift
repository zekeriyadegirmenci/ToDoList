//
//  ToDoAppApp.swift
//  ToDoApp
//
//  Created by Zekeriya Değirmenci on 11.01.2025.
//

import SwiftUI

@main
struct ToDoAppApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack
            {
                ListView()
            }.environmentObject(listViewModel)
            
        }
    }
}
