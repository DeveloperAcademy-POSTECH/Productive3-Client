//
//  ModalView.swift
//  practice
//
//  Created by Leo Bang on 2022/04/11.
//

import SwiftUI
import RealmSwift

struct ModalView: View {
    @Binding var isModal: Bool
    @Binding var isDisabled: Bool
    @Binding var showModal: Bool
    
    @ObservedRealmObject var routine: Routine;
    let realmCrud = RealmCRUD.instance
    let random = String(Int.random(in: 0...71))
    
    
    private func negativeHandler() {
        isModal.toggle();
    }
    
    private func positiveHandler() {
        isModal.toggle();
        isDisabled.toggle();
        realmCrud.toggleRoutine(routine: routine)
        realmCrud.insertReward(routine: routine, imgUrl: "https://storage.googleapis.com/no-ri/\(random).png")
        showModal = true;
        
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 170)
                .foregroundColor(Color.white)
            VStack {
                VStack {
                    Text("오늘의 할일을")
                    Text("전부 다 하셨습니까?")
                }
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.GRAY_BUTTON)
                            .frame(width: 120, height: 40)
                        Text("Cancel")
                    }
                    .onTapGesture {
                        isModal.toggle()
                    }
                    .contentShape(RoundedRectangle(cornerRadius: 20))
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.GRAY_BUTTON)
                            .frame(width: 120, height: 40)
                        Text("OK")
                    }
                    .onTapGesture {
                        self.positiveHandler()
                    }
                }
            }
        }
    }
}

