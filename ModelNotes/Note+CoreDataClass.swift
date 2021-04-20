//
//  Note+CoreDataClass.swift
//  Traveler's Notebook
//
//  Created by Aleksander Kulikov on 06.04.2021.
//
//

import Foundation
import CoreData
import UIKit

@objc(Note)
public class Note: NSManagedObject {
    class func newNote(name: String) -> Note {
        let newNote = Note(context: CoreDataManager.sharedInstance.managedObjecContext)
        
        newNote.name = name
        newNote.dateUpdate = Date()
        
        return newNote
    }
    func addImage(image: UIImage) {
        let imageNote = ImageNote(context: CoreDataManager.sharedInstance.managedObjecContext)
        imageNote.bigImage = image.jpegData(compressionQuality: 1)
        
        self.image = imageNote
    }
    func addLocation(latitude: Double, lontitude: Double) {
        let location = Location(context: CoreDataManager.sharedInstance.managedObjecContext)
        location.lat = latitude
        location.lon = lontitude
        
        self.location = location
        
    }
    
    var dateUpdatedString : String {
        let df = DateFormatter()
            df.dateStyle = .medium
            df.timeStyle = .short
        return df.string(from: self.dateUpdate!)
        
    }
}
