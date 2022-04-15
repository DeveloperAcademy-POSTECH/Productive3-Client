//
//  AskUserInfoView.swift
//  ProductiveThree
//
//  Created by 김태호 on 2022/04/13.
//

import SwiftUI

struct AskUserInfoView: View {
    
    @Binding var viewState : String
    
    var nickname: String? = UserDefaults.standard.string(forKey: "nickname")
    var motto: String? = UserDefaults.standard.string(forKey: "motto")
    
    var body: some View {
        if nickname == nil || motto == nil {
            InsertUserInfoView(viewState: $viewState)
        } else {
            AskToDoView(viewState: $viewState)
        }
    }
}
