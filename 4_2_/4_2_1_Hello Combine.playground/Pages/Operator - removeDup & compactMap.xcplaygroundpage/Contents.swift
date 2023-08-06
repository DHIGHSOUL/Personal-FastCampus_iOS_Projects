//: [Previous](@previous)

import Foundation
import Combine

// removeDuplicates -> 중복 데이터를 제거함
var subscriptions = Set<AnyCancellable>()

let words = "hey hey there! Mr Mr ?"
    .components(separatedBy: " ")
    .publisher

words
    .removeDuplicates()
    .sink { value in
        print(value)
    }.store(in: &subscriptions)

// compactMap -> 내용 전환 시 nil이면 제거함
let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher

strings
    .compactMap { Float($0) }
    .sink { value in
        print(value)
    }.store(in: &subscriptions)

// ignoreOutput -> 새로 들어오는 이벤트 데이터에 대해 ignore(무시)함
let numbers = [1...10_000].publisher

numbers
    .ignoreOutput()
    .sink(receiveCompletion: { print("IgnoreOutput completed with: \($0)") }, receiveValue: { print($0) })
    .store(in: &subscriptions)

// prefix -> 갯수를 제한하여 입력받음
let tens = (1...10).publisher

tens
    .prefix(5)
    .sink(receiveCompletion: { print("Prefix completed with: \($0)") }, receiveValue: { print($0) } )
    .store(in: &subscriptions)

//: [Next](@next)
