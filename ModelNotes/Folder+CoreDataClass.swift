//
//  Folder+CoreDataClass.swift
//  Traveler's Notebook
//
//  Created by Aleksander Kulikov on 06.04.2021.
//
//

import Foundation
import CoreData


@objc(Folder)
public class Folder: NSManagedObject {
    class func newFolder(name: String) -> Folder {
        let folder = Folder(context: CoreDataManager.sharedInstance.managedObjecContext)
        
        folder.name = name
        folder.dataUpdate = Date()
        
        return folder
    }
    
    func addNote() -> Note {
        let newNote = Note(context: CoreDataManager.sharedInstance.managedObjecContext)
        
        newNote.folder = self
        newNote.dateUpdate = Date()
        
        return newNote
    }

}
