//
//  ImageNote+CoreDataProperties.swift
//  Traveler's Notebook
//
//  Created by Aleksander Kulikov on 06.04.2021.
//
//

import Foundation
import CoreData


extension ImageNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageNote> {
        return NSFetchRequest<ImageNote>(entityName: "ImageNote")
    }

    @NSManaged public var bigImage: Data?
    @NSManaged public var note: Note?

}

extension ImageNote : Identifiable {

}
