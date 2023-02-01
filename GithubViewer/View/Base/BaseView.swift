//
//  BaseView.swift
//  GithubViewer
//
//  Created by Kaue Ludovico on 01/02/23.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubview() {
        // MARK: - Do Nothing
    }
    
    func setConstraints() {
        // MARK: - Do Nothing
    }
}
