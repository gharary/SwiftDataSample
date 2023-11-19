//
//  SampleDetailView.swift
//  SwiftDataSample
//
//  Created by Mo Gharari on 19/11/2023.
//

import SwiftUI
import SwiftData

struct SampleDetailView: View {
    @Environment(\.modelContext) private var context
    @State private var isAddingData: Bool = false
    @Bindable var sample: SampleModel
    var body: some View {
        List {
            ForEach(sample.data) { data in
                VStack(alignment: .leading) {
                    Text("\(data.date)")
                    Text(data.desc)
                }
            }.onDelete(perform: { indexSet in
                if let selection = indexSet.first {
                    context.delete(sample.data[selection])
                }
            })
        }.toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isAddingData = true
                } label: {
                    Label("Add Data", systemImage: "plus")
                }
            }
        }.sheet(isPresented: $isAddingData) {
            AddDetailView(dismiss: $isAddingData, sample: sample)
        }
    }
}

#Preview {
    SampleDetailView(sample: SampleModel(name: "Test1", data: []))
}
