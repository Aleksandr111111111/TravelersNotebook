//
//  Note+CoreDataProperties.swift
//  Traveler's Notebook
//
//  Created by Aleksander Kulikov on 06.04.2021.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var dateUpdate: Date?
    @NSManaged public var imageSmale: Data?
    @NSManaged public var name: String?
    @NSManaged public var textDiscription: String?
    @NSManaged public var folder: Folder?
    @NSManaged public var location: Location?
    @NSManaged public var image: ImageNote?

}

extension Note : Identifiable {

}
