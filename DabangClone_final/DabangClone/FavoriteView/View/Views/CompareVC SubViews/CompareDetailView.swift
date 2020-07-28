//
//  CompareDetailView.swift
//  DabangClone
//
//  Created by SEONGJUN on 2020/04/10.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit

class CompareDetailView: UIView {

    var data: DabangElement!

    let overralStackView = UIStackView()
    let separator = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    convenience init(data: DabangElement) {
        self.init(frame: .zero)
        self.data = data
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        let address = CompareCellInsideStack(title: "주소", detail: data.address.loadAddress)
        let roomStyle = CompareCellInsideStack(title: "종류", detail: data.type.rawValue)
        let jeonSe = CompareCellInsideStack(title: "전세", detail: data.salesForm.type == .전세 ? data.salesForm.depositChar : "")
        let monthlyRent = CompareCellInsideStack(title: "월세",
                                                 detail: data.salesForm.type == .월세 ? data.salesForm.depositChar + "/" + data.salesForm.monthlyChar : "")
        let exclusiveArea = CompareCellInsideStack(title: "전용", detail: "62.81m(29P)")
        let suppliedArea = CompareCellInsideStack(title: "공급", detail: "62.81m(29P)")
        let floor = CompareCellInsideStack(title: "해당", detail: data.floor)
        let totalFloor = CompareCellInsideStack(title: "건물", detail: data.totalFloor)
        let manageCost = CompareCellInsideStack(title: "관리", detail: data.livingExpenses ?? "없음")
        let parking = CompareCellInsideStack(title: "주차", detail: data.parkingtf ? "가능(\(data.parkingDetail))" : "불가")
        let shortTermContract = CompareCellInsideStack(title: "단기", detail: data.shortRent ? "가능" : "불가능")
        let option = CompareCellInsideStack(title: "옵션", detail: "에어컨,신발장,옷장,전자도어락,가스레인지")
        let security = CompareCellInsideStack(title: "보안", detail: "비디오폰,공동현관,CCTV,인터폰")
        let etcetera = CompareCellInsideStack(title: "기타", detail: "개별난방\n빌트인주방\n엘리베이터 있음\n반려동물가능\n즉시 입주\n확장형\n마우스\n키보드")
        
        [address,roomStyle,jeonSe,monthlyRent,exclusiveArea,suppliedArea,floor,totalFloor,manageCost,parking,
         shortTermContract,option,security,etcetera].forEach({overralStackView.addArrangedSubview($0)})
        
        addSubview(overralStackView)
        overralStackView.axis = .vertical
        overralStackView.spacing = 30
        overralStackView.setCustomSpacing(7, after: jeonSe)
        overralStackView.setCustomSpacing(7, after: exclusiveArea)
        overralStackView.setCustomSpacing(7, after: floor)
        setConstraints()
    }
    
    private func setConstraints() {
        overralStackView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        overralStackView.isLayoutMarginsRelativeArrangement = true
        overralStackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        addSubview(separator)
        separator.backgroundColor = .lightGray
        separator.snp.makeConstraints {
            $0.top.trailing.bottom.equalToSuperview()
            $0.width.equalTo(0.8)
        }
    }
//    func set(roomInfo: Room) {
//        self.data = roomInfo
//    }
}
