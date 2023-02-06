import UIKit

final class DetailController: UIViewController {
    
    // MARK: - Properties
    
    private let detailView = DetailView()
    private var newsList = [Article]()
    
    var data: Article? {
        didSet {
            guard let data = data else { return }

            detailView.detailTitleLabel.text = data.title
            detailView.detailSubTitleLabel.text = data.description
            detailView.dateOfpublicationLabel.text = data.publishedAt
            detailView.autorLabel.text = data.author
            detailView.urlLabel.text = data.url

            guard let imageURL = data.urlToImage else {
                return
            }
            detailView.activityIndicator.startAnimating()

            NetworkManager.shared.downloadImage(from: imageURL) { image in
                DispatchQueue.main.async { [self] in
                    detailView.detailImageView.image = image
            detailView.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
