//
//  ListFactory.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import FieryCrucible

class ListFactory : DependencyFactory {
    
    weak var collection: CollectionFactory!
    
    required init(_ factory:CollectionFactory) {
        self.collection = factory
        super.init()
    }
    
    public func view() -> EmplesCollectionViewProtocol {
        return scoped(EmplesListView()) { view in
            view.model = self.decorator()
            view.controller = self.controller()
        }
    }
    
    func decorator() -> EmplesListModelDecorator {
        return scoped(EmplesListModelDecorator(collection.model()))
    }
    
    func controller() -> EmplesListController {
        return scoped(EmplesListController(collection.model())) { controller in
            controller.view = self.view()
            controller.router = self.collection.router()
        }
    }
}
