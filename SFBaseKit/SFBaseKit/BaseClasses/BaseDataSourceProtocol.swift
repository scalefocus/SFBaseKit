//
//  BaseDataSourceProtocol.swift
//  BaseKit
//
//  Created by Martin Vasilev on 14.11.18.
//  Copyright © 2018 Upnetix. All rights reserved.
//

import UIKit

public protocol BaseDataSource {
    
    var reuseIdentifiers: [String] { get }
    
    /// Provides the number of sections in your table/collection view
    /// Defaults to 1
    var numberOfSections: Int { get }
    
    /// Provides the number of table/collection view cells for the given section
    ///
    /// - Parameter section: The given section
    /// - Returns: The number of cells from the viewModel
    func numberOfCellsInSection(_ section: Int) -> Int?
    
    /// Provides the viewConfigurator for your configurable table/collection view cell
    ///
    /// - Parameter indexPath: The index path for the current cell
    /// - Returns: A configurator from the viewModel
    func viewConfigurator(at index: Int, in setion: Int) -> ViewConfigurator?
}

public extension BaseDataSource {
    
    var reuseIdentifiers: [String] {
        return []
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    func viewConfigurator(at index: Int, in section: Int) -> ViewConfigurator? {
        return nil
    }
    
}
