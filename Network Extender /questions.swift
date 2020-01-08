//
//  questions.swift
//  puppyLove
//
//  Created by Margiett Gil on 1/8/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import Foundation

struct QuestionsAPICLIENT {
    
static func fetchQuestions(completion: @escaping (Result<[Question], AppError>) -> ()) {
    
    let endpointURLString = "http://5e0299e863d08b0014a289a4.mockapi.io/question"
    
    guard let url = URL(string: endpointURLString) else {
        completion(.failure(.badURL(endpointURLString)))
        return
    }
    
    let request = URLRequest(url: url)
    
    
    NetworkHelper.shared.performDataTask(with: request) { (result) in
        switch result {
        case .failure(let appError):
            completion(.failure(.networkClientError(appError)))
        case .success(let data):
            //construct our [Questions] array
            do {
                let questions = try JSONDecoder().decode([Question].self, from: data)
                completion(.success(questions))
            }catch {
                completion(.failure(.decodingError(error)))
            }
        }
        
    }
}
static func postQuestion(question: PostedQuestion, completion: @escaping (Result<Bool,AppError>) -> ()) {
    
    let endpointURLString = "http://5e0299e863d08b0014a289a4.mockapi.io/question"
    
    guard let url = URL(string: endpointURLString) else { completion(.failure(.badURL(endpointURLString)))
    return
    }

    do {
        let data = try JSONEncoder().encode(question)

        var request = URLRequest(url: url)
     
        request.httpMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
      
        request.httpBody = data

        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success:
                completion(.success(true))
            }
        }
        
    } catch {
        completion(.failure(.encodingError(error)))
        
    }
}

static func postAnswer(postedAnswer: PostedAnswer, completion: @escaping (Result<Bool,AppError>) ->()) {
    let answerEndpointURLString = "http://5e0299e863d08b0014a289a4.mockapi.io/answers"
    
    guard let url = URL(string: answerEndpointURLString) else {
        return
    }
    
    do {
        let data = try JSONEncoder().encode(postedAnswer)
        
       
        var request = URLRequest(url: url)
        
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
      
        request.httpBody = data
        
        
        request.httpMethod = "POST"
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success:
                completion(.success(true))
                
            }
        }
        
    } catch {
        completion(.failure(.encodingError(error)))
        
    }
    
}

static func fetchAnswers(completion: @escaping (Result<[Answer], AppError>) -> ()) {
        //
        let answersURLString = "http://5e0299e863d08b0014a289a4.mockapi.io/answers"
        
        guard let url = URL(string: answersURLString) else  {
            completion(.failure(.badURL(answersURLString)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) {
        
            (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do{
                    let answers = try JSONDecoder().decode([Answer].self, from: data)
                    completion(.success(answers))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
    
}

