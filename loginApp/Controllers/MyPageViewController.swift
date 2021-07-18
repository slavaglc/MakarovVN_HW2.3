import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTV: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = User.getAdminUser().name
        descriptionTV.text = User.getAdminUser().description
    }
}
