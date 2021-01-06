//
//  DemoCell.swift
//  ListDemo
//
//  Created by PCPSW_012 on 2020/12/31.
//

import Foundation
import UIKit

enum AlarmType {
    case None
    case High
    case Low
}

class DemoCell: UICollectionViewCell {
    
    var ledView:UIView?
    var nameLabel:UILabel?
    var minuteLable:UILabel?
    var tempLabel:UILabel?
    var maxTempLabel:UILabel?
    var minTempLabel:UILabel?
    var alarmLabel:UILabel?
    
    let space:CGFloat = 30
    let bottomLabelHeight : CGFloat = 30
    
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
        unitLabel.text = tempUnit()
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
        maxView.layer.borderWidth = 1
        maxView.layer.borderColor = UIColor.black.cgColor
        contentView.addSubview(maxView)
        maxView.translatesAutoresizingMaskIntoConstraints = false
        maxView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        maxView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        maxView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        maxView.heightAnchor.constraint(equalToConstant: bottomHeight).isActive = true
        
        bottomViewSetting(background: maxView, title: "MAX")
        bottomUnitSetting(background: maxView)

        let maxLabel = UILabel()
        maxTempLabel = maxLabel
        maxLabel.textAlignment = .center
        maxLabel.font = UIFont.systemFont(ofSize: 30)
        maxView.addSubview(maxLabel)
        maxLabel.translatesAutoresizingMaskIntoConstraints = false
        maxLabel.centerXAnchor.constraint(equalTo: maxView.centerXAnchor).isActive = true
        maxLabel.centerYAnchor.constraint(equalTo: maxView.centerYAnchor).isActive = true
        maxLabel.widthAnchor.constraint(equalTo: maxView.widthAnchor, multiplier: 0.8).isActive = true
        maxLabel.heightAnchor.constraint(equalTo: maxView.heightAnchor, multiplier: 0.6).isActive = true
        
        let minView = UIView()
        minView.layer.borderWidth = 1
        minView.layer.borderColor = UIColor.black.cgColor
        contentView.addSubview(minView)
        minView.translatesAutoresizingMaskIntoConstraints = false
        minView.leftAnchor.constraint(equalTo: maxView.rightAnchor).isActive = true
        minView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        minView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        minView.heightAnchor.constraint(equalToConstant: bottomHeight).isActive = true
        
        bottomViewSetting(background: minView, title: "MIN")
        bottomUnitSetting(background: minView)
        
        let minLabel = UILabel()
        minTempLabel = minLabel
        minLabel.textAlignment = .center
        minLabel.font = UIFont.systemFont(ofSize: 30)
        minView.addSubview(minLabel)
        minLabel.translatesAutoresizingMaskIntoConstraints = false
        minLabel.centerXAnchor.constraint(equalTo: minView.centerXAnchor).isActive = true
        minLabel.centerYAnchor.constraint(equalTo: minView.centerYAnchor).isActive = true
        minLabel.widthAnchor.constraint(equalTo: minView.widthAnchor, multiplier: 0.8).isActive = true
        minLabel.heightAnchor.constraint(equalTo: minView.heightAnchor, multiplier: 0.6).isActive = true
        
        let alarmView = UIView()
        alarmView.layer.borderWidth = 1
        alarmView.layer.borderColor = UIColor.black.cgColor
        contentView.addSubview(alarmView)
        alarmView.translatesAutoresizingMaskIntoConstraints = false
        alarmView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        alarmView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        alarmView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4).isActive = true
        alarmView.heightAnchor.constraint(equalToConstant: bottomHeight).isActive = true
        
        bottomViewSetting(background: alarmView, title: "Alarm")
        
        let label = UILabel()
        alarmLabel = label
        label.textAlignment = .center
        alarmView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.rightAnchor.constraint(equalTo: alarmView.rightAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: alarmView.leftAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: alarmView.bottomAnchor).isActive = true
        label.topAnchor.constraint(equalTo: alarmView.topAnchor, constant: bottomLabelHeight).isActive = true
    }
    
    func alarmViewUpdate(type:AlarmType){
        switch type {
        case .None:
            alarmLabel?.text = ""
            alarmLabel?.backgroundColor = UIColor.white
        case .High:
            alarmLabel?.text = "Hi"
            alarmLabel?.backgroundColor = UIColor.red
        case .Low:
            alarmLabel?.text = "Lo"
            alarmLabel?.backgroundColor = UIColor.blue
        }
    }
    
    func bottomViewSetting(background:UIView, title: String){
        let label = UILabel()
        label.textAlignment = .center
        label.text = title
//        label.backgroundColor = UIColor.orange
        background.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: background.topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: background.leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: background.rightAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant:bottomLabelHeight).isActive = true
    }
    
    func bottomUnitSetting(background:UIView){
        let label = UILabel()
        label.textAlignment = .center
        label.text = tempUnit()
        background.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.rightAnchor.constraint(equalTo: background.rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: background.bottomAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: background.widthAnchor, multiplier: 0.25).isActive = true
        label.heightAnchor.constraint(equalTo: label.widthAnchor).isActive = true
    }
    
    func tempUnit()->String{
        return "℃"
    }
}
