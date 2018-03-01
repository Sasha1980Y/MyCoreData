//
//  Model+CoreDataProperties.swift
//  MyCoreData
//
//  Created by Alexander Yakovenko on 3/1/18.
//  Copyright © 2018 Alexander Yakovenko. All rights reserved.
//
//

import Foundation
import CoreData


extension Model {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Model> {
        return NSFetchRequest<Model>(entityName: "Model")
    }

    @NSManaged public var name: String?
    @NSManaged public var number: Int16

}
// MARK: Generated accessors for orders
/*
extension Model {
    
    @objc(addModelObject:)
    @NSManaged public func addToOrders(_ value: Model)
}
 */
