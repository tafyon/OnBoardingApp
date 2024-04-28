//
//  ContentView.swift
//  OnBoardingApp
//
//  Created by Tamer Afyon on 28.04.2024.
//

import SwiftUI
struct OnBoardingStep {
    let image: String
    let title: String
    let description: String
}
private let onBoardingSteps = [
    OnBoardingStep(image: "Behavioral", title: "Behavioral Health Service", description: "Transforming lives by offering hope and opportunities for recovery, wellness, and independence."),
    OnBoardingStep(image: "Mental", title: "Mental Health Service", description: "If you think that you or someone you know has a mental health problem, there are a number of ways that you can seek advice."),
    OnBoardingStep(image: "GetStarted", title: "Get Started", description: "Take the first step on your journey to better mental health. Get started today!")

]



struct ContentView: View {
    @State private var currentStep = 0
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        
        ZStack {
            Image("Background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack{
                HStack{
                    Spacer()
                    Button(action: {
                        self.currentStep = onBoardingSteps.count - 1
                    }) {
                        Text("Skip")
                            .padding(25)
                            .foregroundColor(.white)
                    }
                }
                
                TabView(selection: $currentStep) {
                    ForEach(0..<onBoardingSteps.count) {it in
                    VStack {
                        Image(onBoardingSteps[it].image)
                            .resizable()
                            .frame(width: 400, height: 400, alignment: .center)
                        Text(onBoardingSteps[it].title)
                            .font(.title)
                            .bold()
                            .foregroundColor(.white)
                        Text(onBoardingSteps[it].description)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                            .foregroundColor(.white)
                        
                    }
                    .tag(it)
                }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                HStack {
                    ForEach(0..<onBoardingSteps.count) {it in
                        if it == currentStep {
                            Rectangle()
                                .frame(width: 10, height: 10)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        } else {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.gray)
                            
                        }
                    }
                }
                .padding(.bottom, 24)

                
                
                Button(action: {
                    if self.currentStep < onBoardingSteps.count - 1 {
                        self.currentStep += 1
                    } else {
                        
                    }
                }, label: {
                    Text(currentStep < onBoardingSteps.count - 1 ? "Next" : "Get Started")
                        .padding(.all, 16)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.white)
                        .cornerRadius(16)
                        .padding(.bottom, 60)
                        .foregroundColor(.black)
                } )
                .buttonStyle(PlainButtonStyle())
                
            }
        }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

