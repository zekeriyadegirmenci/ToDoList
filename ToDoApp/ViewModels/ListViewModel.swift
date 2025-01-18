//
//  ListViewModel.swift
//  ToDoApp
//
//  Created by Zekeriya Değirmenci on 11.01.2025.
//

import Foundation

//CRUD
//create,

class ListViewModel:ObservableObject {
    
    let itemsKey:String = "items_list"
    
    @Published var items:[ItemModel] = [] {
        didSet{
//            items arrayi her guncellendıkten sonra saveItems fonksiyonu calısacak ve kodlanmıs json datasının icerisine yazacak listenin son halini
            saveItems()
        }
    }
    
    init(){
        getItems()
    }
    
    func getItems(){
//       let newItems = [
//        ItemModel(title: "write a new todo", isCompleted: true)
//       ]
//        
//        items.append(contentsOf: newItems)
        

        guard let data = UserDefaults.standard.data(forKey: itemsKey),
                let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        //        burada kodlanmıs veriyi alıyoruz ve decode yapıp ana arrayimize atıyoruz ve ekranda gosteriyoruz
        self.items = decodedData
   }
    
    func deleteItems(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItems(from:IndexSet, to:Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItems(text:String){
        let newItem = ItemModel(title: text, isCompleted: false)
        items.append(newItem)
    }
    
//    ıtemleri guncellemek ıstedıgımız zaman o ustunde calısmak ıstedıgımız ıtemı, arrayde konumunu, indexini bulmalıyız islem yapabilmek icin (ornek: tamamlanıp tamamlanmadıgını ustune basıldıgı zaman degismek istiyoruz gibi)
    func updateItems(item: ItemModel){
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            
            items[index] = item.updateCompletion()
            print(items[index].id)
            
//            items[index] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
//            print(items[index].id)
//            burada eğer dizimizdeki herhangi bir elemanın idsi, sectigimiz itemin idsi ile eslesiyorsa onun ustunde islem yapmak icin, bulundugu indexteki itemi cagırıyoruz ve Yenı ıtemModelimize gore entegre ediyoruz. Buradaki hatamız şu -> buldugumuz ındexteki itemi, yeni bir ItemModel nesnesine atıyoruz. Yani yeni bir idsi oluyor atadıgımız elemanın. Bunu cozmek ıcın, İdsinin degismemesi sadece iceriginin degismesi icin model kısmında degisiklige gitmemiz gerekıyor.Her bir olusturdugumuz ıtemModel modeli icin bize yeni idli bir nesne olusturuyor. Bu hatayı onlemelıyız
        }
    }
    
    func saveItems() {
//       items arrayi icerisindeki verileri kodladık, itemsKey nesnesi icerisine yazdık
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    
    
}
