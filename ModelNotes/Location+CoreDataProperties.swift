//
//  Location+CoreDataProperties.swift
//  Traveler's Notebook
//
//  Created by Aleksander Kulikov on 06.04.2021.
//
//

import Foundation
import CoreData


extension Location {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Location> {
        return NSFetchRequest<Location>(entityName: "Location")
    }

    @NSManaged public var lon: Double
    @NSManaged public var lat: Double
    @NSManaged public var note: Note?

}

extension Location : Identifiable {

}
