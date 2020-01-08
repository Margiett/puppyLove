//
//  CreateQuestionController.swift
//  puppyLove
//
//  Created by Margiett Gil on 1/8/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit

class CreateQuestionController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var topicPickerView: UIPickerView!
    
     private var topic = ["Play Date", "Friendly meet & Greet", "Possiable mating", "Doggy Party", "Training Together", "Health"].sorted()
    
    //MARK: labName will be the current selected row in the picker view
        private var topicName: String?
        override func viewDidLoad() {
            super.viewDidLoad()
            
            //configure the picker view
            topicPickerView.dataSource = self
            topicPickerView.delegate = self
            
            //MARK: Variable to track the current selected lab in the picker view
            topicName = topic.first // default lab is the first row in the picker view
            
        }
        
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            questionTextView.layer.borderColor = UIColor.systemPink.cgColor
            questionTextView.layer.borderWidth = 2
            questionTextView.layer.shadowColor = UIColor.systemGray.cgColor
            questionTextView.layer.shadowOpacity = 0.9
            questionTextView.layer.shadowOffset = CGSize(width: -30, height: 19)
            questionTextView.layer.shadowRadius = 10
            
          
        }
        
        @IBAction func cancel(_ sender: UIBarButtonItem) {
            dismiss(animated: true)
        }
        
        @IBAction func createQuestion(_ sender: UIBarButtonItem){
            // 3 required paramerters to create a PostedQuestion
            guard let questionTitle = titleTextField.text,
                !questionTitle.isEmpty,
                let name = topicName,
                let topicDescription = questionTextView.text,
                !topicDescription.isEmpty else {
                    showAlert(title: "Missing Fields", message: "Title, Description are required")
                    
                    return
            }
            let question = PostedQuestion(title: questionTitle, topicName: name, description: topicDescription, createdAt: String.getISOTimestamp())
            
            //TODO: POST
            QuestionsAPICLIENT.postQuestion(question: question) { [weak self] (result) in
                switch result {
                case .failure(let appError):
                    DispatchQueue.main.async {
                        self?.showAlert(title: "Error posting question", message: "\(appError)")
                    }
                case .success:
                    DispatchQueue.main.async {
                        self?.showAlert(title: "success", message: "\(questionTitle) was posted")
                        
                    }
                    
                }
                
            }
            
        }
    }


    // https://developer.apple.com/documentation/uikit/uipickerview
    extension CreateQuestionController: UIPickerViewDataSource {
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return topic.count
        }
        
    }

    extension CreateQuestionController: UIPickerViewDelegate {
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return topic[row]
        }
    }
    
