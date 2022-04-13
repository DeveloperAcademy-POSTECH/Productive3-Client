//
//  RoutineContent.swift
//  practice
//
//  Created by Leo Bang on 2022/04/12.
//

import SwiftUI
import RealmSwift

struct RoutineContentView: View {
    @ObservedRealmObject var content: Content
    var realmCrud = RealmCRUD.instance
    
    func handleToggle() {
        realmCrud.toggleContent(content: content)
    }
    
    var body: some View {
        ZStack{
            Button(action: {
                handleToggle()
            }) {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.gray, lineWidth: 0.5)
                    .frame(width: 330, height: 130)
            }
            VStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(barColorHandler(self.content))
                    .frame(width: 100, height: 10)
                
                Group {
                    Text(self.content.content)
                        .font(.system(size: 22))
                        .foregroundColor(textColorHandler(self.content))
                }
            }
        }
        .background(Color.white)
        .padding(.vertical, 15)

    }
    
    func barColorHandler(_ content: Content) -> Color {
        if (content.accomplished) {
            return Color.GRAY_DONE;
        }
        return Color.CUSTOM_ORANGE;
    }
    
    func textColorHandler(_ content: Content) -> Color {
        if (content.accomplished) {
            return Color.GRAY_DONE;
        }
        return Color.black;
    }
}
