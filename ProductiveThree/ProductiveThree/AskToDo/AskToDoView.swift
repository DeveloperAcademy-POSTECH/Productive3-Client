//
//  AskToDoView.swift
//  ProductiveThree
//
//  Created by 김태호 on 2022/04/13.
//

import SwiftUI
import RealmSwift

struct AskToDoView: View {
    // Realm
    @ObservedResults(Routine.self) var routines;
    var routine: Routine? {
        routines.where { $0.date == DateToString.resolve(date: Date()) }.first
    }
    
    @Binding var viewState : String
    
    
    var body: some View {
        // Render TodoList View when routine exists
        // ContentView(routine: routine!)
    }
}

