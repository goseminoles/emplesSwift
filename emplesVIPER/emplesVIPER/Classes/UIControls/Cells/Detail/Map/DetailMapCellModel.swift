//
//  DetailMapCellModel.swift
//  emplesMVC
//
//  Created by Vasily Popov on 11/10/17.
//  Copyright © 2017 Vasily Popov. All rights reserved.
//

import UIKit
import CoreLocation

class DetailMapCellModel {
    
    var coordinate : CLLocationCoordinate2D
    
    init(_ coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}

extension DetailMapCellModel :ViewCellModelProtocol {
    var modelValue: Any? {
        return nil
    }
    
    var cellClassName: String {
        return DetailMapViewCell.nameOfClass
    }
}

