//
//  AddView.swift
//  ToDoApp
//
//  Created by Zekeriya Değirmenci on 11.01.2025.
//
//alert cıktıktan sonra navigationlink ile geçiş yaparsan yeni acılan sayfada geri tusu cıkar. Onu gızlesen bile ust uste sayfalar acılacak.Gizlemesen ve sureklı saveleyip todo eklemıs olsan bile navigation yapısı sayesinde sureklı gerı donus olacak. Bu yuzden alertten sonra dismiss ile geri donus sagla!!

import SwiftUI

struct AddView: View {
    
    @State private var createText: String = ""
    @State private var isAlert: Bool = false
    @State private var alertTitle: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
       
            VStack
            {
                TextEditor(text: $createText)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .clipShape(.rect(cornerRadius: 15))
                    .padding(5)
                    .background(Color.gray.opacity(0.5))
                    .clipShape(.rect(cornerRadius: 15))
                
                
                Button {
//                    aksiyon eklenecek
//                    eger isformal text dogru olursa ekleyeceksin veri aklında bulunsun
                    saveButtonPressed()
                } label: {
                    Text("Save".uppercased())
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .foregroundStyle(.white)
                        .background(isFormalText() ? Color.accentColor : Color.gray)
                        .font(.title2)
                        .clipShape(.rect(cornerRadius: 15))
                    
                }

            }.environmentObject(listViewModel)
            .padding()
            .alert(alertTitle, isPresented: $isAlert, actions: {
                
            })
            .navigationTitle("Add an Item ✍🏼")
    }
}

extension AddView {
//   karakter sayısı 5ten fazla olmalı.
    private func isFormalText() -> Bool {
        if createText.count > 5 {
            return true
        }else{
            return false
        }
    }
    
    private func saveButtonPressed() {
        if isFormalText() {
            listViewModel.addItems(text: createText)
            dismiss()
        }else{
            isAlert.toggle()
            alertTitle = "Your new to do item must be longer than 5 characters"
        }
    }
    
   
}

#Preview {
    NavigationStack{
        AddView()
    }.environmentObject(ListViewModel())
}
