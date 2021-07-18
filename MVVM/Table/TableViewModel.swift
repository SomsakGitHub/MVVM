//
//  TableViewModel.swift
//  MVVM
//
//  Created by Somsak Kaeworasan on 16/7/2564 BE.
//

import Foundation

struct TableViewModel {
    let name: String
    var followState: Bool
    
    init(model: Person) {
        self.name = model.name
        self.followState = false
    }
}
