//
//  CompareViewController.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit

class CompareViewController: UIViewController {

    let noticeView = UIView()
    let noticeLabel = UILabel()
    
    var roomsToCompare: [Int : Room]!
    var compareKeys = [Int]()
    
    let overralScrollView = UIScrollView()
    let detailScrollView = UIScrollView()
    
    var askButton1 = CompareViewAskButton()
    var askButton2 = CompareViewAskButton()
    var askButton3 = CompareViewAskButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        configureNoticePart()
        configureScrollView()
        configureHeaderViews()
        configureDetailViews()
        configureAskButtons()
    }
    
    private func setNavigationBar() {
        title = "비교하기"
        let leftBarButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(didTapCloseButton))
        navigationItem.leftBarButtonItem = leftBarButton
        navigationController?.navigationBar.tintColor = .black
    }
    
    private func configureNoticePart() {
        view.addSubview(noticeView)
        noticeView.addSubview(noticeLabel)
        noticeView.backgroundColor = #colorLiteral(red: 0.9646322131, green: 0.9647476077, blue: 0.9645928741, alpha: 1)
        noticeLabel.textColor = .lightGray
        noticeLabel.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        noticeLabel.text = "\(self.roomsToCompare.count)개의 방을 비교한 후, 원하는 방을 문의하세요."
        
        noticeView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        noticeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func configureScrollView() {
        view.addSubview(overralScrollView)
//        overralScrollView.alwaysBounceVertical = true
//        overralScrollView.isDirectionalLockEnabled = true
//        detailScrollView.isDirectionalLockEnabled = true
        overralScrollView.showsVerticalScrollIndicator = false

//        if roomsToCompare.count < 3 { overralScrollView.isScrollEnabled = false }

        overralScrollView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(noticeView.snp.bottom)
//            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.bottom.equalToSuperview()
        }
        
        overralScrollView.addSubview(detailScrollView)
//        detailScrollView.clipsToBounds = true
        detailScrollView.snp.makeConstraints {
            $0.top.equalTo(overralScrollView.snp.top).offset(190)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
//            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

    private func configureHeaderViews() {
        for key in roomsToCompare.keys.sorted(by: <){
            compareKeys.append(key)
        }
        
        if compareKeys.count == 2 {
            compareDataCountTwoForHeader()
        } else {
            compareDataCountThreeForHeader()
        }
    }
    
    private func compareDataCountTwoForHeader() {
        let header1 = CompareHeaderView(data: self.roomsToCompare[compareKeys[0]]!)
        let header2 = CompareHeaderView(data: self.roomsToCompare[compareKeys[1]]!)
        [header1, header2].forEach({overralScrollView.addSubview($0)})
        header1.snp.makeConstraints {
            $0.top.leading.equalTo(overralScrollView)
            $0.height.equalTo(190)
            $0.width.equalTo(view.frame.width / 2)
        }
        header2.snp.makeConstraints {
            $0.top.equalTo(overralScrollView)
            $0.leading.equalTo(header1.snp.trailing)
            $0.height.equalTo(190)
            $0.width.equalTo(view.frame.width / 2)
            $0.trailing.equalTo(overralScrollView.snp.trailing)
        }
    }
    
    private func compareDataCountThreeForHeader() {
        let header1 = CompareHeaderView(data: self.roomsToCompare[compareKeys[0]]!)
        let header2 = CompareHeaderView(data: self.roomsToCompare[compareKeys[1]]!)
        let header3 = CompareHeaderView(data: self.roomsToCompare[compareKeys[2]]!)
        
        [header1, header2, header3].forEach({overralScrollView.addSubview($0)})
        header1.snp.makeConstraints {
            $0.top.leading.equalTo(overralScrollView)
            $0.height.equalTo(190)
            $0.width.equalTo(view.frame.width / 2)
        }
        header2.snp.makeConstraints {
            $0.top.equalTo(overralScrollView)
            $0.leading.equalTo(header1.snp.trailing)
            $0.height.equalTo(190)
            $0.width.equalTo(view.frame.width / 2)
        }
        header3.snp.makeConstraints {
            $0.top.equalTo(overralScrollView)
            $0.leading.equalTo(header2.snp.trailing)
            $0.height.equalTo(190)
            $0.width.equalTo(view.frame.width / 2)
            $0.trailing.equalTo(overralScrollView.snp.trailing)
        }
    }
    
    private func configureDetailViews() {
        if compareKeys.count == 2 {
            compareDataCountTwoForDetail()
        } else {
            compareDataCountThreeForDetail()
        }
    }
    
    private func compareDataCountTwoForDetail() {
        let detail1 = CompareDetailView(data: self.roomsToCompare[compareKeys[0]]!)
        let detail2 = CompareDetailView(data: self.roomsToCompare[compareKeys[1]]!)
        
        [detail1, detail2].forEach({detailScrollView.addSubview($0)})

        detail1.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(230)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(detailScrollView)
        }
        detail2.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(230)
            $0.leading.equalTo(detail1.snp.trailing)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(detailScrollView)
            $0.trailing.equalToSuperview()
        }
    }
    
    private func compareDataCountThreeForDetail() {
        let detail1 = CompareDetailView(data: self.roomsToCompare[compareKeys[0]]!)
        let detail2 = CompareDetailView(data: self.roomsToCompare[compareKeys[1]]!)
        let detail3 = CompareDetailView(data: self.roomsToCompare[compareKeys[2]]!)
        
        [detail1, detail2, detail3].forEach({detailScrollView.addSubview($0)})

        detail1.snp.makeConstraints {
            $0.top.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(230)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(detailScrollView)
        }
        detail2.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(230)
            $0.leading.equalTo(detail1.snp.trailing)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(detailScrollView)
        }
        detail3.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview().inset(230)
            $0.leading.equalTo(detail2.snp.trailing)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(detailScrollView)
            $0.trailing.equalToSuperview()
        }
    }
    
    private func configureAskButtons() {
        if compareKeys.count == 2 {
            compareDataCountTwoForAskButton()
        } else {
            compareDataCountThreeForAskButton()
        }
    }
    
    private func compareDataCountTwoForAskButton() {
        detailScrollView.addSubviews([askButton1,askButton2])
        [askButton1,askButton2].forEach({
            $0.addTarget(self, action: #selector(didTapAskButton(_:)), for: .touchUpInside)
        })
        
        askButton1.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(50)
        }
        askButton2.snp.makeConstraints {
            $0.leading.equalTo(askButton1.snp.trailing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(50)
        }
    }
    
    private func compareDataCountThreeForAskButton() {
        detailScrollView.addSubviews([askButton1,askButton2,askButton3])
        [askButton1,askButton2,askButton3].forEach({
            $0.addTarget(self, action: #selector(didTapAskButton(_:)), for: .touchUpInside)
        })
        
        askButton1.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(50)
        }
        askButton2.snp.makeConstraints {
            $0.leading.equalTo(askButton1.snp.trailing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(50)
        }
        askButton3.snp.makeConstraints {
            $0.leading.equalTo(askButton2.snp.trailing)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.width.equalTo(view.frame.width / 2)
            $0.height.equalTo(50)
        }
    }
    
    @objc func didTapAskButton(_ sender: UIButton) {
        let brokerInfoVC = BrokerInfoAlertVC()
        brokerInfoVC.modalPresentationStyle = .overFullScreen
        brokerInfoVC.modalTransitionStyle = .crossDissolve
        present(brokerInfoVC, animated: true)
    }
    
    @objc func didTapCloseButton() {
        dismiss(animated: true)
    }

}
