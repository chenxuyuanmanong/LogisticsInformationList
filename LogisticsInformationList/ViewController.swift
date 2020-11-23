//
//  ViewController.swift
//  LogisticsInformationList
//
//  Created by kaiya on 2020/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableFooterView : UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 45))
        
        let but = UIButton()
        but.setImage(UIImage(named: "jiantou"), for: UIControl.State.normal)
        but.setImage(UIImage(named: "jiantouUp"), for: UIControl.State.selected)
        but.addTarget(self, action: #selector(showOrHide(sender:)), for: UIControl.Event.touchUpInside)
        
        view.addSubview(but)
        but.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        return view
    }()
    
    var showRows = 2
    
    @objc func showOrHide(sender : UIButton){
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            showRows = 10
            logisticsTableView.reloadData()
        }else{
            showRows = 2
            logisticsTableView.reloadData()
        }
    }
    
    lazy var logisticsTableView : UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorInset = UIEdgeInsets(top:0,left:30,bottom:0,right:15)
        tableView.separatorColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        tableView.tag = 0
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.bounces = false
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(logisticsTableView)
        logisticsTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        logisticsTableView.tableFooterView = tableFooterView
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        for i in 0..<showRows {
            tableView.register(LogisticsTableViewCell.self,forCellReuseIdentifier:"cell\(i)")
        }
        return showRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : LogisticsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell\(indexPath.row)", for: indexPath) as! LogisticsTableViewCell
        cell.selectionStyle = .none
        
        if indexPath.row == 0 {
            cell.topLineView.isHidden = true
            cell.midCircleView.backgroundColor = cell.highLightColor
            cell.bottomLineView.backgroundColor = cell.highLightColor
            cell.contentLabel.text = "货已送到，请尽快查收。阿手机话费还是粉红色的回复i萨复活了手机费挥洒回复萨卡积分"
            cell.contentLabel.textColor = cell.textHighLightColor
            cell.timeLabel.text = "2020-11-23 11:20:23"
            cell.timeLabel.textColor = cell.textHighLightColor
        }else if indexPath.row == 9{
            cell.bottomLineView.isHidden = true
            cell.topLineView.backgroundColor = cell.defultColor
            cell.midCircleView.backgroundColor = cell.defultColor
            cell.contentLabel.text = "货已打包发出"
        }else{
            cell.topLineView.backgroundColor = cell.defultColor
            cell.midCircleView.backgroundColor = cell.defultColor
            cell.bottomLineView.backgroundColor = cell.defultColor
            
            cell.contentLabel.text = "货已送到，请尽快查收。阿手机话费还是粉红色的回复i萨复活了手机费挥洒回复萨卡积分"
            cell.timeLabel.text = "2020-11-23 11:20:23"
            cell.detailLabel.text = "备注：撒就的和yaihifah 打撒额娃发烧啥"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
}
