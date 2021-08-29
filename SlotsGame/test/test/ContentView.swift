//
//  ContentView.swift
//  test
//
//  Created by Stephen Schmitz on 7/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var betAmount: Int = 0
    @State private var names: Array = ["cherry","gem","7"]
    @State private var chips: Int = 10000
    @State private var name1: String = "gem"
    @State private var name2: String = "cherry"
    @State private var name3: String = "gem"

    
    func increaseBet100(){
        betAmount += 100
    }
    
    func increaseBet500(){
        betAmount += 500
    }

    func increaseBet1000(){
        betAmount += 1000
    }
    
    func spin(){
        var randomnum1 = Int.random(in: 0...2)
        var randomnum2 = Int.random(in: 0...2)
        var randomnum3 = Int.random(in: 0...2)

        name1 = names[randomnum1]
        name2 = names[randomnum2]
        name3 = names[randomnum3]
        
        checkWinning()
    }
    
    func checkWinning(){
        if(name1 == name2 && name1 == name3 && name2 == name3){
            playerwin()
            clearbet()
        } else {
            playerlose()
            clearbet()
        }
    }
    
    func playerwin(){
        chips += betAmount * 10
        checkchips()
    }
    
    func playerlose(){
        chips -= betAmount
        checkchips()
    }
    
    func clearbet(){
        betAmount = 0
    }
    
    func checkchips(){
        if(chips <= 0){
            chips = 10000
        }
    }

    var body: some View {
        
        ZStack{
            BackgroundView(color1: Color.green, color2: Color.white)
            
            VStack(spacing: 20){
                
                // slots logo
                Image("slots")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .padding(.vertical, -20)
                
                // slot machine itself
                HStack{
                    Image(name1)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 75)
                        .padding(.horizontal, 10)
                    
                    Image(name2)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 75)
                        .padding(.horizontal, 10)
                    
                    Image(name3)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 75)
                        .padding(.horizontal, 10)
                }
                
                // spacer
                Spacer()
                
                // chips
                VStack(spacing: 30){
                    HStack(spacing: 100){
                        HStack{
                            Text("Your\nChips".uppercased())
                                .font(.system(size: 16, weight: .bold, design: .default))
                            Text("\(chips)".uppercased())
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                        }
                        .padding(10)
                        .background(
                            Capsule()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                        )
                        
                        HStack{
                            Text("     Bet\nAmount".uppercased())
                                .font(.system(size: 16, weight: .bold, design: .default))
                            Text("\(betAmount)")
                                .font(.system(size: 16, weight: .bold, design: .rounded))
                        }
                        .padding(10)
                        .background(
                            Capsule()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color.white]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                        )
                    }
                    
                    // bet amount
                    VStack{
                        Text("How much do you want to bet?")
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .foregroundColor(.black)
                            .font(.headline)
                        HStack{
                            Button(action: {
                                increaseBet100()
                            }, label: {
                                Text("+100")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                            })
                            Button(action: {
                                increaseBet500()
                            }, label: {
                                Text("+500")
                                    .foregroundColor(.white)
                                    .font(.subheadline)

                            })
                            Button(action: {
                                increaseBet1000()
                            }, label: {
                                Text("+1000")
                                    .foregroundColor(.white)
                                    .font(.subheadline)

                            })
                        }
                    }
                    .padding(10)
                    .background(
                        Capsule()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color.green]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                    )
                }
                
                //Spacer
                Spacer()
                
                //Spin button
                Button(action: {
                    spin()
                }, label: {
                    Text("Spin!")
                        .frame(width: 180, height: 50)
                        .foregroundColor(.green)
                        .background(Color.white)
                        .font(.system(size: 16, weight: .bold))
                        .cornerRadius(10)

                })
                
                //Spacer
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BackgroundView: View {
    var color1: Color
    var color2: Color

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
