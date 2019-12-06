//
//  ArrayExtension.swift
//  Assignminder
//
//  Created by Rathin Chopra on 2019-12-05.
//  Copyright © 2019 Rathin Chopra. All rights reserved.
//

import Foundation

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element] {
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))
    }
}
