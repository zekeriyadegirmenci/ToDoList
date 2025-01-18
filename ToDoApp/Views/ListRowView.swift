//
//  ListRowView.swift
//  ToDoApp
//
//  Created by Zekeriya Değirmenci on 11.01.2025.
//

import SwiftUI

struct ListRowView: View {
    
    let item:ItemModel
    
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? Color.green : Color.red)
            Text(item.title)
                .strikethrough(item.isCompleted ? false : true)
            Spacer()
        }.font(.title2)
    }
}

#Preview {
    
//    ornekler olusturduk previewde goruntulemek ıcın
    Group {
        ListRowView(item: ItemModel(title: "Example1", isCompleted: true))
        ListRowView(item: ItemModel(title: "Example2", isCompleted: false))
    }
}
