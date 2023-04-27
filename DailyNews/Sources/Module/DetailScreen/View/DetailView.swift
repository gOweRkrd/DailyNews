import UIKit

final class DetailView: UIView {
    
    // MARK: - UI Elements
    
    lazy var detailTitleLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: .systemFontTwentyTwo, weight: .semibold)
        return label
    }()
    
    lazy var detailImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "noPhoto")
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var detailSubTitleLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 4
        label.font = .systemFont(ofSize: .systemFontSeventeen, weight: .semibold)
        return label
    }()
    
    lazy var dateOfpublicationLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: .systemFontSeventeen, weight: .regular)
        return label
    }()
    
    lazy var authorLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: .systemFontSeventeen, weight: .regular)
        return label
    }()
    
    lazy var urlLabel: UILabel = {
        
        let label = UILabel()
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: .systemFontSeventeen, weight: .regular)
        return label
    }()
    
    lazy var urlButton: UIButton = {
        
        let button = UIButton()
        button.setTitle(R.DetailView.urlButton, for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Color.mainBackgroundWhite
        
        addSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Setup Constrains

extension DetailView {
    
    func addSubView() {
        
        self.addSubviews(
            [
                detailTitleLabel, detailImageView, detailSubTitleLabel,
                dateOfpublicationLabel, authorLabel, urlButton
            ]
        )
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            detailTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: .detailTitleLabelTopAnchor),
            detailTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .twentySizeAnchor),
            detailTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -.twentySizeAnchor),
            
            detailImageView.topAnchor.constraint(
                equalTo: detailTitleLabel.bottomAnchor,
                constant: .detailImageViewTopAnchor
            ),
            detailImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            detailImageView.widthAnchor.constraint(equalToConstant: .detailImageViewWidthAnchor),
            detailImageView.heightAnchor.constraint(equalToConstant: .detailImageViewAnchor),
            
            authorLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: .twentySizeAnchor),
            authorLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .twentySizeAnchor),
            authorLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -.twentySizeAnchor),
            
            dateOfpublicationLabel.topAnchor.constraint(
                equalTo: authorLabel.bottomAnchor,
                constant: .dateOfpublicationLabelTopAnchor
            ),
            dateOfpublicationLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .twentySizeAnchor),
            dateOfpublicationLabel.trailingAnchor.constraint(
                equalTo: self.trailingAnchor,
                constant: -.twentySizeAnchor
            ),
            
            detailSubTitleLabel.topAnchor.constraint(
                equalTo: dateOfpublicationLabel.bottomAnchor,
                constant: .detailSubTitleLabelTopAnchor
            ),
            detailSubTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .twentySizeAnchor),
            detailSubTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -.twentySizeAnchor),
            
            urlButton.topAnchor.constraint(equalTo: detailSubTitleLabel.bottomAnchor, constant: .twentySizeAnchor),
            urlButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: .twentySizeAnchor),
            urlButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -.twentySizeAnchor)
            
        ])
    }
}

// MARK: - Constant

private extension CGFloat {
    static let detailTitleLabelTopAnchor: CGFloat = 100
    static let twentySizeAnchor: CGFloat = 20
    static let dateOfpublicationLabelTopAnchor: CGFloat = 10
    static let detailImageViewWidthAnchor: CGFloat = 350
    static let detailImageViewAnchor: CGFloat = 200
    static let detailImageViewTopAnchor: CGFloat = 25
    static let detailSubTitleLabelTopAnchor: CGFloat = 25
    static let systemFontSeventeen: CGFloat = 17
    static let systemFontTwentyTwo: CGFloat = 22
}
