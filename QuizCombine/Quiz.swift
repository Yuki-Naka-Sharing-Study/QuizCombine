//
//  Quiz.swift
//  QuizCombine
//
//  Created by 仲優樹 on 2025/06/26.
//

import Foundation

struct Quiz {
    let question: String
    let choices: [String]
    let correctIndex: Int
}

let sampleQuizzes: [Quiz] = [
    Quiz(question: "日本の首都は？", choices: ["大阪", "京都", "東京", "札幌"], correctIndex: 2),
    Quiz(question: "富士山の高さは？", choices: ["2,776m", "3,776m", "3,276m", "4,276m"], correctIndex: 1),
    Quiz(question: "日本の通貨単位は？", choices: ["ドル", "ウォン", "円", "ユーロ"], correctIndex: 2),
    Quiz(question: "寿司のネタでないのは？", choices: ["マグロ", "カニ", "トマト", "サーモン"], correctIndex: 2),
    Quiz(question: "春に咲く花は？", choices: ["ひまわり", "桜", "コスモス", "梅"], correctIndex: 1)
]
