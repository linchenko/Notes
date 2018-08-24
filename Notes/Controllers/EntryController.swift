//
//  Entry Controller.swift
//  Notes
//
//  Created by Levi Linchenko on 24/08/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import Foundation


class EntryController{
    
    
    //shared instance
    static let shared = EntryController()
    
    //Sorse of Truth
    var entry: [Entry] = []
    
    
    //Crud
    
    //    Create
    func create(entryText: String){
        let entryText = Entry(bodyText: entryText)
        entry.append(entryText)
        saveToDisk()
    }
    
    //    Update
    func update(entryText: Entry, bodyText: String){
        entryText.bodyText = bodyText
        saveToDisk()
    }
    
    //    Delete
    func delete(entryText: Entry){
        guard let index = entry.index(of: entryText) else {return}
        entry.remove(at: index)
        saveToDisk()
        
    }
    //Persistence
    
    init(){
        self.entry = loadFromDisk()
    }
    
    func fileURL() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let fileName = "notes.json"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        return fullURL
    }
    
    func saveToDisk(){
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(entry)
            try data.write(to: fileURL())
        } catch {
            print ("💩 You are having an issue saving to the dist: \(error) \(error.localizedDescription)")
        }
    }
    
    func loadFromDisk() -> [Entry] {
        do {
            let data = try Data (contentsOf: fileURL())
            let decoder = JSONDecoder()
            let entry = try decoder.decode([Entry].self, from: data)
            return entry
        } catch {
            print ("💩 You are having an issue loading from the dist: \(error) \(error.localizedDescription)")
        }
        return []
    }
}
