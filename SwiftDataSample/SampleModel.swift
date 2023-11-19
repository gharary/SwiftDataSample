//
//  SampleModel.swift
//  SwiftDataSample
//
//  Created by Mo Gharari on 19/11/2023.
//

import SwiftData
import Foundation


@Model
final class SampleData {
    var date: Date
    var desc: String
    var type: SampleModel?
    
    init(
        date: Date,
        desc: String,
        type: SampleModel
    ) {
        self.date = date
        self.desc = desc
        self.type = type
    }
}


@Model
final class SampleModel: Hashable {
    var id: UUID
    var name: String
    var data: [SampleData]
    init(name: String, data: [SampleData]) {
        self.id = UUID()
        self.name = name
        self.data = data
    }
}
