//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Вячеслав Турчак on 29.05.2022.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    var answersChosen: [Answer] = []
    var result: Animal {
        getResult(with: answersChosen)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "Вы - \(result.rawValue)"
        descriptionLabel.text = "\(result.definition)"
        
        navigationItem.setHidesBackButton(true, animated: true)
    }

    private func getResult(with answers: [Answer]) -> Animal {
        var dogCount = 0
        var catCount = 0
        var rabbitCount = 0
        var turtleCount = 0
        
        var result = Animal.dog
        
        for answer in answers {
            if answer.animal == .dog {
                dogCount += 1
            }
            if answer.animal == .cat {
                catCount += 1
            }
            if answer.animal == .rabbit {
                rabbitCount += 1
            }
            if answer.animal == .turtle {
                turtleCount += 1
            }
        }
        
        if dogCount > catCount && dogCount > rabbitCount && dogCount > turtleCount {
            result = Animal.dog
        } else if catCount > dogCount && catCount > rabbitCount && catCount > turtleCount {
            result = Animal.cat
        } else if rabbitCount > dogCount && rabbitCount > catCount && rabbitCount > turtleCount {
            result = Animal.rabbit
        } else if turtleCount > dogCount && turtleCount > catCount && turtleCount > rabbitCount {
            result = Animal.turtle
        } else {
            if let animal = answers.first?.animal {
                result = animal
            }
        }
        
        return result
    }
    
}
