//
//  EditUserInfoView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import SwiftUI

struct EditUserInfoView: View {
    @State var nickname: String = ""
    @State var moto: String = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        
        
        
        NavigationView {
            
            ZStack {
                Color(red: 0.984313725490196, green: 0.984313725490196, blue: 0.984313725490196)
                    .edgesIgnoringSafeArea(.all)
                
                
                VStack(alignment: .leading){
                    
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
                        
                    } // ZStack
                    
                    
                    ZStack{
                        Spacer()
                            .frame(height: 200)
                    } // Z
                    
                    
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 7)
                            .fill(Color(red: 0.6980392156862745, green: 0.7215686274509804, blue: 0.6392156862745098))
                            .frame(width: 346, height: 43)
                        
                        
                        Text("정보 변경")
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                            .font(.system(size: 17))
                        
                        //}
                    } // ZStack
                    .onTapGesture {
                        self.mode.wrappedValue.dismiss()
                    }
                } //NavigationLink
                
                
                //self.mode.wrappedValue.dismiss()
                
                
            } // ZStack
            .navigationTitle("내 정보 수정하기")
            
        } // ZStack
        
        
    }
}

struct EditUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserInfoView()
    }
}
