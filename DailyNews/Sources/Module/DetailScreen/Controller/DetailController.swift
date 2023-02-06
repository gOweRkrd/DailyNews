import UIKit

final class DetailController: UIViewController {
    
    // MARK: - Properties
    
    private let detailView = DetailView()
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
