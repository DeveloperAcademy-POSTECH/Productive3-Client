//
//  InsertUserInfoView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import SwiftUI

struct InsertUserInfoView: View {
    @Binding var viewState : String
    
    @State var nickname: String = ""
    @State var moto: String = ""
    
    
    var body: some View {
        NavigationView {
            
            ZStack {
                Color(red: 0.984313725490196, green: 0.984313725490196, blue: 0.984313725490196)
                    .edgesIgnoringSafeArea(.all) //background
                
                
                VStack(alignment: .leading){
                    Text("내 정보 입력하기")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                    Spacer()
                        .frame(height: 60)
                    
                    
                    Text("닉네임")
                        .font(.system(size: 15))
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 7)
                            .fill(Color.white)
                            .frame(width: 346.0, height: 43.0)
                            .shadow(color: Color(red: 0.725, green: 0.725, blue: 0.725), radius: 1, x: 0, y: 0)
                        TextField("닉네임을 입력해주세요",text: $nickname )
                            .padding(.leading)
                            .frame(width: 346, height: 43)
                        Spacer()
                            .frame(height: 24)
                    } // ZStack
                    
                    Text("좌우명")
                        .font(.system(size: 15))
                        .padding(.top, 10)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 7)
                            .fill(Color.white)
                            .frame(width: 346, height: 43)
                            .shadow(color: Color(red: 0.725, green: 0.725, blue: 0.725), radius: 1, x: 0, y: 0)
                        TextField("좌우명을 입력해주세요",text: $moto)
                            .padding(.leading)
                            .frame(width: 346, height: 43)
                        
                    } // ZStack
                    
                    ZStack{
                        Spacer()
                            .frame(height:35)
                        
                        
                        
                        HStack{
                            Text("생산적인3의 서비스 이용약관을 확인해주세요")
                                .font(.system(size: 12))
                                .fontWeight(.regular)
                            
                            Spacer()
//                            NavigationLink(destination: TermsOfService()){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 7)
                                        .fill(Color(red: 0.5725490196078431, green: 0.7686274509803922, blue: 0.803921568627451))
                                        .frame(width: 70, height: 16)
                                    // Button(action:{
                                    // print("이용약관")
                                    // }) {
                                    Text("이용약관")
                                        .fontWeight(.regular)
                                        .foregroundColor(Color(hue: 1.0, saturation: 0.013, brightness: 1.0))
                                        .font(.system(size: 12))
                                    // }
                                    
                                }
                            //}
                        }
                        .frame(width: 345.68)
                        
                    } // ZStack
                    
                    
                    ZStack{
                        Spacer()
                            .frame(height: 320)
                    } // Z
                    
                    Button(action : {
                        viewState = "InsertToDo"
                    }){
                        Text("동의 후 회원가입 하기")
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                            .font(.system(size: 17))
                    }
                        .padding(.horizontal, 10.0)
                        .padding(.vertical, 15.0)
                        .background(RoundedRectangle(cornerRadius: 7)
                        .fill(Color.OLIVE_8).frame(width: 336))
                        .frame(width:336, height: 43.0)
                    
                } // VStack
                
            } // ZStack
            .navigationBarHidden(true)
        } // navigationview
    }
}

