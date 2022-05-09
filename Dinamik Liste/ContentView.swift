//
//  ContentView.swift
//  Dinamik Liste
//
//  Created by Ömer Faruk Kılıçaslan on 9.05.2022.
//

import SwiftUI

struct UlkeSatirTasarimi: View {
    var ulkeAdi:String
    var body: some View {
       
        HStack{
            Text(ulkeAdi)
            Spacer()
            Text("Ülke Seç")
                .foregroundColor(Color.red)
                .onTapGesture {
                    print("Seçilen Ülke : \(self.ulkeAdi)")
                }
        }
    }
}

struct ContentView: View {
    
    @State private var ulkelerListesi = [String]()
    var body: some View {
       
        NavigationView{
            
            List{
                
                ForEach(ulkelerListesi,id:\.self){ ulke in
                    UlkeSatirTasarimi(ulkeAdi: ulke)
                        
                    
                }.onDelete(perform: ulkeSil)
            }.navigationTitle("Ulkeler")
        }.onAppear(){
            self.ulkelerListesi = ["Türkiye", "Almanya", "Japonya", "Çin", "Rusya"]
        }
    }
    
    func ulkeSil(at offsets: IndexSet){
        self.ulkelerListesi.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
