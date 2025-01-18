//
//  ListView.swift
//  ToDoApp
//
//  Created by Zekeriya Değirmenci on 11.01.2025.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject private var listViewModel: ListViewModel
    
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItems(item: item)
//                            print(item.id) listViewModeldekine de print koyarak idlerinin farklı oldugunu gorebilirsin
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItems)
            .onMove(perform: listViewModel.moveItems)
            
            
        }.listStyle(.plain)
        .navigationTitle("To Do List📝")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add") {
                        AddView()
                    }
                }
            }
        
    }
    
    
}

#Preview {
    
    NavigationStack {
        ListView()
    }.environmentObject(ListViewModel())
//    bunu eklemezsen preview calısmaz 
}
