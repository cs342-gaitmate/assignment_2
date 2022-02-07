//
//  LandingUIView.swift
//  CardinalKit_Example
//
//  Created by Laura on 06.02.22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import SwiftUI
import ResearchKit
import CardinalKit

struct HomeUIView: View {
    
    var date = ""
    
    let color: Color
    let config = CKConfig.shared
    
    @State var useCloudSurveys = false
    
    @State var listItems = [CloudTaskItem]()
    @State var listItemsPerHeader = [String:[CloudTaskItem]]()
    @State var listItemsSections = [String]()
    
    let localListItems = LocalTaskItem.allValues
    var localListItemsPerHeader = [String:[LocalTaskItem]]()
    var localListItemsSections = [String]()
    
    init(color: Color) {
        self.color = color
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM. d, YYYY"
        date = formatter.string(from: Date())
        
        if localListItemsPerHeader.count <= 0 { // init
            for item in localListItems {
                if localListItemsPerHeader[item.section] == nil {
                    localListItemsPerHeader[item.section] = [LocalTaskItem]()
                    localListItemsSections.append(item.section)
                }
                
                localListItemsPerHeader[item.section]?.append(item)
            }
        }
    }

    func getRemoteItems(){
        CKResearchSurveysManager.shared.getTaskItems(onCompletion: {
            (results) in
            
            if let results = results as? [CloudTaskItem]{
                listItems = results
                var headerCopy = listItemsPerHeader
                var sectionsCopy = listItemsSections
                if listItemsPerHeader.count <= 0 { // init
                    for item in results {
                        if headerCopy[item.section] == nil {
                            headerCopy[item.section] = [CloudTaskItem]()
                            sectionsCopy.append(item.section)
                        }
                        if(((headerCopy[item.section]?.contains(item)) ?? false) == false){
                            headerCopy[item.section]?.append(item)
                        }
                    }
                }
                listItemsPerHeader=headerCopy
                listItemsSections=sectionsCopy
            }
        })
    }
    
    var body: some View {
        
        let gradient = Gradient(colors: [.white, color.self] )
        
        LinearGradient(gradient: gradient, startPoint: .bottomTrailing, endPoint: .topLeading)
            .edgesIgnoringSafeArea(.vertical)
            .overlay (
                
        VStack (alignment: .leading, spacing: 30) {
            
            Image("GaitMate")
                .resizable()
                .scaledToFit()
                .cornerRadius(10)
                .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN*9)
                .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN*9)
            
            Spacer()
                .frame(height: 10)
            
            HStack {
                
                Spacer()
                
                Button(action: {
 
                }, label: {
                    Image(systemName: "square.and.pencil")
                    Text("Report a Fall")
                })
                    .padding(Metrics.PADDING_BUTTON_LABEL)
                    .foregroundColor(Color.white)
                    .font(.title)
                    .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN)
                    .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN)
                    .background(self.color)
                    .cornerRadius(10)
                
                Spacer()
            }
            
            HStack {
                
                Spacer()
                
                Button(action: {
 
                }, label: {
                    Image(systemName: "figure.walk")
                    Text("Walking Task")
                })
                    .padding(Metrics.PADDING_BUTTON_LABEL)
                    .foregroundColor(Color.white)
                    .font(.title)
                    .padding(.leading, Metrics.PADDING_HORIZONTAL_MAIN)
                    .padding(.trailing, Metrics.PADDING_HORIZONTAL_MAIN)
                    .background(self.color)
                    .cornerRadius(10)
                
                Spacer()
            }
        }
        )
    }
}

struct LandingUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeUIView(color: Color.blue)
    }
}

