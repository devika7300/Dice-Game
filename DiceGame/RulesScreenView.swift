//
//  RulesScreenView.swift
//  DiceGame
//
//  Created by Devika Shendkar on 2/27/23.
//

import SwiftUI

struct RulesScreenView: View {
    var paragraphStyle: NSParagraphStyle {
      let style = NSMutableParagraphStyle()
      style.alignment = .justified
      return style
    }
    var body: some View {
            ScrollView{
                
                //Code for Game Rules
                VStack{
                    
                    Image("GameRules").resizable()      //Game rules image code
                        .frame(width: 232.0, height: 232.0).padding()
                    Text(AttributedString(rulesObj.rule1,attributes: AttributeContainer([.paragraphStyle: paragraphStyle]))).padding([.horizontal],30).foregroundColor(Color.pink).font(.custom("Avenir Next", size: 20))
                    Text(AttributedString(rulesObj.rule2,attributes: AttributeContainer([.paragraphStyle: paragraphStyle]))).padding([.horizontal],25).foregroundColor(Color.pink).font(.custom("Avenir Next", size: 20))
                    Text(AttributedString(rulesObj.rule3,attributes: AttributeContainer([.paragraphStyle: paragraphStyle]))).padding([.horizontal],30).foregroundColor(Color.pink).font(.custom("Avenir Next", size: 20))
                    
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(RCustomColor.myColor) // background color code
    }
}

//Class and Object for Game Rules
class Rules{
    var rule1 = "1.Before clicking the roll button, the player must first use the slider to choose how much the player wants to bet."
    var rule2 = "2.If the sum of the numbers rolled matches the bet made  by the player, they will receive 100 points."
    var rule3 = "3.If the sum of the rolled numbers is within two units (either above or below) to bet,the player will earn 50 points."
}
let rulesObj = Rules()

struct RulesScreenView_Previews: PreviewProvider {
    static var previews: some View {
        RulesScreenView()
    }
}

//Code for Custom Background Color
struct RCustomColor {
    static let myColor = Color("myColor")
}
