//
//  ContentView.swift
//  Guess The Flag
//
//  Created by Pedro Romero on 6/14/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria","Poland","Spain","UK","Ukraine","US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var keepScore = 0
    @State private var numberScore = 1
    @State private var pickedCountry = ""

    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.2), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack{
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                    .padding(30)
                VStack(spacing: 15){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold ))
                    }
                    ForEach(0..<3){ number in
                        Button{
                            flagTapped(number)
                        }label:{
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 50)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 50))
                
                Spacer()
                Spacer()
                
                Text("Score: ???")
                    .foregroundStyle(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert (scoreTitle , isPresented: $showingScore ){
            Button("Continue" , action: askQuestion )
        } message: {
            Text("""
                Your score is \(keepScore)
                The flagged you picked was \(pickedCountry)
                """)
           
        }
    }
    func flagTapped (_ number : Int){
        pickedCountry = countries[number]
        
        
        if number == correctAnswer{
            scoreTitle = "Q\(numberScore): Correct"
            keepScore += 1
            numberScore += 1
        }else if numberScore == 8{
            scoreTitle = "Game Over!!! Your final score is \(keepScore)"
            numberScore = 0
            keepScore = 0
        }else{
            scoreTitle = "Q\(numberScore): False"
            numberScore += 1
        }
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
    









/*
 VStack (){
     Text("Hello world!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
     Text("Pedro is the best!!")
     
     Spacer()
 }
}
}
 
 
 ZStack{
     Color.green
         //.frame(minWidth: 200 , maxWidth: .infinity , maxHeight: 500)
     Text("Helllo")
         .padding(50)
         .background(.ultraThinMaterial)
 }
 .ignoresSafeArea()
 
}
 
 
 Frame
 
 Color.primary = black
 Color.secondary = translucent
 
 
 
 //RadialGradient(colors: [.red, .blue], center: .center, startRadius: 50, endRadius: 200)
 //AngularGradient(colors: [.red, .green, . blue, .orange, .purple, .red, .indigo], center: .center)
 Text("hello")
     .frame(maxWidth: .infinity, maxHeight: .infinity)
     .foregroundStyle(.white)
     .background(.purple.gradient)
}
}
 
 VStack{
     Button("Hello", systemImage: "pencil", role: .destructive){
         print("Hello")
     }
     .buttonStyle(.borderedProminent)
 }
}
 
 
 Button("Showing Alert"){
     showingAlert = true
 }
 .alert("Warning" , isPresented: $showingAlert){
     Button("Save" , role: .cancel){}
     Button("Delete" , role: .destructive){}
 }
 message: {
     Text("Please Read This!!!")
 }
 }
 */
