//: [Previous](@previous)

import Foundation
import Combine
import UIKit

// URLSessionTask Publisher and JSON Decoding Operator
struct SomeDecodable: Decodable { }

URLSession.shared.dataTaskPublisher(for: URL(string: "https://developer.apple.com")!).map { data, response in
    return data
}.decode(type: SomeDecodable.self, decoder: JSONDecoder())

// Notifications
let center = NotificationCenter.default
let noti = Notification.Name("MyNoti!")
let notiPublisher = center.publisher(for: noti, object: nil)
let subscription = notiPublisher.sink { _ in
    print("Noti received")
}

center.post(name: noti, object: nil)
subscription.cancel()

// KeyPath binding to NSObject instances
// NSObject 중 하나인 UILabel()에 publisher-subscriber를 통해 값을 전달할 수 있다(KeyPath)
let ageLabel = UILabel()
print("Text: \(ageLabel.text)")
Just(20).map { "Age is \($0)" }.assign(to: \.text, on: ageLabel)
print("Changed text: \(ageLabel.text)")

// Timer
// autoconnect 를 이용하면 subscribe 되면 바로 시작함
// 해당 컴포넌트는 이전에 개발했던 'KNIH_Health24' 앱의 타이머로 작동되었으면 좋았을 것 같음
let timerPublisher = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

let timerSubscription = timerPublisher.sink { time in
    print("time: \(time)")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    timerSubscription.cancel()
}

//: [Next](@next)
