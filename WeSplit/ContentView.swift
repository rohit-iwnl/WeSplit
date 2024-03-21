//
//  ContentView.swift
//  WeSplit
//
//  Created by Rohit Manivel on 3/21/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var noOfPeople = 2
    @State private var tipPercentage = 20
    
    var totalPerPerson : Double {
        if(checkAmount==0){
            return 0
        }
            
            
        let peopleCount = Double(noOfPeople + 2)
        let tipSelection = Double(tipPercentage) / 100
        
        let grandTotal = checkAmount + (checkAmount*tipSelection)
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
    }
    
    let tipPercentages : [Int] = [10,15,20,25,0]
    
    var body: some View{
        NavigationStack{
            Form{
                Section(header: Text("Check Amount")){
                    TextField("Enter your check amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Split By")){
                    Picker("Number of People", selection: $noOfPeople){
                        ForEach(2..<100){
                            Text("\($0)")
                        }
                    }
                }
                
                Section(header: Text("How much do you want to tip?")){
                    Picker("Select Tip", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){ tip in
                            Text("\(tip)")
                            
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section(header: Text("Amount per peroson").font(.subheadline)){
                    Text("\(totalPerPerson)")
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
