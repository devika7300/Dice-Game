//
//  ContentView.swift
//  DiceGame
//
//  Created by Devika Shendkar on 2/19/23.
//

import SwiftUI

struct ContentView: View {
    //Variables Declaration
    @State var sliderValue: Double = 0
    @State private var showingAlert = false
    @State private var resetAlert = false
    @State var sum: Int = 0
    @State var total: String = ""
    @State var totalMoney: Int = 0
    @State var totMon: String = ""
    @State var d1 = 1
    @State var d2 = 1
    @State var d3 = 1
    @State var d4 = 1
    @State var minSum = 0
    @State var maxSum = 0
    var imagesDico = [1:"DiceOne", 2: "DiceTwo", 3: "DiceThree", 4: "DiceFour", 5:"DiceFive", 6:"DiceSix"]
   
    var body: some View {
        NavigationView{
            VStack{
                
                //Name of the game
                Text("Dice Game").font(.largeTitle)
                    .fontWeight(.bold)
                
                //Code for Total Money
                HStack{
                    Text("Total Money:")
                    TextField("0",text:$totMon)
                }.padding([.horizontal],20)
                
                //Code for Dice Images
                HStack {
                    VStack {
                        Image(imagesDico[d1]!).resizable().aspectRatio(contentMode: .fit)
                        Text(String(d1))
                        Image(imagesDico[d2]!).resizable().aspectRatio(contentMode: .fit)
                        Text(String(d2))
                    }
                    
                    VStack {
                        Image(imagesDico[d3]!).resizable().aspectRatio(contentMode: .fit)
                        Text(String(d3))
                        Image(imagesDico[d4]!).resizable().aspectRatio(contentMode: .fit)
                        Text(String(d4))
                    }
                }.padding()
                
                //Code for Sum
                HStack{
                    Text("Sum: ")
                    TextField("0",text: $total)
                }.padding([.horizontal],20)
                
                //Code for Slider
                Slider(value: $sliderValue, in: 0...36, step: 1){
                    Text("Speed")
                }minimumValueLabel: {
                    Text("0").font(.title2).fontWeight(.thin)
                }maximumValueLabel: {
                    Text("36").font(.title2).fontWeight(.thin)
                }.padding([.horizontal],20)
                Text("\(sliderValue)")
        
              
                HStack(spacing:260){
                    //Code for Alert on Roll button which tells rule (1) of Game Rules
                    if(sliderValue==0){
                        Button("Roll", action:{
                            showingAlert = true
                        }).alert("Set The Bet on Slider First", isPresented: $showingAlert) {
                            Button("OK", role: .cancel) { }
                        }
                    }
                    //Code for adding Total Money according to game rules (2) &  (3)
                    else{
                        Button("Roll", action: {
                            d1 = Int.random(in:1...6)
                            d2 = Int.random(in:1...6)
                            d3 = Int.random(in:1...6)
                            d4 = Int.random(in:1...6)
                            sum = d1+d2+d3+d4
                            total = String(sum)
                            minSum = sum - 2
                            maxSum = sum + 2
                            
                            //RULE 2
                            if(Int(sliderValue) == sum){
                                totalMoney += 100
                                totMon = String(totalMoney)
                            }
                            //RULE 3
                            else if(Int(sliderValue) >= minSum && Int(sliderValue) <= maxSum){
                                totalMoney += 50
                                totMon = String(totalMoney)
                            }
                                        
                        })
                        
                    }
                   
                    //Code for Reset
                    Button("Reset", action: {
                        sliderValue = 0
                        sum = 0
                        totalMoney = 0
                        totMon = "0"
                        total = "0"
                        d1 = 1
                        d2 = 1
                        d3 = 1
                        d4 = 1
                        resetAlert = true
                    }).alert("Game reset imminent! Prepare for a fresh start.", isPresented: $resetAlert) {
                        Button("OK", role: .cancel) { }
                    }
                }
                
                //Code for navigation link of Game's Rules Screen
                NavigationLink(destination: RulesScreenView()) {
                    Text("Need Help? Go to Game Rules")
                }
                
                //Code for navigation link of Author Screen
                NavigationLink(destination: AuthorView()) {
                    Text("More About Author")
                }
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(CustomColor.myColor) // Code for background color
            
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Code for Custom Background Color
struct CustomColor {
    static let myColor = Color("myColor")
}
