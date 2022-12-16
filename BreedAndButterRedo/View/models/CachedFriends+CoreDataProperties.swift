//
//  CachedFriends+CoreDataProperties.swift
//  BreedAndButterRedo
//
//  Created by Arthur Sh on 16.12.2022.
//
//

import Foundation
import CoreData


extension CachedFriends {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriends> {
        return NSFetchRequest<CachedFriends>(entityName: "CachedFriends")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?
    
    public var wrappedId: String {
        id ?? "no id"
    }
    
    public var wrappedName: String {
        name ?? "No name"
    }

}

extension CachedFriends : Identifiable {

}
