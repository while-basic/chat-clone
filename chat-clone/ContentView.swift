//
//  ContentView.swift
//  chat-clone
//
//  Created by Christopher Celaya on 12/7/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ChatViewModel()
    @State private var showingSidebar = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.chatBackground.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Chat header
                    HStack {
                        Button(action: { showingSidebar.toggle() }) {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(.textPrimary)
                        }
                        
                        Spacer()
                        
                        Text("ChatGPT")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(.textPrimary)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.textPrimary)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    
                    Divider()
                        .background(Color.textSecondary.opacity(0.3))
                    
                    ScrollView {
                        VStack(spacing: 24) {
                            if viewModel.messages.isEmpty {
                                // Welcome suggestions
                                VStack(spacing: 20) {
                                    Text("Not much! What can I help you with today?")
                                        .font(.system(size: 16))
                                        .foregroundColor(.textPrimary)
                                        .padding(.top, 24)
                                    
                                    VStack(spacing: 8) {
                                        SuggestionButton(
                                            title: "Create an image",
                                            subtitle: "for my presentation"
                                        )
                                        SuggestionButton(
                                            title: "Find the decade",
                                            subtitle: "that a photo is from"
                                        )
                                        SuggestionButton(
                                            title: "Give me ideas",
                                            subtitle: "for what to do with..."
                                        )
                                    }
                                    .padding(.horizontal, 16)
                                }
                            }
                            
                            ForEach(viewModel.messages) { message in
                                MessageBubbleView(message: message)
                            }
                        }
                        .padding(.vertical, 16)
                    }
                    
                    // Message input
                    VStack(spacing: 0) {
                        Divider()
                            .background(Color.textSecondary.opacity(0.3))
                        
                        HStack(spacing: 12) {
                            Button(action: {}) {
                                Image(systemName: "plus")
                                    .foregroundColor(.textPrimary)
                                    .frame(width: 32, height: 32)
                            }
                            
                            TextField("Message", text: $viewModel.inputMessage)
                                .textFieldStyle(PlainTextFieldStyle())
                                .font(.system(size: 16))
                                .foregroundColor(.textPrimary)
                                .padding(.vertical, 8)
                            
                            HStack(spacing: 12) {
                                Button(action: {}) {
                                    Image(systemName: "mic.fill")
                                        .foregroundColor(.textPrimary)
                                }
                                
                                Button(action: {}) {
                                    Image(systemName: "waveform")
                                        .foregroundColor(.textPrimary)
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(Color.messageInputBackground)
                    }
                }
            }
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
