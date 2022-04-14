//
//  HeaderText.swift
//  practice
//
//  Created by Leo Bang on 2022/04/11.
//

import SwiftUI

struct HeaderText: View {
    var body: some View {
        VStack {
            Text("오늘의 생산적인 3")
                .font(.system(size: 27, weight: Font.Weight.bold))
                .padding(.bottom, 0.5)

            Text("생산적인 3 이후에는 보상이 기다리고 있어요.")
                .font(.system(size: 14)).foregroundColor(Color.gray)
        }
    }
}
