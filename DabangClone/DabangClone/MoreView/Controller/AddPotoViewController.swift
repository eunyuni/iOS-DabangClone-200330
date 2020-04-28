//
//  AddPotoViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/27.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import DKImagePickerController
protocol  AddPotoViewControllerDelegate : class {
  func getImage(images: [UIImage])
}
class AddPotoViewController: UIViewController {
  // MARK: -Property
  weak var delegate: AddPotoViewControllerDelegate!
  private let imagePiker = DKImagePickerController()
  private var imageViews: [UIImage] = []
  private let emptyView = UIView().then {
    $0.potoEmpty()
  }
  private let saveButton = UIButton().then {
    $0.setTitle("저장하기", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.backgroundColor = #colorLiteral(red: 0.7560141683, green: 0.7608896494, blue: 0.7650812864, alpha: 1)
    $0.isEnabled = false
  }
  private let layout = UICollectionViewFlowLayout().then {
    $0.scrollDirection = .vertical
  }
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
    $0.dataSource = self
    $0.delegate = self
    $0.backgroundColor = .white
    $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    $0.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
    //    $0.isPagingEnabled = true
    //    $0.alwaysBounceHorizontal = false
    //    $0.scrollsToTop = false
    //    $0.bounces = false
  }
  // MARK: -Lift cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupNavigation()
    setupUI()
  }
  
  // MARK: -Action
  @objc private func didTapSaveButton(_ sender: UIButton) {
    print("didTapSaveButton")
//    let vc = self.presentingViewController as! AddRoomViewController
//    vc.configure(images: imageViews)
    let apiManager = APIManager.shared.self
    for image in imageViews {
      print(image)
      let number = (111111...999999).randomElement()!
      apiManager.postPoto(image: image, imageName: "\(number)" + "poto") { (url) in
        print(url)
      }
    }
    delegate.getImage(images: imageViews)
//    self.dismiss(animated: true, completion: nil)
    self.navigationController?.popViewController(animated: true)
  }
  // MARK: -setupUI
  private func setupNavigation() {
    self.title = "poto"
    self.tabBarController?.tabBar.isHidden = true
    navigationController?.isNavigationBarHidden = false
    navigationItem.rightBarButtonItems = [
      UIBarButtonItem(image: UIImage(named: "potoDelete"), style: .plain, target: self, action: #selector(didTapDeleteButton(_:))),
      UIBarButtonItem(image: UIImage(named: "potoAdd"), style: .plain, target: self, action: #selector(didTapAddButton(_:))),
    ]
    self.navigationItem.rightBarButtonItem?.tintColor = .black
    self.navigationItem.rightBarButtonItems?.forEach({
      $0.tintColor = .black
    })
  }
  
  private func setupUI() {
    saveButton.addTarget(self, action: #selector(didTapSaveButton(_:)), for: .touchUpInside)
    [collectionView, emptyView, saveButton].forEach {
      self.view.addSubview($0)
    }
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  
  private func setupConstraint() {
    let guide = self.view.safeAreaLayoutGuide
    collectionView.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(guide)
      $0.bottom.equalTo(saveButton.snp.top)
    }
    emptyView.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(guide)
      $0.bottom.equalTo(saveButton.snp.top)
    }
    saveButton.snp.makeConstraints {
      $0.bottom.leading.trailing.equalTo(guide)
      $0.height.equalToSuperview().multipliedBy(0.1)
    }
  }
  @objc func handleMenuItemAction() {
    print("menu item tapped")
  }
  
  
  @objc private func didTapAddButton(_ sender: UIButton) {
    print("didTapAddButton")
    self.imagePiker.didSelectAssets = { (assets: [DKAsset]) in
      print("didSelectAssets")
      print(assets)
      self.imageViews.removeAll()
      for asset in assets {
        self.imageViews.append(self.getDKAssetImage(asset))
      }
      self.collectionView.reloadData()
      if self.imageViews.count < 3 {
        self.saveButton.backgroundColor = #colorLiteral(red: 0.7560141683, green: 0.7608896494, blue: 0.7650812864, alpha: 1)
        self.saveButton.isEnabled = false
      } else {
        self.saveButton.backgroundColor = #colorLiteral(red: 0, green: 0.4173707962, blue: 0.9140723348, alpha: 1)
        self.saveButton.isEnabled = true
      }
      self.collectionView.reloadData()
    }
    imagePiker.modalPresentationStyle = .fullScreen
    present(imagePiker, animated: true, completion: nil)
  }
  
  
  //  self.present(imagePiker, animated: true)
  @objc private func didTapDeleteButton(_ sender: UIButton) {
    print("didTapDeleteButton")
    imageViews.removeAll()
    self.saveButton.backgroundColor = #colorLiteral(red: 0.7560141683, green: 0.7608896494, blue: 0.7650812864, alpha: 1)
    self.saveButton.isEnabled = false
    self.collectionView.reloadData()
  }
  
  
  private func getDKAssetImage(_ asset: DKAsset) -> UIImage {
    var uiImage: UIImage!
    asset.fetchImage(with: CGSize(width: self.view.frame.width, height: self.view.frame.height / 2)) { (uiimage, error) in
      uiImage = uiimage!
    }
    return uiImage
  }
}

extension AddPotoViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    if imageViews.isEmpty {
      emptyView.isHidden = false
      return 0
    } else {
      emptyView.isHidden = true
      return 2
    }
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if imageViews.isEmpty {
      return 0
    } else {
      if section == 0 {
        return 1
      } else {
        return imageViews.count - 1
      }
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if indexPath.section == 0 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
      cell.configue(firstImage: imageViews[indexPath.item])
      return cell
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as! ImageCollectionViewCell
      cell.configue(secondeImage: imageViews[indexPath.item + 1])
      return cell
    }
  }
}

extension AddPotoViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.section == 0 {
      return CGSize(width: collectionView.frame.width , height: collectionView.frame.height / 2)
    } else {
      let width = (collectionView.frame.width - 20 - 30) / 3
      return CGSize(width: width, height: width)
    }
  }
  // 위아래 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    10
  }
  // 좌우 패딩
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    10
  }
  
  // 전체 top, left, bottom, right 마진
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    if section == 0 {
      let margin: CGFloat = 0
      return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    } else {
      let margin: CGFloat = 15
      return UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
    }
  }
}

extension AddPotoViewController: UICollectionViewDelegate {
  
}

//  func potoEmpty() {
//    let label = UILabel().then {
//      $0.text = "최소 3장 이상 드록하세요"
//      $0.font = .systemFont(ofSize: 14)
//      $0.textColor = #colorLiteral(red: 0.5638702512, green: 0.5687246323, blue: 0.5729450583, alpha: 1)
//    }
//    self.backgroundColor = #colorLiteral(red: 0.9207085967, green: 0.9256023169, blue: 0.9297692776, alpha: 1)
//    self.addSubview(label)
//    label.snp.makeConstraints {
//      $0.center.equalToSuperview()
//    }
//  }

