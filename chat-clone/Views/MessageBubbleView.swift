import SwiftUI

struct MessageBubbleView: View {
    let message: ChatMessage
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            if !message.isUser {
                Image("chatgpt-icon")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .cornerRadius(4)
            }
            
            Text(message.content)
                .font(.system(size: 16))
                .foregroundColor(.textPrimary)
                .padding(.trailing, message.isUser ? 12 : 24)
            
            if message.isUser {
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
} 