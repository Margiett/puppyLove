//
//  APIClient.swift
//  puppyLove
//
//  Created by Margiett Gil on 12/31/19.
//  Copyright © 2019 Margiett Gil. All rights reserved.
//

import Foundation
struct APIClient {
    
    static func postAPI (postPuppyLove: PuppyLove,
                            completion: @escaping (Result<Bool, AppError>) -> ()) {
        // remember to change the url
        let puppyLoveEndpointURL = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        
        //MARK: Create a URL from the endpoint String
        guard let url = URL(string: puppyLoveEndpointURL) else {
            completion(.failure(.badURL(puppyLoveEndpointURL)))
            return
        }
        //MARK: converting to data
        do {
            let data = try JSONEncoder().encode(postPuppyLove)
            
            //MARK: Confirgure out URLRequest
           // type of url
            var request = URLRequest(url: url)
            
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
            request.httpMethod = "POST"
            
            //MARK: Execute POST request
            // either our completion captures Data or AppError
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
    
    static func getPuppyLove(for faves: [PuppyLove],
                         completion: @escaping(Result <[PuppyLove], AppError>) -> ()) {
        // remember to change the url
        let idEndpointUrl = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/elements"
        
        guard let url = URL(string: idEndpointUrl) else {
            completion(.failure(.badURL(idEndpointUrl)))
            
            return
        }
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let puppyLoveAPI = try JSONDecoder().decode([PuppyLove].self, from: data)
                    completion(.success(puppyLoveAPI))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    static func postFave(favoritePuppyLovePost: PuppyLove,
                             completion: @escaping (Result<Bool, AppError>) -> ()){
        //Remember to change the url !!!!
        let puppyLoveEndpointURL = "https://5c1d79abbc26950013fbcaa9.mockapi.io/api/v1/favorites"
        
        guard let url = URL(string: puppyLoveEndpointURL) else {
            completion(.failure(.badURL(puppyLoveEndpointURL)))
            return
        }
        do {
            let data = try JSONEncoder().encode(favoritePuppyLovePost)
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
            completion(.failure(.decodingError(error)))
        }
        }
}


