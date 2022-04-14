//
//  InsertUserInfoView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import SwiftUI

struct InsertUserInfoView: View {
    @Binding var viewState : String
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @State var nickname: String = ""
    @State var motto: String = ""

    private func saveInfo() {
        UserDefaults.standard.set(nickname, forKey: "nickname")
        UserDefaults.standard.set(motto, forKey: "motto")
        viewState = "AskToDoView"
        self.mode.wrappedValue.dismiss()
    }
    
    var body: some View {
        
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
                    TextField("좌우명을 입력해주세요", text: $motto)
                        .padding(.leading)
                        .frame(width: 346, height: 43)
                    
                } // ZStack
                
                Spacer()
                    .frame(height:35)
                
                HStack{
                    Text("생산적인3의 서비스 이용약관을 확인해주세요")
                        .font(.system(size: 12))
                        .fontWeight(.regular)
                    
                    Spacer()
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 7)
                            .fill(Color(red: 0.5725490196078431, green: 0.7686274509803922, blue: 0.803921568627451))
                            .frame(width: 70, height: 16)

                        
                        Text("이용약관")
                            .fontWeight(.regular)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.013, brightness: 1.0))
                            .font(.system(size: 12))
                        
                    }.onTapGesture {
                        UIApplication.shared.open(URL(string: "https://warp-log-4a4.notion.site/3-58d8b2c9763c401987b599353f98e6ab")!)
                    }
                    
                }
                .frame(width: 345.68)
                
                Spacer()
                    .frame(height: 290)
                
                if (nickname == "" || motto == ""){
                    VStack(alignment: .center){
                        Text("닉네임과 좌우명을 입력해주세요")
                            .foregroundColor(Color.OLIVE_8)
                            .font(.system(size: 15))
                        
                        Text("동의 후 회원가입하기")
                            .padding(.horizontal, 10.0)
                            .padding(.vertical, 15.0)
                            .background(RoundedRectangle(cornerRadius: 7).fill(Color(red: 255/255, green: 255/255, blue: 255/255)).frame(width: 336)
                                .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.1), radius: 3 , x: 0, y: 0))
                            .frame(width:336, height: 54.0)
                            .disabled(true)
                            .foregroundColor(Color.GRAY_8)
                    }
                } else {
                    Text(" ")
                        .font(.system(size: 15))

                    Button(action : {
                        saveInfo()
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
                    
                } // disabled button

                
            } // VStack
            
        } // ZStack
    }
}
