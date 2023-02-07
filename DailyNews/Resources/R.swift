import UIKit

enum NetworkResources {
    static let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=d05f1b12009d457a877881f7cbde2e84"
}

enum StringResources {
    
    // MARK: - String
    
    enum NewsTableViewCell {
        static let identifier = "NewsTableViewCell"
    }
    
    enum NewsView {
        static let refreshControl = "Pull to refresh"
    }
    
    enum NewsController {
        static let title = "Daily News"
        static let subtitle = "No Description"
    }
    
    enum DetailView {
        static let urlButton = "Full version news"
    }
    
    enum DetailController {
        static let detailSubTitleLabel = "No description"
        static let dateOfpublicationLabel = "Publication date unknown"
        static let authorLabel = "The author is unknown"
    }
}

enum ColorResources {
    static let mainBackgroundWhite = UIColor(hexString: "#FFFFFF")
}

typealias Network = NetworkResources
typealias R = StringResources
typealias Color = ColorResources
