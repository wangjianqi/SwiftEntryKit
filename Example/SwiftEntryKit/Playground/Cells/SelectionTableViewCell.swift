//
//  SelectionTableViewCell.swift
//  SwiftEntryKit_Example
//
//  Created by Daniel Huri on 4/23/18.
//  Copyright (c) 2018 huri000@gmail.com. All rights reserved.
//

import UIKit
import SwiftEntryKit

///baseCell
class SelectionBaseCell: UITableViewCell {
    func configure(attributesWrapper: EntryAttributeWrapper) {}
}

class SelectionTableViewCell: SelectionBaseCell {
    ///定义类型
    enum Focus: String {
        case entry
        case screen
    }
    
    enum Setting {
        case position
        case windowLevel
    }
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    ///外部使用
    let segmentedControl = UISegmentedControl()
    
    var attributesWrapper: EntryAttributeWrapper!
    
    var attributes: EKAttributes {
        return attributesWrapper.attributes
    }
    ///设置title
    var titleValue: String {
        set {
            titleLabel.text = newValue
        }
        get {
            return titleLabel.text ?? ""
        }
    }
    ///设置description
    var descriptionValue: String {
        set {
            descriptionLabel.text = newValue
        }
        get {
            return descriptionLabel.text ?? ""
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTitleLabel()
        setupDescriptionLabel()
        setupSegmentedControl()
        setupInterfaceStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.font = MainFont.bold.with(size: 18)
        titleLabel.layoutToSuperview(.top, offset: 20)
        titleLabel.layoutToSuperview(axis: .horizontally, offset: 20)
        titleLabel.forceContentWrap(.vertically)
    }
    
    private func setupDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.font = MainFont.light.with(size: 15)
        ///行
        descriptionLabel.numberOfLines = 0
        descriptionLabel.layout(.top, to: .bottom, of: titleLabel, offset: 10)
        descriptionLabel.layoutToSuperview(axis: .horizontally, offset: 20)
        descriptionLabel.forceContentWrap(.vertically)
    }
    
    private func setupSegmentedControl() {
        contentView.addSubview(segmentedControl)
        ///正常字体
        segmentedControl.setTitleTextAttributes(
            [NSAttributedString.Key.font: MainFont.light.with(size: 15)],
            for: .normal
        )
        ///选中字体
        segmentedControl.setTitleTextAttributes(
            [NSAttributedString.Key.font: MainFont.medium.with(size: 15)],
            for: .selected
        )
        segmentedControl.addTarget(
            self,
            action: #selector(segmentChanged),
            for: .valueChanged
        )
        segmentedControl.layout(.top, to: .bottom, of: descriptionLabel, offset: 10)
        segmentedControl.layoutToSuperview(axis: .horizontally, offset: 20)
        segmentedControl.layoutToSuperview(.bottom, offset: -20)
    }
    
    override func configure(attributesWrapper: EntryAttributeWrapper) {
        ///移除
        segmentedControl.removeAllSegments()
        self.attributesWrapper = attributesWrapper
    }
    
    func insertSegments(by array: [String]) {
        for (index, info) in array.enumerated() {
            ///添加
            segmentedControl.insertSegment(withTitle: info, at: index, animated: false)
        }
    }

    ///action
    @objc func segmentChanged() {}
    
    private func setupInterfaceStyle() {
        ///设置背景色
        contentView.backgroundColor = EKColor.standardBackground.color(
            for: traitCollection,
            mode: PresetsDataSource.displayMode
        )
        segmentedControl.tintColor = EKColor.segmentedControlTint.color(
            for: traitCollection,
            mode: PresetsDataSource.displayMode
        )
        segmentedControl.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:
                EKColor.standardContent.color(
                    for: traitCollection,
                    mode: PresetsDataSource.displayMode
                )
            ],
            for: .normal
        )
        segmentedControl.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor:
                EKColor.standardContent.inverted.color(
                    for: traitCollection,
                    mode: PresetsDataSource.displayMode
                )
            ],
            for: .selected
        )
        titleLabel.textColor = EKColor.standardContent.color(
            for: traitCollection,
            mode: PresetsDataSource.displayMode
        )
        descriptionLabel.textColor = EKColor.standardContent.with(alpha: 0.8).color(
            for: traitCollection,
            mode: PresetsDataSource.displayMode
        )
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupInterfaceStyle()
    }
}
