//
//  PostDB2+CoreDataProperties.swift
//  HTTPRequests
//
//  Created by Андрей Васильев on 23.06.2024.
//
//

import Foundation
import CoreData


extension PostDB2 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PostDB2> {
        return NSFetchRequest<PostDB2>(entityName: "PostDB2")
    }

    @NSManaged public var date: String?
    @NSManaged public var descriptions: String?
    @NSManaged public var postId: Int64
    @NSManaged public var image_url: String?
    @NSManaged public var title: String?

}

extension PostDB2 : Identifiable {

}
