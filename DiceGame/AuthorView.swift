//
//  AuthorView.swift
//  DiceGame
//
//  Created by Devika Shendkar on 2/26/23.
//

import SwiftUI

struct AuthorView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
  
    var paragraphStyle: NSParagraphStyle {
      let style = NSMutableParagraphStyle()
      style.alignment = .justified
      return style
    }
    
    var body: some View {
        NavigationView{
           ScrollView{
            VStack{
                //Author Information
                Image("Author").clipShape(Circle()).shadow(radius: 7).overlay(Circle().stroke(Color.white, lineWidth: 4))
                Text(authObj.name).padding().font(.custom("Georgia", size: 24))
                Text(AttributedString(authObj.description,attributes: AttributeContainer([.paragraphStyle: paragraphStyle]))).padding([.horizontal,.vertical],30).font(.custom("Avenir Next", size: 20))
             
                //Alert which will take u back to the game screen after dismissing
                Button("Play Now", action:{
                    showingAlert = true
                }).alert(isPresented: $showingAlert) {
                    Alert(title: Text("Let's Gooo!!!"),
                          dismissButton: Alert.Button.default(
                            Text("Ok"), action: {
                                // This is how you go back to ContentView
                                presentationMode.wrappedValue.dismiss()
                            }
                          )
                    )
                }}
           }
        
    }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(ACustomColor.myColor)
    }
}

//Class and Object for Name and Description
class Author{
    var name = "Devika Shendkar"
    var description = " Hello! I'm a computer science graduate with expertise in software development and programming.I have experience in developing web and mobile applications, as well as creating efficient algorithms and data structures. In my free time, I enjoy exploring new technologies and building personal projects."
}
let authObj = Author()

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorView()
    }
}

//Code for Custom Background Color
struct ACustomColor {
    static let myColor = Color("myColor")
}
