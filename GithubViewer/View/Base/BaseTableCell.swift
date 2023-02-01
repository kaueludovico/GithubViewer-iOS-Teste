//
//  BaseTableCell.swift
//  GithubViewer
//
//  Created by Kaue Ludovico on 01/02/23.
//

import UIKit

class BaseTableCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        setConstraints()
    }
    
    func setConstraints() {
        // MARK: - Do Nothing
    }
}

