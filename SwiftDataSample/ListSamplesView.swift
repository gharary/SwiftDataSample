//
//  ListSamplesView.swift
//  SwiftDataSample
//
//  Created by Mo Gharari on 19/11/2023.
//

import SwiftUI
import SwiftData

struct ListSamplesView: View {
    @Environment(\.modelContext) private var context
    @Query private var samples: [SampleModel]
    @State private var isAddingSample: Bool = false
    var body: some View {
        NavigationStack {
            List {
                ForEach(samples) { sample in
                    NavigationLink(sample.name) {
                        SampleDetailView(sample: sample)
                    }
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isAddingSample = true
                    } label: {
                        Label("Add Data", systemImage: "plus")
                    }
                }
            }.navigationTitle("Samples")
        }.sheet(isPresented: $isAddingSample) {
            AddSampleView()
        }
    }
    
}

#Preview {
    ListSamplesView()
}
