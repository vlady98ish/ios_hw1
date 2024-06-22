import SwiftUI

@main
struct PlayingCardApp: App {
    @State var currentScreen = CurrentScreen.InitializationScreen
    @State var playerScore = 0
    @State var pcScore = 0
    
    enum CurrentScreen {
        case InitializationScreen
        case Playing
        case Score
    }
    var body: some Scene {
        WindowGroup {
            
            switch currentScreen {
            case .InitializationScreen:
                InitializationView(displayingCurApp: $currentScreen)
            case .Playing:
                PlayingView(displayingCurApp: $currentScreen, playerScore: $playerScore, pcScore: $pcScore)
                    .onAppear {
                    // Reset scores to zero when entering PlayingView
                    playerScore = 0
                    pcScore = 0
                }
            case .Score:
                ScoreView(displayingCurApp: $currentScreen, playerScore: $playerScore, pcScore: $pcScore)
                
            }
            
           
        }
    }
}
