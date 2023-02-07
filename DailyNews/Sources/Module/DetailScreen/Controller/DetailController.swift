import UIKit
import WebKit

final class DetailController: UIViewController {
    
    // MARK: - Properties
    
    private let detailView = DetailView()
    private var newsList = [Article]()
    
    private lazy var webView: WKWebView = {
        let view = WKWebView()
        view.load(NSURLRequest(url: NSURL(string:(data?.url!)!)! as URL) as URLRequest)
        return view
    }()
    
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
            NetworkManager.shared.downloadImage(from: imageURL) { image in
                DispatchQueue.main.async { [self] in
                    detailView.detailImageView.image = image
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
        
        detailView.urlButton.addTarget(self, action: #selector(openWeb), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc
    private func openWeb() {
            view = webView
        }
    }

