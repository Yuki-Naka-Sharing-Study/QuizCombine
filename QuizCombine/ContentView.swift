//
//  ContentView.swift
//  QuizCombine
//
//  Created by 仲優樹 on 2025/06/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = QuizZipCollectViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            if let score = viewModel.score {
                Text("🎉 終了！あなたのスコア: \(score)/5")
                    .font(.title2)
                    .bold()
                
                Button("もう一度プレイ") {
                    viewModel.startGame()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            } else if let quiz = viewModel.currentQuiz {
                Text("問題 \(viewModel.currentIndex + 1) / 5")
                    .font(.headline)
                Text(quiz.question)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                
                ForEach(0..<quiz.choices.count, id: \.self) { i in
                    Button(quiz.choices[i]) {
                        viewModel.answer(index: i)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                }
            } else {
                Text("読み込み中...")
            }
            Spacer()
        }
        .padding()
    }
}
