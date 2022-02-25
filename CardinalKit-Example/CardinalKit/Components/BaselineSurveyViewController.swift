//
//  BaselineSurveyViewController.swift
//  CardinalKit_Example
//
//  Created by Laura on 09.02.22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import SwiftUI
import ResearchKit

struct BaselineSurveyViewController: UIViewControllerRepresentable {
    typealias UIViewControllerType = ORKTaskViewController
    
    func makeCoordinator() -> SurveyViewCoordinator {
        SurveyViewCoordinator()
        
    }
    
    func updateUIViewController(_ uiViewController: ORKTaskViewController, context: Context) {
    }
    
    func makeUIViewController(context: Context) -> ORKTaskViewController {
        let sampleSurveyTask: ORKOrderedTask = {
            var steps = [ORKStep]()
            
            /*
            
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
             
             */
            
            // Instruction step
            let instructionStep = ORKInstructionStep(identifier: "IntroStep")
            instructionStep.title = "GaitMate Baseline Survey"
            instructionStep.text = "This survey will help us understand some things about you to help us understand fall risk. If you are unsure about how to answer a question, please give the best answer you can. If you feel uncomfortable, you can skip any question."
            
            steps += [instructionStep]
            
            //Part 1: Demographics:
            let demoAgeFormat = ORKAnswerFormat.scale(withMaximumValue: 120, minimumValue: 65, defaultValue: 80, step: 5, vertical: false, maximumValueDescription: "100+", minimumValueDescription: "65")
            let ageItem = ORKFormItem(identifier: "ageItem", text: "What is your age in years:", answerFormat: demoAgeFormat)
            
            let sexChoices = [
                ORKTextChoice(text: "Male", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Female", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Prefer not to Answer", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
            ]
            let demoSexFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: sexChoices)
            let sexItem = ORKFormItem(identifier: "sexItem", text: "What sex were you assigned at birth, on your original birth certificate?", answerFormat: demoSexFormat)
            
            let raceChoices = [
                ORKTextChoice(text: "White or Caucasian", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Black or African American", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Hispanic or Latino", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Native Hawaiian or Pacific Islander", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Native American", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Asian", value: 5 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Other", value: 6 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Prefer not to Answer", value: 7 as NSCoding & NSCopying & NSObjectProtocol)
            ]
            let raceChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: raceChoices)
            let raceItem = ORKFormItem(identifier: "raceItem", text: "What is your race?", answerFormat: raceChoiceAnswerFormat)
            
            let ethnicityChoices = [
                ORKTextChoice(text: "Yes", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "No", value: 1 as NSCoding & NSCopying & NSObjectProtocol)
            ]
            let ethnicityChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: ethnicityChoices)
            let ethnicityItem = ORKFormItem(identifier: "ethnicityItem", text: "Do you identify as Hispanic or Latino?", answerFormat: ethnicityChoiceAnswerFormat)
            
            /*
            let heightFormat = ORKAnswerFormat.scale(withMaximumValue: 100, minimumValue: 0, defaultValue: 50, step: 10, vertical: false, maximumValueDescription: "100", minimumValueDescription: "0")
            let heightItem = ORKFormItem(identifier: "heightItem", text: "What is your height (in inches):", answerFormat: heightFormat)
            */
            
            //let weightFormat = ORKNumericAnswerFormat(style: ORKNumericAnswerStyle.Type, unit: "lbs", minimum: 600, maximum: 0)
            let weightFormat = ORKAnswerFormat.scale(withMaximumValue: 500, minimumValue: 0, defaultValue: 150, step: 50, vertical: false, maximumValueDescription: "500", minimumValueDescription: "0")
            let weightItem = ORKFormItem(identifier: "weightItem", text: "How much do you weigh (lbs):", answerFormat: weightFormat)
            
            
            
            let demoStep = ORKFormStep(identifier: "demoStep", title: "Demographics", text: "The following questions concern your demographic information")
            demoStep.formItems = [ageItem, sexItem, raceItem, ethnicityItem, weightItem]
            
            steps += [demoStep]
            
            let liveWithChoices = [
                ORKTextChoice(text: "By myself", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "With someone else", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "With multiple people", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
            ]
            let liveWithFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: liveWithChoices)
            let liveWithItem = ORKFormItem(identifier: "liveWithItem", text: "Who do you currenty live with?", answerFormat: liveWithFormat)
            
            let livingSituationStep = ORKFormStep(identifier: "livingSituatiomStep", title: "Current Living Situation", text: "The following questions concern your current living situation")
            //let livingSituationStep = ORKFormStep(identifier: "livingSituatiomStep", title: "Current Living Situation", text: nil)

            livingSituationStep.formItems = [liveWithItem]
            
            steps += [livingSituationStep]
            
            //Part 3: Quality of Life
            let mobilityChoices = [
                ORKTextChoice(text: "I have no problems in walking about", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have slight problems in walking about", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have moderate problems in walking about", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have severe problems in walking about", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I am unable to walk about", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
            ]
            let mobilityFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: mobilityChoices)
            let mobilityItem = ORKFormItem(identifier: "mobilityItem", text: "How is your mobility?", answerFormat: mobilityFormat)
            
            let careChoices = [
                ORKTextChoice(text: "I have no problems washing or dressing myself", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have slight problems washing or dressing myself", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have moderate problems washing or dressing myself", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have severe problems washing or dressing myself", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I am unable to wash or dress myself", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
            ]
            let careFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: careChoices)
            let careItem = ORKFormItem(identifier: "careItem", text: "How good is your self-care?", answerFormat: careFormat)
            
            let activitiesChoices = [
                ORKTextChoice(text: "I have no problems doing my usual activities", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have slight problems doing my usual activities", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have moderate problems doing my usual activities", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have severe problems doing my usual activities", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I am unable to do my usual activities", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
            ]
            let activitiesFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: activitiesChoices)
            let activitiesItem = ORKFormItem(identifier: "activitiesItem", text: "How able are you to do usual activities (e.g. work, study, housework, family or leisure activities)?", answerFormat: activitiesFormat)
            
            let painChoices = [
                ORKTextChoice(text: "I have no pain or discomfort", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have slight pain or discomfort", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have moderate pain or discomfort", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have severe pain or discomfort", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have extreme pain or discomfort", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
            ]
            let painFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: painChoices)
            let painItem = ORKFormItem(identifier: "painItem", text: "How much pain / discomfort do you have?", answerFormat: painFormat)
            
            let anxietyChoices = [
                ORKTextChoice(text: "I am not anxious or depressed", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I am slightly anxious or depressed", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I am moderately anxious or depressed", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I am severely anxious or depressed", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I am extremely anxious or depressed", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
            ]
            let anxietyFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: anxietyChoices)
            let anxietyItem = ORKFormItem(identifier: "anxietyItem", text: "How is your mental health?", answerFormat: anxietyFormat)
            
            let overallFormat = ORKAnswerFormat.scale(withMaximumValue: 100, minimumValue: 0, defaultValue: 50, step: 50, vertical: false, maximumValueDescription: "100", minimumValueDescription: "0")
            let overallItem = ORKFormItem(identifier: "overallItem", text: "How would you rate your current overall health from 0-100, where 0 is the worst health you can imagine, and 100 is the best?", answerFormat: overallFormat)
            
            let qualityStep = ORKFormStep(identifier: "qualityStep", title: "Quality of Life", text: "Under each heading, please tick ONE box that best describes your health TODAY")
            qualityStep.formItems = [mobilityItem, careItem, activitiesItem, painItem, anxietyItem, overallItem]
            
            steps += [qualityStep]
            
            // GDS Questions
            /*
             let yesNoChoices = [
                 ORKTextChoice(text: "Yes", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                 ORKTextChoice(text: "No", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
             ]
             
            let yesNoFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: yesNoChoices)
            let satisfiedItem = ORKFormItem(identifier: "satisfiedItem", text: "Are you satisfied with your life?", answerFormat: yesNoFormat)
            let emptyItem = ORKFormItem(identifier: "emptyItem", text: "Do you feel that your life is empty?", answerFormat: yesNoFormat)
            let afraidItem = ORKFormItem(identifier: "afraidItem", text: "Are you afraid that something bad is going to happen to you?", answerFormat: yesNoFormat)
            let happyItem = ORKFormItem(identifier: "happyItem", text: "Do you feel happy most of the time?", answerFormat: yesNoFormat)
            
            let GDSStep = ORKFormStep(identifier: "GDSStep", title: "GDS-4", text: "The following questions are based on GDS-4")
            GDSStep.formItems = [satisfiedItem, emptyItem, afraidItem, happyItem]
            
            steps += [GDSStep]
             */
            
            // Page 4: Medications
            let medNumFormat = ORKAnswerFormat.scale(withMaximumValue: 20, minimumValue: 0, defaultValue: 5, step: 2, vertical: false, maximumValueDescription: "0", minimumValueDescription: "20")
            let medNumItem = ORKFormItem(identifier: "medicationItem", text: "How many different medications did you take in the past 24 hours:", answerFormat: medNumFormat)
            
            let yesNoChoices = [
                ORKTextChoice(text: "Yes", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "No", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
            ]
            let yesNoFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: yesNoChoices)
            let drowsyItem = ORKFormItem(identifier: "drowsyItem", text: "Do any of these medications make you drizzy or drowsy?", answerFormat: yesNoFormat)
            let medNumStep = ORKFormStep(identifier: "medicationStep", title: "Medications", text: "The following question corresponds your recent medications")
            medNumStep.formItems = [medNumItem, drowsyItem]
            
            steps += [medNumStep]
            
            // Step 5: Alcohol
            let frequencyChoices = [
                ORKTextChoice(text: "Never", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Monthly or less", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "2-4 times a month", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "2-3 times a week", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "4 or more times a week", value: 1 as NSCoding & NSCopying & NSObjectProtocol)
            ]
            let frequencyFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: frequencyChoices)
            let frequencyItem = ORKFormItem(identifier: "frequencyItem", text: "How often do you have a drink containing alcohol?", answerFormat: frequencyFormat)
            
            let numStandardChoices = [
                ORKTextChoice(text: "1 or 2", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "3 or 4", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "5 or 6", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "7 to 9", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "10 or more", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
            ]
            let numStandardFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: numStandardChoices)
            let numStandardItem = ORKFormItem(identifier: "standardItem", text: "How often do you have a drink containing alcohol?", answerFormat: numStandardFormat)
            
            let alcoholStep = ORKFormStep(identifier: "alcoholStep", title: "Alcohol", text: "The following question corresponds your alcohol consumption")
            alcoholStep.formItems = [frequencyItem, numStandardItem]
            
            steps += [alcoholStep]
            
            // Page 6: Environment
            let stairsChoices = [
                ORKTextChoice(text: "Do you have stairs in your home?", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Are there papers, shoes, books, or other objects on the stairs?", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Is there torn or loose carpet on stairs?", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Are there handrails on both sides of the stairs?", value: 3 as NSCoding & NSCopying & NSObjectProtocol)
            ]
            let stairsFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: stairsChoices)
            let stairsItem = ORKFormItem(identifier: "stairsItem", text: "Stairs Questions", answerFormat: numStandardFormat)
            
            let floorsChoices = [
                ORKTextChoice(text: "When you walk through a room, do you have to walk around furniture?", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Do you have throw rungs on the floor?", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Are there papers, shoes, books, or other objects on the floor where you walk?", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Do you have to walk over or around wires or cords (like lamp, telephone, or extension cords?", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Do you have a dog that sometimes walks under you", value: 4 as NSCoding & NSCopying & NSObjectProtocol)
            ]
            let floorsFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: floorsChoices)
            let floorsItem = ORKFormItem(identifier: "floorsItem", text: "Floors Questions", answerFormat: floorsFormat)
            
            let bedroomChoices = [
                ORKTextChoice(text: "Do you have a lamp close to the bed that is easy to reach?", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Is there a clear short path from your bed to the bathroom?", value: 1 as NSCoding & NSCopying & NSObjectProtocol)
            ]
            let bedroomFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: bedroomChoices)
            let bedroomItem = ORKFormItem(identifier: "bedroomItem", text: "Bedroom Questions", answerFormat: bedroomFormat)
            
            let bathroomChoices = [
                ORKTextChoice(text: "Is your tub or shower floor slippery?", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
            ]
            let bathroomFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: bathroomChoices)
            let bathroomItem = ORKFormItem(identifier: "bathroomItem", text: "Bathroom Questions", answerFormat: bedroomFormat)
            
            let environmentStep = ORKFormStep(identifier: "environmentStep", title: "Environment", text: "The following question are about your home environment")
            environmentStep.formItems = [stairsItem, floorsItem, bedroomItem, bathroomItem]
            
            steps += [environmentStep]
            
            // Page 7: CDC
            let CDCChoices = [
                ORKTextChoice(text: "I have fallen in the past year", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I am worried about falling", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Sometimes I feel unsteady when I am walking", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I use or have been advised to use a cane or walker to get around safely", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I need to push with my hands to stand up from a chair", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have some trouble stepping up onto a curb", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I often have to rush to the toilet", value: 5 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I have lost some feeling in my feet", value: 6 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I take medicine that sometiems makes me feel light-hearted or more tired than usual", value: 7 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I take medicine to help me sleep or improve my mood", value: 8 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "I often feel sad or depressed", value: 9 as NSCoding & NSCopying & NSObjectProtocol)
            ]
            let CDCFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: CDCChoices)
            let CDCItem = ORKFormItem(identifier: "CDCItem", text: "CDC Fall Questions", answerFormat: CDCFormat)
            
            let CDCStep = ORKFormStep(identifier: "CDCStep", title: "CDC", text: "The following question regard the CDC Fall Questionairre")
            CDCStep.formItems = [CDCItem]
            
            steps += [CDCStep]
            
            // Page 8: PA Survey
            let sevenScaleChoices = [
                ORKTextChoice(text: "1", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "2", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "3", value: 2 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "4", value: 3 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "5", value: 4 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "6", value: 5 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "7", value: 6 as NSCoding & NSCopying & NSObjectProtocol),
            ]
            let sevenScaleFormat = ORKAnswerFormat.choiceAnswerFormat(with: .multipleChoice, textChoices: sevenScaleChoices)
            let leaveHouseItem = ORKFormItem(identifier: "leaveHouseItem", text: "Over the past week, how many times did you leave your house?", answerFormat: sevenScaleFormat)
            let walkItem = ORKFormItem(identifier: "walkItem", text: "Over the past week, how many times did you walk more than a mile?", answerFormat: sevenScaleFormat)
            let physicalItem = ORKFormItem(identifier: "physicalItem", text: "Over the past week, how many times did you do any physical actvity that raised your heart rate?", answerFormat: sevenScaleFormat)
            
            let PASurveyStep = ORKFormStep(identifier: "PASurveyStep", title: "PA Survey", text: "The following questions regard your physical activity")
            PASurveyStep.formItems = [leaveHouseItem, walkItem, physicalItem]
            
            steps += [PASurveyStep]
            
            /*
            let formItem = ORKFormItem(identifier: "FormItem1", text: "MODERATE ACTIVITIES, such as moving a table, pushing a vacuum cleaner, bowling, or playing golf:", answerFormat: textChoiceAnswerFormat)
            let formItem2 = ORKFormItem(identifier: "FormItem2", text: "Climbing SEVERAL flights of stairs:", answerFormat: textChoiceAnswerFormat)
            let formStep = ORKFormStep(identifier: "FormStep", title: "Daily Activities", text: "The following two questions are about activities you might do during a typical day. Does YOUR HEALTH NOW LIMIT YOU in these activities? If so, how much?")
            formStep.formItems = [formItem, formItem2]
            */
            
            
            /*
            let healthScaleAnswerFormat = ORKAnswerFormat.scale(withMaximumValue: 120, minimumValue: 65, defaultValue: 80, step: 1, vertical: false, maximumValueDescription: "Excellent", minimumValueDescription: "Poor")
            let healthScaleQuestionStep = ORKQuestionStep(identifier: "HealthScaleQuestionStep", title: "Question #1", question: "In general, would you say your health is:", answer: healthScaleAnswerFormat)
            
            steps += [healthScaleQuestionStep]
            
            let textChoices = [
                ORKTextChoice(text: "Yes, Limited A lot", value: 0 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "Yes, Limited A Little", value: 1 as NSCoding & NSCopying & NSObjectProtocol),
                ORKTextChoice(text: "No, Not Limited At All", value: 2 as NSCoding & NSCopying & NSObjectProtocol)
            ]
            let textChoiceAnswerFormat = ORKAnswerFormat.choiceAnswerFormat(with: .singleChoice, textChoices: textChoices)
            let textStep = ORKQuestionStep(identifier: "TextStep", title: "Daily Activities", question: "MODERATE ACTIVITIES, such as moving a table, pushing a vacuum cleaner, bowling, or playing golf:", answer: textChoiceAnswerFormat)
            
            steps += [textStep]
            
            
            let formItem = ORKFormItem(identifier: "FormItem1", text: "MODERATE ACTIVITIES, such as moving a table, pushing a vacuum cleaner, bowling, or playing golf:", answerFormat: textChoiceAnswerFormat)
            let formItem2 = ORKFormItem(identifier: "FormItem2", text: "Climbing SEVERAL flights of stairs:", answerFormat: textChoiceAnswerFormat)
            let formStep = ORKFormStep(identifier: "FormStep", title: "Daily Activities", text: "The following two questions are about activities you might do during a typical day. Does YOUR HEALTH NOW LIMIT YOU in these activities? If so, how much?")
            formStep.formItems = [formItem, formItem2]
            
            steps += [formStep]
            
            let booleanAnswer = ORKBooleanAnswerFormat(yesString: "Yes", noString: "No")
            let booleanQuestionStep = ORKQuestionStep(identifier: "QuestionStep", title: nil, question: "In the past four weeks, did you feel limited in the kind of work that you can accomplish?", answer: booleanAnswer)
            
            steps += [booleanQuestionStep]
             */
            
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

