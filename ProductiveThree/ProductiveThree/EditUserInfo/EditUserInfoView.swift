//
//  EditUserInfoView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import SwiftUI

struct EditUserInfoView: View {
    @State var nickname: String = ""
    @State var motto: String = ""
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    private func saveInfo() {
        UserDefaults.standard.set(nickname, forKey: "nickname")
        UserDefaults.standard.set(motto, forKey: "motto")
        self.mode.wrappedValue.dismiss()
    }
    
    var body: some View {
        
        ZStack {
            Color.LIGHTGRAY_8
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading){
                
                Text("내 정보 수정하기")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                    .frame(height: 55)
                
                Text("닉네임")
                    .font(.system(size: 15))
                
                ZStack{
                    RoundedRectangle(cornerRadius: 7)
                        .fill(Color.white)
                        .frame(width: 346.0, height: 43.0)
                        .shadow(color: Color.GRAY_8, radius: 1, x: 0, y: 0)
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
                        .shadow(color: Color.GRAY_8, radius: 1, x: 0, y: 0)
                    TextField("좌우명을 입력해주세요",text: $motto)
                        .padding(.leading)
                        .frame(width: 346, height: 43)
                    
                } // ZStack
                
                Spacer()
                
                ZStack{
                    RoundedRectangle(cornerRadius: 7)
                        .fill(Color.OLIVE_8)
                        .frame(width: 346, height: 43)
                    
                    Text("정보 변경")
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .font(.system(size: 17))
                    
                } // ZStack
                .onTapGesture {
                    saveInfo()
                }
                
            } // VStack
            
        } // ZStack
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            HStack {
                Image("chevron.backward")
                    .renderingMode(.template)
                    .foregroundColor(Color.OLIVE_8)
                Text("Mypage")
                    .foregroundColor(Color.OLIVE_8)
            }
        })
        
    } // View
}

struct EditUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserInfoView()
    }
}
