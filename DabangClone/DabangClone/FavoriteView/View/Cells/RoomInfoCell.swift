//
//  RoomInfoCell.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/03.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import SnapKit

protocol RoomInfoCellDelegate: class {
    func didTapCheckButton(cell: RoomInfoCell, isChecked: Bool)
}

class RoomInfoCell: UITableViewCell {
    static let identifier = "RoomInfoCell"

    // MARK: - Properties
    
    var data: Room?
    
    weak var delegate: RoomInfoCellDelegate?
    
    let checkButtonToCompare = UIButton()
    
    let overralContainerView = UIView()
    
    lazy var infoStackView = UIStackView(arrangedSubviews: [nameLabel, priceLabel, infoLabel, detailLabel, etceteraStackView])
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        return label
    }()
    
    let priceLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        return label
    }()
    
    let infoLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let detailLabel: UILabel = {
       let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let etceteraStackView = UIStackView()
    var etceteraArray = [String]()
    
    let roomImageView = UIImageView()
    
    lazy var heartButton: UIButton = {
       let btn = UIButton()
        btn.setImage(UIImage(systemName: "heart"), for: .normal)
        btn.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        btn.addTarget(self, action: #selector(didTapHeartButton(_:)), for: .touchUpInside)
        btn.tintColor = #colorLiteral(red: 0.959012568, green: 0.2369959354, blue: 0.287863344, alpha: 1)
        btn.imageView?.contentMode = .scaleAspectFill
        return btn
    }()
    
    var isCheckButtonSelected = false {
        didSet{
            checkButtonToCompare.isSelected = isCheckButtonSelected
            delegate?.didTapCheckButton(cell: self, isChecked: isCheckButtonSelected)
        }
    }
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCheckButton()
        configureOverralContainerView()
        setNotiCenter()
        configureEtcStackView()
        configureInfoStackView()
        configureRoomImageView()
        configureTotalStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Setup
    
    private func configureEtcStackView() {
        etceteraStackView.axis = .horizontal
        etceteraStackView.distribution = .equalSpacing
        etceteraStackView.alignment = .center
        etceteraStackView.snp.makeConstraints {
            $0.width.equalTo(200)
        }
    }
    
    private func putLabelInStackView() {
        var totalWidthOfEtc:CGFloat = 0
        var shouldStop = false
        
        etceteraArray.map{ (word) -> UILabel in
            let label = UILabel()
            guard shouldStop == false else { label.text = ""; return label}
            label.font = UIFont.systemFont(ofSize: 13, weight: .medium)
            label.backgroundColor = #colorLiteral(red: 0.9058129191, green: 0.905921638, blue: 0.9057757854, alpha: 1)
            label.textColor = #colorLiteral(red: 0.3764393032, green: 0.3764881492, blue: 0.3764226437, alpha: 1)
            label.lineBreakMode = .byClipping
            label.text = word
            
            let labelWidth = label.intrinsicContentSize.width
            if totalWidthOfEtc + labelWidth >= 180 {
                label.text = "・・・"
                shouldStop = true
            } else {
                totalWidthOfEtc += labelWidth + 3
            }
            return label
        }.forEach{ etceteraStackView.addArrangedSubview($0) }
    }
    
    private func configureInfoStackView() {
        infoStackView.autoresizingMask = [.flexibleHeight]
        infoStackView.axis = .vertical
        infoStackView.spacing = 5
        infoStackView.distribution = .equalSpacing
        infoStackView.alignment = .fill
        overralContainerView.addSubview(infoStackView)
        infoStackView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(15)
            $0.width.equalTo(200)
        }
        
    }
    
    private func configureCheckButton() {
        contentView.backgroundColor = .white
        contentView.addSubview(checkButtonToCompare)
        checkButtonToCompare.setImage(#imageLiteral(resourceName: "unChecked").withRenderingMode(.alwaysOriginal), for: .normal)
        checkButtonToCompare.setImage(#imageLiteral(resourceName: "checked").withRenderingMode(.alwaysOriginal), for: .selected)
        checkButtonToCompare.addTarget(self, action: #selector(didTapCheckButton), for: .touchUpInside)
        checkButtonToCompare.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(15)
            $0.width.height.equalTo(25)
        }
    }
    
    private func configureOverralContainerView() {
        contentView.addSubview(overralContainerView)
        overralContainerView.backgroundColor = .white
        overralContainerView.clipsToBounds = true
        overralContainerView.addSubview(roomImageView)
        overralContainerView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configureRoomImageView() {
        roomImageView.isUserInteractionEnabled = true
        roomImageView.contentMode = .scaleAspectFill
        roomImageView.layer.cornerRadius = 8
        roomImageView.clipsToBounds = true
        roomImageView.snp.makeConstraints {
            $0.top.equalTo(infoStackView.snp.top)
            $0.trailing.equalToSuperview().inset(15)
            $0.leading.equalTo(infoStackView.snp.trailing).offset(30)
            $0.height.equalTo(100)
        }
        roomImageView.addSubview(heartButton)
        
        configureHeartButton()
    }
    
    private func configureHeartButton() {
        heartButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(5)
            $0.width.height.equalTo(30)
        }
        heartButton.imageView?.translatesAutoresizingMaskIntoConstraints = false
        heartButton.imageView?.topAnchor.constraint(equalTo: heartButton.topAnchor).isActive = true
        heartButton.imageView?.leadingAnchor.constraint(equalTo: heartButton.leadingAnchor).isActive = true
        heartButton.imageView?.trailingAnchor.constraint(equalTo: heartButton.trailingAnchor).isActive = true
        heartButton.imageView?.bottomAnchor.constraint(equalTo: heartButton.bottomAnchor).isActive = true
    }
    
    private func configureTotalStackView() {
        let totalStackView = UIStackView(arrangedSubviews: [infoStackView, roomImageView])
        totalStackView.axis = .horizontal
        totalStackView.spacing = 30
        totalStackView.alignment = .top
        overralContainerView.addSubview(totalStackView)
        totalStackView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        totalStackView.isLayoutMarginsRelativeArrangement = true
        totalStackView.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
    }
    
    private func setNotiCenter() {
        NotificationCenter.default.addObserver(forName: FavoriteListViewController.compareModeOn, object: nil,
                                               queue: .main) { [weak self] (noti) in
                                                guard let self = self else { return }
                                                UIView.animate(withDuration: 0.3) {
                                                    self.overralContainerView.transform = CGAffineTransform(translationX: 50, y: 0)
                                                    }
                                                }
        NotificationCenter.default.addObserver(forName: FavoriteListViewController.compareModeOff, object: nil,
                                                queue: .main) { [weak self] (noti) in
                                                 guard let self = self else { return }
                                                    UIView.animate(withDuration: 0.3) {
                                                        self.overralContainerView.transform = .identity
                                                        self.isCheckButtonSelected = false
                                                    }
                                                 }
    }
    
    func set(roomInfo: Room) {
        self.data = roomInfo
        
        self.nameLabel.text = roomInfo.roomID == 1 ? "" : "서초푸르지오써밋"
        self.priceLabel.text = "\(roomInfo.baseInfo.roomStyle.rawValue)" + " " + roomInfo.baseInfo.cost
        self.infoLabel.text = self.data?.detailExplain ?? ""
        self.detailLabel.text = roomInfo.location
        etceteraArray = roomInfo.addInfo.option.map({$0.rawValue})
        etceteraStackView.arrangedSubviews.forEach({$0.removeFromSuperview()})
        putLabelInStackView()
        self.roomImageView.image = roomInfo.images.first?.imageStringToImage()
    }
    
    // MARK: - Action Handle
    
    @objc private func didTapHeartButton(_ sender: UIButton) {
        print("tap")
        heartButton.isSelected.toggle()
        //찜한방 리스트에 POST RoomID만 보내면 될 듯
    }
    
    @objc private func didTapCheckButton(_ sender: UIButton) {
        isCheckButtonSelected.toggle()
        sender.isSelected = isCheckButtonSelected
    }
}
