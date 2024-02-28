//
//  CustomTableViewCell.swift
//  ExpandableTableView
//
//  Created by Roderick Presswood on 2/26/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let cellIdentifier = String(describing: CustomTableViewCell.self)

    var titleLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        setup()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String? = cellIdentifier) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(with text: String) {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        addSubview(titleLabel)
        titleLabel.text = text
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
}

//class CustomTableViewCell: UITableViewCell {
//    
//    static let cellIdentifier = String(describing: CustomTableViewCell.self)
//    
//    var titleTextLabel: UILabel = {
//        let label = UILabel()
//        return label
//    }()
//    
//    var textView: UITextView = {
//        let textView = UITextView()
//        return textView
//    }()
//    
//    var stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        return stackView
//    }()
//    
//    init(titleText: String, subText: String) {
//        super.init(style: .default, reuseIdentifier: reuseIdentifier)
//    }
//    
//    func setup(titleText: String, subText: String) {
//        
//        stackView.addArrangedSubview(titleTextLabel)
//        stackView.addArrangedSubview(textView)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override class func awakeFromNib() {
//        super.awakeFromNib()
//        
//            // Initialization Code
//    }
//    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        // Configure the view for the selected state
//    }
//}
