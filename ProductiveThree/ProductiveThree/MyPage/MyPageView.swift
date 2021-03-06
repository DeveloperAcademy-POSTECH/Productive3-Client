//
//  MyPageView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//
//


import SwiftUI
import Realm
import RealmSwift
import Kingfisher

struct MyPageView: View {
    @State private var showModal = false
    @State private var element: Routine?
    @ObservedResults(Routine.self) var results;
    var routines: Results<Routine>? {
        results.where({ $0.accomplished == true }).sorted(byKeyPath: "date", ascending: false)
    }
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var realm: Realm?
    
    var cardData: [Routine] = []
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init() {
        for routine in routines! {
            cardData.append(routine)
        }
    }
    
    var body: some View {
        VStack {
            Text(UserDefaults.standard.string(forKey: "motto")!)
                .fontWeight(.light)
                .font(.system(size: 17))
            
            Spacer()
            
            Text(UserDefaults.standard.string(forKey: "nickname")!)
                .fontWeight(.semibold)
                .font(.system(size: 25))
            
            Divider()
                .padding([.top, .bottom], 10)
                .padding([.leading, .trailing], 20)
            
            Text("총 \(cardData.count)일의 실천완료~!")
                .fontWeight(.medium)
                .font(.system(size: 17))
                .foregroundColor(Color.init(hex: "92C4CD"))
            
            Divider()
                .padding([.top], 10)
                .padding([.leading, .trailing], 20)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(cardData, id: \.self) { element in
                        KFImage(URL(string: element.imgUrl!))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20)
                            .onTapGesture {
                                self.showModal = true
                                self.element = element
                            }
                    }
                    .sheet(isPresented: self.$showModal) {
                        MyPageDetailView(element: self.$element, showModal: self.$showModal)
                    }
                }
            }
            .padding([.horizontal, .vertical], 10)
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action : {
            self.mode.wrappedValue.dismiss()
        }){
            HStack {
                Image("chevron.backward")
                    .renderingMode(.template)
                    .foregroundColor(Color.OLIVE_8)
                Text("Todo")
                    .foregroundColor(Color.OLIVE_8)
            }
        }, trailing: NavigationLink(destination: EditUserInfoView()){
            Image("gearshape.fill")
                .renderingMode(.template)
                .foregroundColor(Color.OLIVE_8)
        })
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
