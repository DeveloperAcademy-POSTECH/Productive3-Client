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
    
    func mockupRoutine(tasks: [String], date: String) {
        let contents = contentExtracted(tasks: tasks)
        try! realm.write {
            realm.add(Routine(date, contents, randomUrlBuilder()))
        }
    }
    
    func createRoutine(tasks: [String]) {
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
    
    func deleteRoutine(routine: Routine) {
        let realmRoutine = realm.objects(Routine.self)
            .where { $0.routineId == routine.routineId }.first;
        try! realm.write {
            realm.delete(realmRoutine!)
        }
    }
    
    private func contentExtracted(tasks: [String]) -> RealmSwift.List<Content> {
        let contents = RealmSwift.List<Content>();
        for task in tasks {
            contents.append(Content(task))
        }
        return contents;
    }
    
    private func randomUrlBuilder() -> String {
        let random = String(Int.random(in: 0...71))
        return "https://storage.googleapis.com/no-ri/\(random).png"
    }
    
    private init() {}
}
