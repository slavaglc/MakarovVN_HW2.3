import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.usernameTF.delegate = self
        self.passwordTF.delegate = self
        passwordTF.enablesReturnKeyAutomatically = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarVC = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarVC.viewControllers else { return }
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController{
                welcomeVC.user = User.getAdminUser()
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    
    @IBAction func loginTapped() {
        if usernameTF.text == "" || passwordTF.text == "" {
            showMessage(title: "Error", message: "Please, type username and password")
        } else if usernameTF.text == User.getAdminUser().name && passwordTF.text == User.getAdminUser().password {
            performSegue(withIdentifier: "loginSegue", sender: nil)
        } else {
            showMessage(title: "Error", message: "Your username or password is incorrect")
        }
    }
    
    @IBAction func forgotTapped(_ sender: UIButton) {
        if sender.tag == 0 {
            showMessage(title: "Username", message: "Your username is: \(User.getAdminUser().name)")
        } else if sender.tag == 1 {
            showMessage(title: "Password", message: "Your password is: \(User.getAdminUser().password)")
        }
    }
    
    private func showMessage(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 0:
            passwordTF.becomeFirstResponder()
        case 1:
            loginTapped()
        default:
            break
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if passwordTF.text != "" || passwordTF.text != nil {
            passwordTF.enablesReturnKeyAutomatically = true
        }
    }

}

