//
//  GameManager.swift
//  Atleta
//
//  Created by Michael Aronian Aronian on 6/25/24.
//
import GameKit
import SwiftUI

class GameCenterManager: NSObject, ObservableObject {
    static let shared = GameCenterManager()
    
    @Published var isAuthenticated = false
    @Published var isLoading = false
    @Published var match: GKMatch?
    @Published var matchError: String?
    
    func authenticateUser() {
        self.isLoading = true
        let localPlayer = GKLocalPlayer.local
        
        localPlayer.authenticateHandler = { [weak self] viewController, error in
            self?.isLoading = false
            
            if let error = error {
                print("Game Center authentication error: \(error.localizedDescription)")
                return
            }
            
            if let viewController = viewController {
                self?.presentGameCenterLogin(viewController)
            } else if localPlayer.isAuthenticated {
                self?.isAuthenticated = true
                print("Game Center: User is authenticated")
            } else {
                print("Game Center: User is not authenticated and no error occurred")
                self?.isAuthenticated = false
            }
        }
    }
    
    private func presentGameCenterLogin(_ viewController: UIViewController) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            print("Game Center: No window scene found")
            return
        }
        
        guard let rootViewController = windowScene.windows.first?.rootViewController else {
            print("Game Center: No root view controller found")
            return
        }
        
        DispatchQueue.main.async {
            rootViewController.present(viewController, animated: true, completion: nil)
        }
    }
    
    func startMatchmaking() {
        let request = GKMatchRequest()
        request.minPlayers = 2
        request.maxPlayers = 2
        request.inviteMessage = "Join my game!"
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first,
              let rootViewController = window.rootViewController else {
            print("Game Center: No root view controller found")
            return
        }
        
        let matchmakerViewController = GKMatchmakerViewController(matchRequest: request)
        matchmakerViewController?.matchmakerDelegate = self
        rootViewController.present(matchmakerViewController!, animated: true, completion: nil)
    }

    
}


extension GameCenterManager: GKMatchmakerViewControllerDelegate {
    func matchmakerViewControllerWasCancelled(_ viewController: GKMatchmakerViewController) {
        viewController.dismiss(animated: true, completion: nil)
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFailWithError error: Error) {
        viewController.dismiss(animated: true, completion: nil)
        self.matchError = error.localizedDescription
    }
    
    func matchmakerViewController(_ viewController: GKMatchmakerViewController, didFind match: GKMatch) {
        viewController.dismiss(animated: true, completion: nil)
        self.match = match
    }
}
