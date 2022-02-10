//
//  ActiveViewController.swift
//  CardinalKit_Example
//
//  Created by Laura on 09.02.22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//


import Foundation
import SwiftUI
import ResearchKit

struct ActiveViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = ORKTaskViewController
    
    func makeCoordinator() -> SurveyViewCoordinator {
        SurveyViewCoordinator()
    }
    
    func updateUIViewController(_ uiViewController: ORKTaskViewController, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> ORKTaskViewController {
        let sampleActiveTask: ORKOrderedTask = {
            var steps = [ORKStep]()
            
            // Step 1: Video Instruction step
            let videoInstructionStep = ORKVideoInstructionStep(identifier: "videoInstructionStep")
                videoInstructionStep.title = NSLocalizedString("Video Instruction Step", comment: "")
                videoInstructionStep.videoURL = URL(string: "https://www.apple.com/media/us/researchkit/2016/a63aa7d4_e6fd_483f_a59d_d962016c8093/films/carekit/researchkit-carekit-cc-us-20160321_r848-9dwc.mov")
                videoInstructionStep.thumbnailTime = 2 // Customizable thumbnail timestamp
            steps += [videoInstructionStep]
            
            // Step 2: question step - choice selection format
            let textChoices = [
              ORKTextChoice(text: "Have you cleared a 10-foot-long space with no throw rugs or obstructions?", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
              ORKTextChoice(text: "Have you set up a chair on one side (ideally with arms)? ", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
              ORKTextChoice(text: "Are you wearing regular footwear?", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
              ORKTextChoice(text: "Do you have someone present who can assist you if needed? ", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
              ORKTextChoice(text: "Have you put on the belt with pouch to hold your phone?", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
            ]
            let textChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: textChoices)
            let textStep = ORKQuestionStep(identifier: "TextStep", title: "Safety Checklist ", question: "Next, we need you to make sure the safety checklist is complete.", answer: textChoiceAnswerFormat)
            steps += [textStep]
            let activeStep1 = ORKInstructionStep(identifier: "IntroStep")
            activeStep1.title = "TBD"
            activeStep1.text = "TBD"
            let activeStep2 = ORKCountdownStep(identifier: "ORKCountdownStepIdentifier");
            activeStep2.title = "TBD"
            activeStep2.stepDuration = 5.0;
            steps += [activeStep2]
            return ORKOrderedTask(identifier: "shortWalkTaskWithIdentifier", steps: steps)
            
            }()
        
            let taskViewController = ORKTaskViewController(task: sampleActiveTask, taskRun: nil)
                taskViewController.delegate = context.coordinator
                return taskViewController
    }
}

