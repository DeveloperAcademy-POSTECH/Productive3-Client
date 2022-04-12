//
//  Models.swift
//  ProductiveThree
//
//  Created by Leo Bang on 2022/04/12.
//

import RealmSwift

class Routine: Object, Identifiable {
    @Persisted(primaryKey: true) var routineId = UUID()
    @Persisted var date: String;
    @Persisted var contents: RealmSwift.List<Content>;
    @Persisted var accomplished = false;
    @Persisted var imgUrl: String?;
    
    convenience init(_ date: String, _ contents: List<Content>) {
        self.init()
        self.date = date;
        self.contents = contents;
    }
}

class Content: Object {
    @Persisted(primaryKey: true) var contentId = UUID();
    @Persisted var content: String;
    @Persisted var accomplished = false;
    
    convenience init(_ content: String) {
        self.init()
        self.content = content
    }
}

