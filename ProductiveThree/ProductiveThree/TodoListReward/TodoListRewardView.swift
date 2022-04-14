//
//  TodoListRewardView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import SwiftUI
import RealmSwift

struct TodoListRewardView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedRealmObject var routine: Routine;
    
    let random = String(Int.random(in: 0...71))
    
    var body: some View {
        GeometryReader { metrics in
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color(red: 244/255, green: 199/255, blue: 171/255))
                        .frame(width: .infinity, height: metrics.size.height * 0.46)
                        .padding(.bottom, metrics.size.height * 0.38)
                    
                    VStack {
                        HStack {
                            Spacer()
                            
                            Button(action: {
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                Image("x.square.fill")
                                    .renderingMode(.template)
                                    .resizable()
                                    .foregroundColor(Color.white)
                                    .frame(width: metrics.size.width * 0.055, height: metrics.size.width * 0.055)
                                
                            } // Button
                            
                        } // ZStack
                        .padding(.trailing, metrics.size.width * 0.063)
                        .padding(.bottom, metrics.size.height * 0.08)
                        
                        
                        VStack {
                            Text("오늘도 고생 많았어!")
                            Text("내일도 가보자고 ~")
                        } // VStack
                        .font(.system(size:22, weight:.semibold))
                        .foregroundColor(Color(red: 63/255, green: 63/255, blue: 63/255))
                        .background(
                            RoundedRectangle(cornerRadius: 19)
                                .fill(Color.white)
                                .frame(width: metrics.size.width * 0.74, height: metrics.size.height * 0.16)
                            
                        )
                        .padding(.bottom, metrics.size.height * 0.08)
                        
                        
                        AsyncImage(url: URL(string: routine.imgUrl! )){ image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: metrics.size.width * 0.817, height: metrics.size.width * 0.817)
                        
                    } // VStack
                } // ZStack
                
                Text("오늘 완성한 일정은")
                    .font(.system(size: 20, weight:.regular))
                    .foregroundColor(Color(red: 63/255, green: 63/255, blue: 63/255))
                    .padding(.top, 25)
                Text("마이페이지에서 확인할 수 있어요")
                    .font(.system(size: 20, weight:.regular))
                    .foregroundColor(Color(red: 63/255, green: 63/255, blue: 63/255))
                Spacer()
                
            } // VStack
            .background(Color(red: 251/255, green: 251/255, blue: 251/255))
            .edgesIgnoringSafeArea(.top)
        }
    }
}
