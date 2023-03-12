//
//  ContentView.swift
//  WeConvert
//
//  Created by Sebastian Cioată on 12.03.2023.
//

import SwiftUI


struct ContentView: View {
    
    
    var units = ["Celsius", "Kelvin", "Fahrenheit"]
    @State private var selectedInputTemperature = "Celsius"
    @State private var selectedOutputTemperature = "Celsius"
    @State private var inputValue = 0.0
    
    var outputValue: Double{
        var outputValue = 0.0
        if (selectedInputTemperature == selectedOutputTemperature) {
            outputValue = inputValue
        } else if (selectedInputTemperature == "Celsius" && selectedOutputTemperature == "Kelvin") || (selectedInputTemperature == "Kelvin" && selectedOutputTemperature == "Celsius"){
            outputValue = inputValue + 273.15
        }else if (selectedInputTemperature == "Celsius" && selectedOutputTemperature == "Fahrenheit") || (selectedInputTemperature == "Fahrenheit" && selectedOutputTemperature == "Celsius"){
            outputValue = inputValue * 1.8 + 32
        }
        return outputValue
    }

    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("Please chose an unit", selection: $selectedInputTemperature){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }header:{
                    Text("Chose input value")
                }
                Section{
                    Picker("Please chose an unit", selection: $selectedOutputTemperature){
                        ForEach(units, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }header:{
                    Text("Chose output unit")
                }
                Section{
                    TextField("Enter the value you want to convert", value:$inputValue, format: .number)
                }header:{
                    Text("Insert input value")
                }
                Section{
                    Text(outputValue, format: .number)
                }header:{
                    Text("Output value")
                }
            }
            .navigationTitle("WeConvert")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
