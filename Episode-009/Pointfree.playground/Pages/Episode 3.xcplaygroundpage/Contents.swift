import UIKit

//UIButton.appearance().contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
//UIButton.appearance().titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)

class BaseButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    self.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class RoundedButton: BaseButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.clipsToBounds = true
    self.layer.cornerRadius = 6
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

class FilledButton: RoundedButton {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .black
    self.tintColor = .white
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

final class SignInViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()

    self.view.backgroundColor = .white

    let gradientView = GradientView()
    gradientView.fromColor = UIColor(red: 0.5, green: 0.85, blue: 1, alpha: 0.85)
    gradientView.toColor = .white
    gradientView.translatesAutoresizingMaskIntoConstraints = false

    let logoImageView = UIImageView(image: UIImage(named: "logo"))
    logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor, multiplier: logoImageView.frame.width / logoImageView.frame.height).isActive = true

    let gitHubButton = FilledButton()
//    gitHubButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
//    gitHubButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    gitHubButton.clipsToBounds = true
    gitHubButton.layer.cornerRadius = 6
    gitHubButton.backgroundColor = .black
    gitHubButton.tintColor = .white
    gitHubButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
    gitHubButton.setImage(UIImage(named: "github"), for: .normal)
    gitHubButton.setTitle("Sign in with GitHub", for: .normal)

    let orLabel = UILabel()
    orLabel.font = .systemFont(ofSize: 14, weight: .medium)
    orLabel.textAlignment = .center
    orLabel.textColor = UIColor(white: 0.625, alpha: 1)
    orLabel.text = "or"

    let emailField = UITextField()
    emailField.clipsToBounds = true
    emailField.layer.cornerRadius = 6
    emailField.layer.borderColor = UIColor(white: 0.75, alpha: 1).cgColor
    emailField.layer.borderWidth = 1
    emailField.borderStyle = .roundedRect
    emailField.heightAnchor.constraint(equalToConstant: 44).isActive = true
    emailField.keyboardType = .emailAddress
    emailField.placeholder = "blob@pointfree.co"

    let passwordField = UITextField()
    passwordField.clipsToBounds = true
    passwordField.layer.cornerRadius = 6
    passwordField.layer.borderColor = UIColor(white: 0.75, alpha: 1).cgColor
    passwordField.layer.borderWidth = 1
    passwordField.borderStyle = .roundedRect
    passwordField.heightAnchor.constraint(equalToConstant: 44).isActive = true
    passwordField.isSecureTextEntry = true
    passwordField.placeholder = "••••••••••••••••"

    let signInButton = BaseButton()
//    signInButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
//    signInButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    signInButton.clipsToBounds = true
    signInButton.layer.cornerRadius = 6
    signInButton.layer.borderColor = UIColor.black.cgColor
    signInButton.layer.borderWidth = 2
    signInButton.setTitleColor(.black, for: .normal)
    signInButton.setTitle("Sign in", for: .normal)

    let forgotPasswordButton = UIButton(type: .system)
    forgotPasswordButton.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    forgotPasswordButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    forgotPasswordButton.setTitleColor(.black, for: .normal)
    forgotPasswordButton.setTitle("I forgot my password", for: .normal)

    let legalLabel = UILabel()
    legalLabel.font = .systemFont(ofSize: 11, weight: .light)
    legalLabel.numberOfLines = 0
    legalLabel.textAlignment = .center
    legalLabel.textColor = UIColor(white: 0.5, alpha: 1)
    legalLabel.text = "By signing into Point-Free you agree to our latest terms of use and privacy policy."

    let rootStackView = UIStackView(arrangedSubviews: [
      logoImageView,
      gitHubButton,
      orLabel,
      emailField,
      passwordField,
      signInButton,
      forgotPasswordButton,
      legalLabel,
      ])

    rootStackView.axis = .vertical
    rootStackView.isLayoutMarginsRelativeArrangement = true
    rootStackView.layoutMargins = UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)
    rootStackView.spacing = 16
    rootStackView.translatesAutoresizingMaskIntoConstraints = false

    self.view.addSubview(gradientView)
    self.view.addSubview(rootStackView)

    NSLayoutConstraint.activate([
      gradientView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      gradientView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      gradientView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      gradientView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor),

      rootStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      rootStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
      rootStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
      ])
  }
}

import PlaygroundSupport
PlaygroundPage.current.liveView = SignInViewController()
