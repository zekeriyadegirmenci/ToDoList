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
//            burada navigationView kullanmıs olsaydım parantez dısında navigationStyle kısmını stack ile belirtmem gerekecekti. Stack ile belirtmeseydim ipad gibi ekranlarda navigation yapısı ekranın yan tarafında sidebar seklınde gozukecektı
            NavigationStack
            {
                ListView()
            }.environmentObject(listViewModel)
            
        }
    }
}
