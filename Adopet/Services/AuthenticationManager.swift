//
//  AuthenticationManager.swift
//  Adopet
//
//  Created by Giovanna Moeller on 19/03/24.
//

import Foundation

enum AuthenticationError: Error {
    case loginFailed(String)
}

protocol AuthenticationProvider {
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, AuthenticationError>) -> Void)
}

class GoogleAuthenticationProvider: AuthenticationProvider {
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, AuthenticationError>) -> Void) {
        print("Login com o google")
        completion(.success(true))
    }
}

class FacebookAuthenticationProvider: AuthenticationProvider {
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, AuthenticationError>) -> Void) {
        print("Login com o facebook")
        completion(.success(true))
    }
}

class AuthenticationManager {
    func signIn(email: String, password: String, completion: @escaping (Result<Bool, AuthenticationError>) -> Void) {
        // Valores mockados para propósitos de ensino
        let mockEmail = "johndoe@gmail.com"
        let mockPassword = "123"
        
        DispatchQueue.main.async {
            if email == mockEmail && password == mockPassword {
                completion(.success(true))
            } else {
                completion(.failure(.loginFailed("Usuário ou senha incorretos.")))
            }
        }
    }
}
