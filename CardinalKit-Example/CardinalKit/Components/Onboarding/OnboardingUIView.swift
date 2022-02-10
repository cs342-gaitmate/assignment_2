//
//  OnboardingUIView.swift
//  CardinalKit_Example
//
//  Created by Varun Shenoy on 8/14/20.
//  Copyright © 2020 Stanford University. All rights reserved.
//

import SwiftUI
import UIKit
import ResearchKit
import CardinalKit
import Firebase

struct OnboardingElement {
    let logo: String
    let title: String
    let description: String
}

struct OnboardingUIView: View {
    
    var onboardingElements: [OnboardingElement] = []
    let color: Color
    let config = CKPropertyReader(file: "CKConfiguration")
    @State var showingOnboard = false
    @State var showingLogin = false
    @State var showingSurvey = false
    @State var showingTask = false
    
    var onComplete: (() -> Void)? = nil
    
    init(onComplete: (() -> Void)? = nil) {
        let onboardingData = config.readAny(query: "Onboarding") as! [[String:String]]
        
        
        self.color = Color(config.readColor(query: "Primary Color"))
        self.onComplete = onComplete
        
        for data in onboardingData {
            self.onboardingElements.append(OnboardingElement(logo: data["Logo"]!, title: data["Title"]!, description: data["Description"]!))
        }
    }

    var body: some View {
        
        let gradient = Gradient(colors: [color.self, .white] )
        
        LinearGradient(gradient: gradient, startPoint: .bottomTrailing, endPoint: .topLeading)
            .edgesIgnoringSafeArea(.vertical)
            .overlay (
        
        VStack(spacing: 10) {
            Spacer()
            
            Image("SBDLogoGrey")
                .resizable()
                .scaledToFit()
                .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN*6)
                .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN*6)
            
            Spacer(minLength: 40)
            
            Image("GaitMate")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN*7)
                .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN*7)
            
            /*
            Text(config.read(query: "Study Title"))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .font(.system(size: 38, weight: .bold, design: .default))
                .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN)
                .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN)
            */
            
            Spacer()
                .frame(height: 20)
            
            Text(config.read(query: "Team Name"))
                .multilineTextAlignment(.center)
                .font(.system(size: 22, design: .default))
                .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN*4)
                .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN*4)
            

            /*
            PageView(self.onboardingElements.map { InfoView(logo: $0.logo, title: $0.title, description: $0.description, color: self.color) })
            */

            Spacer()
            
            HStack {
                Spacer()
                Button(action: {
                    self.showingOnboard.toggle()
                }, label: {
                     Text("Join Study")
                        .padding(Metrics.PADDING_BUTTON_LABEL)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(color.self)
                        .background(Color.white)
                        .cornerRadius(Metrics.RADIUS_CORNER_BUTTON)
                        .font(.system(size: 20, weight: .bold, design: .default))
                })
                .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN)
                .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN)
                .sheet(isPresented: $showingOnboard, onDismiss: {
                    self.onComplete?()
                }, content: {
                    OnboardingViewController().ignoresSafeArea(edges: .all)
                })
        
                Spacer()
            }
            
            HStack {
                Spacer()
                Button(action: {
                    self.showingLogin.toggle()
                }, label: {
                     Text("I'm a Returning User")
                        .padding(Metrics.PADDING_BUTTON_LABEL)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .overlay(
                                    RoundedRectangle(cornerRadius: Metrics.RADIUS_CORNER_BUTTON)
                                        .stroke(.white, lineWidth: 2)
                            )
                })
                .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN)
                .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN)
                .sheet(isPresented: $showingLogin, onDismiss: {
                    self.onComplete?()
                }, content: {
                    LoginExistingUserViewController().ignoresSafeArea(edges: .all)
                })
        
                Spacer()
            }
            /*
            HStack {
                Spacer()
                Button("Survey"){
                    self.showingSurvey.toggle()
                    self.showingTask.toggle()
                }
                .padding(Metrics.PADDING_BUTTON_LABEL)
                .foregroundColor(Color.white)
                .font(.title)
                .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN)
                .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN)
                //.padding()
                .background(self.color)
                .cornerRadius(10)
                .sheet(isPresented: $showingTask) {
                    SurveyViewController()
                }
                Spacer()
            }
            */
            Spacer()
                .frame(height: 30)
        }
    )
}

struct InfoView: View {
    let logo: String
    let title: String
    let description: String
    let color: Color
    var body: some View {
        VStack(spacing: 10) {
            Circle()
                .fill(color)
                .frame(width: 100, height: 100, alignment: .center)
                .padding(6)
                .overlay(
                    Text(logo)
                        .foregroundColor(.white)
                        .font(.system(size: 42, weight: .light, design: .default))
                )

            Text(title).font(.title)
            
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.leading, 40)
                .padding(.trailing, 40)
        }
    }
}

struct OnboardingUIView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingUIView()
    }
}
}
