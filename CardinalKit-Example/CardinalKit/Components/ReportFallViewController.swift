//
//  ReportFallViewController.swift
//  CardinalKit_Example
//
//  Created by Ankush Dhawan on 2/12/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import SwiftUI
import ResearchKit

struct ReportFallViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = ORKTaskViewController
    
    func makeCoordinator() -> SurveyViewCoordinator {
        SurveyViewCoordinator()
    }
    
    func updateUIViewController(_ uiViewController: ORKTaskViewController, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> ORKTaskViewController {
        let sampleSurveyTask: ORKOrderedTask = {
            var steps = [ORKStep]()
            
            // Calendar choice for date
            let fallDateAnswerFormat = ORKAnswerFormat.dateAnswerFormat()
            let fallDateStep = ORKQuestionStep(identifier: "fallDateStep", title: "Date of Fall", question: "What day did the fall happen?", answer: fallDateAnswerFormat)
            
            steps += [fallDateStep]
            
            let timeChoices = [
                ORKTextChoice(text: "Morning", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Mid-day", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Evening", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Night Time", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Do not recall", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
            ]
            let timeChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: timeChoices)
            let timeChoiceStep = ORKQuestionStep(identifier: "timeStep", title: "Time of Fall", question: "What time of day did the fall happen?", answer: timeChoiceAnswerFormat)
            
            steps += [timeChoiceStep]
            
            let injuryChoices = [
                ORKTextChoice(text: "No", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Yes: resulted in dressing, ice, cleaning of a wound, limb elevation, topical medication, bruise or abrasion.", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Yes: resulted in minor medical care (e.g. suturing, application of steri-strips/skin glue, splinting or muscle/joint strain).", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Yes: resulted in major medical care (e.g. surgery, casting, traction, required consultation for neurological or internal injury", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
            ]
            let injuryChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: injuryChoices)
            let injuryStep = ORKQuestionStep(identifier: "injuryStep", title: "Injury Associated with Fall", question: "Did this fall result in any type of injury?", answer: injuryChoiceAnswerFormat)
            
            steps += [injuryStep]
            
            // brief description of fall
            let descriptionAnswerFormat = ORKAnswerFormat.textAnswerFormat(withMaximumLength: 100)
            let descriptionStep = ORKQuestionStep(identifier: "descriptionStep", title: "Brief Description of Fall", question: "Briefly give some details about your fall (optional).", answer: descriptionAnswerFormat)
            
            steps += [descriptionStep]
            
            return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
        }()
        
        let taskViewController = ORKTaskViewController(task: sampleSurveyTask, taskRun: nil)
        taskViewController.delegate = context.coordinator
        
        return taskViewController
    }
}

