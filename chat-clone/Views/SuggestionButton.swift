import SwiftUI

struct SuggestionButton: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        Button(action: {}) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 15, weight: .medium))
                Text(subtitle)
                    .font(.system(size: 13))
                    .foregroundColor(.textSecondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color.suggestionBackground)
            .cornerRadius(12)
        }
        .foregroundColor(.textPrimary)
    }
} 