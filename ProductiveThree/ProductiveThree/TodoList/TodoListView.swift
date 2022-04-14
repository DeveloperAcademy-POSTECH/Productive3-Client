//
//  TodoListView.swift
//  ProductiveThree
//
//  Created by yeongwoocho on 2022/04/12.
//

import SwiftUI
import RealmSwift

struct TodoListView: View {
    @ObservedRealmObject var routine: Routine;
    
    private func modalHandler(contents: RealmSwift.List<Content>) -> Void {
        if (isDisabled) {
            return
        }
        for content in contents {
            if (!content.accomplished) {
                return
            }
        }
        isModal.toggle()
    }
    
    private func initDisabledSetter(routine: Routine) {
        self.isDisabled = routine.accomplished;
    }
    
    
    // States
    @State var isModal: Bool = false;
    @State var isDisabled: Bool = false;
    @State var showModal = false;
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.WHITEGRAY_8.edgesIgnoringSafeArea(.all)
                //
                HStack {
                    Spacer()
                    VStack{
//                        Spacer()
                        HeaderText()
                        
                        ForEach(routine.contents, id: \.self) { content in
                            RoutineContentView(content: content)
                        }
                        .onChange(of: routine.contents) { contents in
                            modalHandler(contents: contents)
                        }
                        .disabled(isDisabled)
                        
                        Spacer()
                        
                        Button("삭제", action: {
                            let realmCrud = RealmCRUD.instance
                            realmCrud.deleteRoutine(routine: routine)
                        })
                    }
                    Spacer()
                }
                .background(Color.BACKGROUND)
                
                isModal ? Color.black.opacity(0.8) .edgesIgnoringSafeArea(.all) : nil
                isModal ? ModalView(isModal: $isModal, isDisabled: $isDisabled, showModal: $showModal, routine: routine) : nil
            }
            .onAppear {
                initDisabledSetter(routine: routine)
            }
            .fullScreenCover(isPresented: self.$showModal) {
                TodoListRewardView(routine: routine)
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


