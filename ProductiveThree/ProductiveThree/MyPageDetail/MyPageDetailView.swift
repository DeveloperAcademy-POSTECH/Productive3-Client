//
//  MyPageDetailView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import SwiftUI

struct MyPageDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    //Navigation View로 감싸기
    
    var body: some View{
        GeometryReader { metrics in
            VStack{
                AsyncImage(url: URL(string: "https://storage.googleapis.com/no-ri/42.png")){ image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                }.frame(width: metrics.size.width * 0.7, height: metrics.size.width * 0.7).cornerRadius(/*@START_MENU_TOKEN@*/40.0/*@END_MENU_TOKEN@*/).padding(.vertical, metrics.size.height * 0.06).shadow(radius:7)
                Divider()
                Text("실천 완료한 할 일 3가지").font(.system(size: 20)).foregroundColor(Color(hue: 0.0, saturation: 0.0, brightness: 0.0, opacity: 0.658) ).padding([.top, .bottom], metrics.size.height * 0.02)
                Divider()
                VStack {
                    CompletedList()
                    Spacer()
                }
            }// VStack
            .navigationBarTitle("22.04.11 (월)", displayMode: .inline)
            .navigationBarItems(trailing: HStack {
                Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                    Image(systemName: "xmark")
                }
            })
        }
    }// body
}// ModalView
