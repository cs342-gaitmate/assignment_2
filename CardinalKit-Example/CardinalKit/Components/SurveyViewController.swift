//
//  SurveyViewController.swift
//  CardinalKit_Example
//
//  Created by Ankush Dhawan on 1/26/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//


import Foundation
import SwiftUI
import ResearchKit

struct SurveyViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = ORKTaskViewController
    
    func makeCoordinator() -> SurveyViewCoordinator {
        SurveyViewCoordinator()
        
    }
    
    func updateUIViewController(_ uiViewController: ORKTaskViewController, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> ORKTaskViewController {
        let sampleSurveyTask: ORKOrderedTask = {
            var steps = [ORKStep]()
            
            // Step 1: Instruction step
            let instructionStep = ORKInstructionStep(identifier: "IntroStep")
            instructionStep.title = "Patient Questionnaire"
            instructionStep.text = "This info will help your doctor keep track of how you feel."
            
            steps += [instructionStep]
            
            // Step 2: Question Step - scale format
            let healthScaleAnswerFormat = ORKAnswerFormat.scale(withMaximumValue: 5, minimumValue: 1, defaultValue: 3, step: 1, vertical: false, maximumValueDescription: "Excellent", minimumValueDescription: "Power")
            let healthScaleQuestionStep = ORKQuestionStep(identifier: "HealthScaleQuestionStep", title: "Question # 1", question: "In general, would you say your helath is:", answer: healthScaleAnswerFormat)
            
            steps += [healthScaleQuestionStep]
            
            // Step 3: question step - choice selection format
            let textChoices = [
                ORKTextChoice(text: "Yes, Limited A Lot", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Yes, Limited A Little", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "No, Not Limited At All", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
            ]
            let textChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
            let textStep = ORKQuestionStep(identifier: "TextStep", title: "Daily Activities", question: "MODERATE ACTIVITIES, such as moving a table, pushing a vacuum cleaner, bowling, or playing golf:", answer: textChoiceAnswerFormat)
            
            steps += [textStep]
            
            //Step 4: form step
            let formItem = ORKFormItem(identifier: "FormItem1", text:"MODERATE ACTIVITIES, such as moving a table, pushing a vacuum cleaner, bowling, or playing golf:", answerFormat: textChoiceAnswerFormat)
            let formItem2 = ORKFormItem(identifier: "FormItem2", text:"Climbing SEVERAL flights of stairs:", answerFormat: textChoiceAnswerFormat)
            let formStep = ORKFormStep(identifier: "FormStep", title:"Daily Activities", text: "The following two questions are about activities you might do during a typical day. Does YOUR HEALTH NOW LIMIT YOU in these activities? If so, how much?")
            formStep.formItems = [formItem, formItem2]
            
            steps += [formStep]
            
            //Step 5: question step - boolean format
            let booleanAnswer = ORKBooleanAnswerFormat(yesString: "Yes", noString: "No")
            let booleanQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nil, question: "In the past four weeks, did you feel limited in the kind of work that you can accomplish?", answer:booleanAnswer)
            
            steps += [booleanQuestionStep]
            
            //SUMMARY
            let summaryStep = ORKCompletionStep(identifier: "SummaryStep")
            summaryStep.title = "Thank you."
            summaryStep.text = "We appreciate your time."
            
            steps += [summaryStep]
            
            
            
            return ORKOrderedTask(identifier: "SurveyTask", steps: steps)
        }()
        
        let taskViewController = ORKTaskViewController(task: sampleSurveyTask, taskRun: nil)
        taskViewController.delegate = context.coordinator
        
        return taskViewController
    }
}

