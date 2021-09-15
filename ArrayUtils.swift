//
//  ArrayUtils.swift
//  ArrayUtils
//
//  Created by Gove Allen on 9/14/21.
//  Copyright © 2021 Eli Allen. All rights reserved.
//

import Foundation


extension Array where Element: Identifiable{
    
    func firstIndex(of target:Element)-> Int? {
        for index in 0..<self.count{
            if self[index].id == target.id {
                return index
            }
        }
        return nil
    }
}
