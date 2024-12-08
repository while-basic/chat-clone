import Foundation
import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var messages: [ChatMessage] = []
    @Published var inputMessage: String = ""
    
    func sendMessage() {
        guard !inputMessage.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        
        // Add user message
        let userMessage = ChatMessage(content: inputMessage, isUser: true, timestamp: Date())
        messages.append(userMessage)
        
        // Simulate AI response
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let aiMessage = ChatMessage(
                content: "Not much! What can I help you with today?",
                isUser: false,
                timestamp: Date()
            )
            self.messages.append(aiMessage)
        }
        
        inputMessage = ""
    }
} 