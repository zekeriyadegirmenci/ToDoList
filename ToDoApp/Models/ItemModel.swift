//
//  ItemModel.swift
//  ToDoApp
//
//  Created by Zekeriya Değirmenci on 11.01.2025.
//

import Foundation


//Immutable Struct!! let ile yaptık hepsini veri güvenligi icin

struct ItemModel:Identifiable,Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id:String = UUID().uuidString , title: String, isCompleted: Bool) {
//        bu init sayesinde idleri otomatik olarak kendisi deger atayacak. Yeni bir item olusturdugumuz zaman bu initi cagırabiliriz
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
//        degistirilebilir olan model icin yeniden bir id olusturmamıza gerek kalmadı.
        return ItemModel(id: self.id, title: self.title, isCompleted: !isCompleted)
    }
    
}

//ItemModel(title: "aa", isCompleted: true) burada kendi olusturdugumuz init sayesinde id otomatik atanıyor.Yeni bir item olusturdugumuz zaman bunu cagır

//ItemModel(id: "aa", title: "aa", isCompleted: false) burada ise daha oncesınde olusturdugumuz id degerini kıyaslayıp guncelleme yapmak ıcın bu modelı kullanabilirsin
