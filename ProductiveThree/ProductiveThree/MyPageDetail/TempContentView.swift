//
//  ContentView.swift
//  ProductiveThree
//
//  Created by taekkim on 2022/04/12.
//

import SwiftUI

struct TempContentView: View {
    @State private var showModal = false //상태
    
    var body: some View {
        NavigationView{
            VStack{
                Text("Hello, World!")
                Button(action: {
                    print("hello button!!")
                    self.showModal = true
                }){
                    Text("Button")
                        .foregroundColor(Color(red: 0.77, green: 0.686, blue: 0.696))
                }
                .sheet(isPresented: self.$showModal) {
                    NavigationView {
                        MyPageDetailView()
                    }
                }
            }//VStack
        }//NatvigationView
    }
}


struct TempContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageDetailView()
        //            .previewInterfaceOrientation(.portrait)
        //        ContentView()
    }
}
