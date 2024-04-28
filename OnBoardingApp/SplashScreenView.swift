//
//  SplashScreenView.swift
//  OnBoardingApp
//
//  Created by Tamer Afyon on 28.04.2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Image("Background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    VStack{
                        Image(systemName: "cross.case.circle.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.white)
                            .padding(.bottom, 10)
                        Text("Health Service")
                            .foregroundColor(.white)
                            .bold()
                        
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
            }
            }
        }

    }
}
#Preview {
    SplashScreenView()
}
