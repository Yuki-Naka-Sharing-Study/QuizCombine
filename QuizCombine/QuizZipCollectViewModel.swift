//
//  QuizZipCollectViewModel.swift
//  QuizCombine
//
//  Created by 仲優樹 on 2025/06/26.
//

import Foundation
import Combine

import Foundation
import Combine

class QuizZipCollectViewModel: ObservableObject {
    @Published var currentQuiz: Quiz?
    @Published var currentIndex: Int = 0
    @Published var score: Int?
    
    private let answerSubject = PassthroughSubject<Int, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        startGame()
    }
    
    func startGame() {
        score = nil
        currentIndex = 0
        currentQuiz = sampleQuizzes[currentIndex]
        
        sampleQuizzes.publisher
            .zip(answerSubject)
            .map { quiz, answerIndex in
                answerIndex == quiz.correctIndex
            }
            .collect(5)
            .sink(receiveValue: { [weak self] results in
                self?.score = results.filter { $0 }.count
            })
            .store(in: &cancellables)
    }
    
    func answer(index: Int) {
        answerSubject.send(index)
        currentIndex += 1
        if currentIndex < sampleQuizzes.count {
            currentQuiz = sampleQuizzes[currentIndex]
        } else {
            currentQuiz = nil
        }
    }
}
