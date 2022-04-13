//
//  RealmCRUD.swift
//  ProductiveThree
//
//  Created by Leo Bang on 2022/04/13.
//

import Foundation
import RealmSwift

class RealmCRUD {
    static let instance = RealmCRUD()
    
    private let realm = try! Realm()
    
    func createRoutine(tasks: [String], date: String) {
        let contents = contentExtracted(tasks: tasks)
        
        try! realm.write {
            realm.add(Routine(date, contents))
        }
    }
    
    func createRoutine(tasks: [String], date: Date) {
        let contents = contentExtracted(tasks: tasks)
        
        try! realm.write {
            realm.add(Routine(DateToString.resolve(date: Date()), contents))
        }
    }
    
    func toggleContent(content: Content) {
        try! realm.write {
            guard let thaw = content.thaw() else { return }
            thaw.accomplished = !thaw.accomplished;
        }
    }
    
    func toggleRoutine(routine: Routine) {
        try! realm.write {
            guard let thaw = routine.thaw() else { return }
            thaw.accomplished = true
        }
    }
    
    func insertReward(routine: Routine, imgUrl: String) {
        try! realm.write {
            guard let thaw = routine.thaw() else { return }
            thaw.imgUrl = imgUrl;
        }
    }
    
    
    private func contentExtracted(tasks: [String]) -> RealmSwift.List<Content> {
        let contents = RealmSwift.List<Content>();
        for task in tasks {
            contents.append(Content(task))
        }
        return contents;
    }
    
    private init() {}
}
