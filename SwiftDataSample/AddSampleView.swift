//
//  AddSampleView.swift
//  SwiftDataSample
//
//  Created by Mo Gharari on 19/11/2023.
//

import SwiftUI
import SwiftData

struct AddSampleView: View {
    @Environment(\.modelContext) private var context
    @Query private var samples: [SampleModel]
    @State private var sampleName: String = ""
    var body: some View {
        NavigationStack {
            List {
                TextField("Type sample name", text: $sampleName)
                    .onSubmit {
                        addItem()
                    }
                ForEach(samples) { sample in
                    Text(sample.name)
                }.onDelete(perform: { indexSet in
                    for index in indexSet {
                        context.delete(samples[index])
                    }
                })
            }
        }
    }
    
    private func addItem() {
        guard sampleName.isEmpty == false else { return }
        let newSample = SampleModel(name: sampleName, data: [])
        context.insert(newSample)
        sampleName = ""
    }
}

#Preview {
    AddSampleView()
}
