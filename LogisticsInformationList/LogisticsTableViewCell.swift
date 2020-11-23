//
//  LogisticsTableViewCell.swift
//  LogisticsInformationList
//
//  Created by kaiya on 2020/11/23.
//

import UIKit

class LogisticsTableViewCell: UITableViewCell {
    
    let highLightColor = UIColor.green
    let defultColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
    let textDefultColor = UIColor(red: 155/255, green: 155/255, blue: 155/255, alpha: 1)
    let textHighLightColor = UIColor.green
    
    lazy var topLineView : UIView = {
        let view = UIView()
        view.backgroundColor = defultColor
        return view
    }()
    
    lazy var midCircleView : UIView = {
        let view = UIView()
        view.backgroundColor = defultColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var bottomLineView : UIView = {
        let view = UIView()
        view.backgroundColor = defultColor
        return view
    }()
    
    

    lazy var contentLabel : UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont.systemFont(ofSize: 15)
        lb.textColor = textDefultColor
        lb.numberOfLines = 0
        return lb
    }()
    lazy var timeLabel : UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = textDefultColor
        lb.numberOfLines = 0
        return lb
    }()
    lazy var detailLabel : UILabel = {
        let lb = UILabel()
        lb.text = ""
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = textDefultColor
        lb.numberOfLines = 0
        return lb
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(topLineView)
        contentView.addSubview(midCircleView)
        contentView.addSubview(bottomLineView)
        contentView.addSubview(contentLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(detailLabel)
        
        topLineView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.width.equalTo(0.5)
            make.height.equalTo(10)
        }
        midCircleView.snp.makeConstraints { (make) in
            make.centerX.equalTo(topLineView.snp.centerX)
            make.top.equalTo(topLineView.snp.bottom)
            make.width.height.equalTo(10)
        }
        bottomLineView.snp.makeConstraints { (make) in
            make.centerX.equalTo(topLineView.snp.centerX)
            make.top.equalTo(midCircleView.snp.bottom)
            make.bottom.equalToSuperview()
            make.width.equalTo(0.5)
        }
        detailLabel.snp.makeConstraints { (make) in
            make.left.equalTo(bottomLineView.snp.right).offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalToSuperview().offset(-15)
        }
        timeLabel.snp.makeConstraints { (make) in
            make.left.equalTo(bottomLineView.snp.right).offset(15)
            make.right.equalToSuperview().offset(-15)
            make.bottom.equalTo(detailLabel.snp.top).offset(-5)
        }
        contentLabel.snp.makeConstraints { (make) in
            make.left.equalTo(bottomLineView.snp.right).offset(15)
            make.right.equalToSuperview().offset(-15)
            make.top.equalToSuperview().offset(5)
            make.bottom.equalTo(timeLabel.snp.top).offset(-5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
