//
//  TodoListView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import SwiftUI

struct TodoListView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.WHITEGRAY_8.edgesIgnoringSafeArea(.all)
                //
                
                
            }
            .navigationBarItems(
                trailing:
                    NavigationLink(destination: MyPageView()) {
                        Image("person.fill")
                            .renderingMode(.template)
                            .foregroundColor(Color.OLIVE_8)
                    }
            )
        }
    }
}
