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
    class func newNote(name: String, inFolder: Folder?) -> Note {
        let newNote = Note(context: CoreDataManager.sharedInstance.managedObjecContext)
        
        newNote.name = name
        newNote.dateUpdate = Date()
        
        //if let inFolder = inFolder {
        newNote.folder = inFolder
        //}
        return newNote
    }
    
    var addActualImage: UIImage? {
        set {
            if newValue == nil {
                if image != nil {
                    CoreDataManager.sharedInstance.managedObjecContext.delete(image!)
                }
                imageSmale = nil
            } else {
                if image == nil {
                    image = ImageNote(context: CoreDataManager.sharedInstance.managedObjecContext)
                }
                image?.bigImage = newValue!.jpegData(compressionQuality: 1)
                imageSmale = newValue!.jpegData(compressionQuality: 0.05)
            }
            dateUpdate = Date()
        }
        
        get {
            if image != nil {
                if image?.bigImage != nil {
                    return UIImage(data: image!.bigImage!) 
                }
                
            }
            
            return nil
        }
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
