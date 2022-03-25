//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
   
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    var answersChosen: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateResult()
    }
    
    private func calculateResult() {
        var frequencyOfAnswers: [Animal: Int] = [:]
        guard let responseTypes = answersChosen else { return }
        
        for response in responseTypes {
            frequencyOfAnswers[response.animal] = (frequencyOfAnswers[response.animal] ?? 0) + 1
        }
        
        let frequentAnswerSorted = frequencyOfAnswers.sorted{ (pairOne, pairTwo) -> Bool in
            return pairOne.value > pairTwo.value }
        
        guard let mostCommonAnswer = frequentAnswerSorted.first?.key else { return }
        
        resultAnswerLabel.text = "Вы - \(mostCommonAnswer.rawValue)"
        resultDefinitionLabel.text = mostCommonAnswer.definition
        
        }
}
