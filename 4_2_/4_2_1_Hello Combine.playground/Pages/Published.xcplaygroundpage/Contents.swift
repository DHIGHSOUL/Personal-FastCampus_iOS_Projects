//: [Previous](@previous)

/* iOS 앱을 개발할 때 자주 사용하는 방법
 
 ViewModel을 업데이트할 때 Label name 역시 업데이트해야 하기 때문에, 데이터를 publisher로 만들어
 값이 바뀔 때마다 UILabel이 업데이트될 수 있다.
 
*/

import Foundation
import UIKit
import Combine

final class SomeViewModel {
    @Published var name: String = "Jack"
    var age: Int = 25
}

final class Label {
    var text: String = ""
}

let label = Label()
let viewModel = SomeViewModel()
print("Text: \(label.text)")

viewModel.$name.assign(to: \.text, on: label)
print("Changed text: \(label.text)")

viewModel.name = "Jason"
print("Changed text: \(label.text)")

viewModel.name = "Jang"
print("Changed text: \(label.text)")

viewModel.age = 25

//: [Next](@next)
