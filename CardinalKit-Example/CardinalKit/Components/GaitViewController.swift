//
//  GaitViewController.swift
//  CardinalKit_Example
//
//  Created by Laura on 09.02.22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import SwiftUI
import ResearchKit

struct GaitViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = ORKTaskViewController
    
    func makeCoordinator() -> SurveyViewCoordinator {
        SurveyViewCoordinator()
    }
    
    func updateUIViewController(_ uiViewController: ORKTaskViewController, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> ORKTaskViewController {
        let sampleGaitTask: ORKOrderedTask = {
            //return
            ORKOrderedTask.shortWalk(withIdentifier: "ShortWalkTask", intendedUseDescription: "", numberOfStepsPerLeg: 20, restDuration: 30, options: ORKPredefinedTaskOption())
            }()
        
            let taskViewController = ORKTaskViewController(task: sampleGaitTask, taskRun: nil)
                taskViewController.delegate = context.coordinator
                return taskViewController
    }
}

