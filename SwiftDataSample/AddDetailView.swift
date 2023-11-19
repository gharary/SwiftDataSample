//
//  AddDetailView.swift
//  SwiftDataSample
//
//  Created by Mo Gharari on 19/11/2023.
//

import SwiftUI
import SwiftData

struct AddDetailView: View {
    @Environment(\.modelContext) private var context
    @State private var desc: String = ""
    @State private var date: Date = .now
    @Binding var dismiss: Bool
    let sample: SampleModel
    
    var body: some View {
        VStack {
            TextField("Description", text: $desc)
                .textFieldStyle(.roundedBorder)
            DatePicker("", selection: $date, displayedComponents: .date)
                .datePickerStyle(.compact)
            
            Button("Save") {
                let newItem = SampleData(date: date, desc: desc, type: sample)
                context.insert(newItem)
                dismiss.toggle()
            }
        }.padding()
    }
}

#Preview {
    AddDetailView(dismiss: .constant(false), sample: SampleModel(name: "TestAddDetail", data: []))
}
