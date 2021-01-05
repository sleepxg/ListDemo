//
//  DemoCell.swift
//  ListDemo
//
//  Created by PCPSW_012 on 2020/12/31.
//

import Foundation
import UIKit

class DemoCell: UICollectionViewCell {
    
    var ledView:UIView?
    var nameLabel:UILabel?
    var minuteLable:UILabel?
    var tempLabel:UILabel?
    var maxLabel:UILabel?
    var minLabel:UILabel?
    let space:CGFloat = 30
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        cellSetting()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        cellSetting()
    }
    
    func cellSetting(){
        self.isUserInteractionEnabled = true
        cellBorder()
        ledViewSetting()
        nameLabelSetting()
        minuteLabelSetting()
        tempLabelSetting()
        maxMinViewSetting()
    }
    
    func cellBorder(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    func ledViewSetting(){
        let view = UIView()
        ledView = view
        contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        view.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        view.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }
        
    func nameLabelSetting(){
        let label = UILabel()
        nameLabel = label
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: ledView!.bottomAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: space).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func minuteLabelSetting(){
        let blackView = UIView()
        blackView.backgroundColor = UIColor.black
        contentView.addSubview(blackView)
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        blackView.topAnchor.constraint(equalTo: nameLabel!.bottomAnchor).isActive = true
        blackView.widthAnchor.constraint(equalToConstant: contentView.frame.width-2*space).isActive = true
        blackView.heightAnchor.constraint(equalToConstant: 3).isActive = true
        
        let label = UILabel()
        minuteLable = label
        label.textAlignment = .right
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: blackView.bottomAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: blackView.rightAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 80).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func tempLabelSetting(){
        let label = UILabel()
        tempLabel = label
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40)
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        label.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.3).isActive = true
        
        let unitLabel = UILabel()
        unitLabel.textAlignment = .center
        unitLabel.font = UIFont.systemFont(ofSize: 20)
        unitLabel.text = "℃"
        contentView.addSubview(unitLabel)
        unitLabel.translatesAutoresizingMaskIntoConstraints = false
        unitLabel.rightAnchor.constraint(equalTo: minuteLable!.rightAnchor).isActive = true
        unitLabel.bottomAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        unitLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        unitLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func maxMinViewSetting(){
        let bottomHeight : CGFloat = 150
        let maxView = UIView()
        maxView.backgroundColor = UIColor.red
        contentView.addSubview(maxView)
        maxView.translatesAutoresizingMaskIntoConstraints = false
        maxView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        maxView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        maxView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        maxView.heightAnchor.constraint(equalToConstant: bottomHeight).isActive = true
        
        let minView = UIView()
        minView.backgroundColor = UIColor.blue
        contentView.addSubview(minView)
        minView.translatesAutoresizingMaskIntoConstraints = false
        minView.leftAnchor.constraint(equalTo: maxView.rightAnchor).isActive = true
        minView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        minView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        minView.heightAnchor.constraint(equalToConstant: bottomHeight).isActive = true
        
        let alarmView = UIView()
        alarmView.backgroundColor = UIColor.green
        contentView.addSubview(alarmView)
        alarmView.translatesAutoresizingMaskIntoConstraints = false
        alarmView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        alarmView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        alarmView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4).isActive = true
        alarmView.heightAnchor.constraint(equalToConstant: bottomHeight).isActive = true
    }
}
