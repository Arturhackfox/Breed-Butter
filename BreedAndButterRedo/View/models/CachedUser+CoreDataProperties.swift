//
//  CachedUser+CoreDataProperties.swift
//  BreedAndButterRedo
//
//  Created by Arthur Sh on 16.12.2022.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int64
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: String?
    @NSManaged public var tags: String?
    @NSManaged public var friends: String?
    @NSManaged public var people: NSSet?

    public var wrappedFriends: String {
        friends ?? "no friends"
    }
    
    public var wrappedTags: String {
        tags ?? "no tags"
    }
    
    public var wrappedRegistered: String {
        registered ?? "not registered"
    }
    
    public var wrappedAbout: String {
        about ?? "no about"
    }
    
    public var wrappedAddress: String {
        address ?? "no address"
    }
    
    public var wrappedEmail: String {
        email ?? "no email"
    }
    
    public var wrappedCompany: String {
        company ?? "no company"
    }
    
    public var wrappedName: String {
        name ?? "UnknownName"
    }
    
    public var wrappedId: String {
        id ?? "no id"
    }
    
    public var peopleArray: [CachedFriends] {
        let set = people as? Set<CachedFriends> ?? []
       
        return set.sorted{$0.wrappedName < $1.wrappedName}
    }

}

// MARK: Generated accessors for people
extension CachedUser {

    @objc(addPeopleObject:)
    @NSManaged public func addToPeople(_ value: CachedFriends)

    @objc(removePeopleObject:)
    @NSManaged public func removeFromPeople(_ value: CachedFriends)

    @objc(addPeople:)
    @NSManaged public func addToPeople(_ values: NSSet)

    @objc(removePeople:)
    @NSManaged public func removeFromPeople(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
