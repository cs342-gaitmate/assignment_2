//
//  MainUIView.swift
//  CardinalKit_Example
//
//  Created for the CardinalKit Framework.
//  Copyright © 2019 Stanford University. All rights reserved.
//

import SwiftUI

struct MainUIView: View {
    
    let color: Color
    let config = CKConfig.shared
    
    @State var useCareKit = false
    @State var carekitLoaded = false
    
    init() {
        self.color = Color(config.readColor(query: "Primary Color"))
        
    }
    
    var body: some View {
        TabView {
            
            HomeUIView(color: self.color).tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            
            /*
            TasksUIView(color: self.color).tabItem {
                Image(systemName: "figure.walk")
                Text("Tasks")
            }
            */
            
            if useCareKit && carekitLoaded {
                ScheduleViewControllerRepresentable()
                    .ignoresSafeArea(edges: .all)
                    .tabItem {
                        Image(systemName: "calendar")
                        Text("Schedule")
                }
                
                CareTeamViewControllerRepresentable()
                    .ignoresSafeArea(edges: .all)
                    .tabItem {
                        Image(systemName: "cross.circle.fill")
                        Text("Contact")
                }
            }
            
            ProfileUIView(color: self.color).tabItem {
                Image(systemName: "person.crop.circle.fill")
                Text("Profile")
            }
        }
        .accentColor(self.color)
        .onAppear(perform: {
            self.useCareKit = config.readBool(query: "Use CareKit")
            
            let lastUpdateDate:Date? = UserDefaults.standard.object(forKey: Constants.prefCareKitCoreDataInitDate) as? Date
            CKCareKitManager.shared.coreDataStore.populateSampleData(lastUpdateDate:lastUpdateDate){() in
                self.carekitLoaded = true
            }
            
            
        })
    }
}

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView()
    }
}
