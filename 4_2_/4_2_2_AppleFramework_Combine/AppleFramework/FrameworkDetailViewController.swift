//
//  FrameworkDetailViewController.swift
//  AppleFramework
//
//  Created by joonwon lee on 2022/05/01.
//

import UIKit
import SafariServices
import Combine

class FrameworkDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let buttonTapped = PassthroughSubject<AppleFramework, Never>()
    var subscriptions = Set<AnyCancellable>()
//    @Published var framework: AppleFramework = AppleFramework(name: "Unknown", imageName: "", urlString: "", description: "")
    let framework = CurrentValueSubject<AppleFramework, Never>(AppleFramework(name: "unknown", imageName: "", urlString: "", description: ""))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        // TODO: - Input : Button click
        buttonTapped
            .receive(on: RunLoop.main)
            .compactMap { URL(string: $0.urlString) }
            .sink { [unowned self] url in
                let safari = SFSafariViewController(url: url)
                self.present(safari, animated: true)
            }.store(in: &subscriptions)
        
        // TODO: Output : Data settings, UI update
        framework
            .receive(on: RunLoop.main)
            .sink { [unowned self] framework in
                self.imageView.image = UIImage(named: framework.imageName)
                self.titleLabel.text = framework.name
                self.descriptionLabel.text = framework.description
            }.store(in: &subscriptions)
    }
    
    @IBAction func learnMoreTapped(_ sender: Any) {
        
        buttonTapped.send(framework.value)
    }
}
