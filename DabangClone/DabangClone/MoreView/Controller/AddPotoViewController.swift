//
//  AddPotoViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/03/27.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import DKImagePickerController
class AddPotoViewController: UIViewController {
  // MARK: -Property
  private let imagePiker = DKImagePickerController()
  private var imageViews: [UIImage] = []
  private let emptyView = UIView().then {
    $0.potoEmpty()
  }
  private let saveButton = UIButton().then {
    $0.setTitle("저장하기", for: .normal)
    $0.setTitleColor(.white, for: .normal)
    $0.backgroundColor = #colorLiteral(red: 0.7560141683, green: 0.7608896494, blue: 0.7650812864, alpha: 1)
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
  
  
  // MARK: -setupUI
  private func setupNavigation() {
    self.title = "poto"
    navigationController?.isNavigationBarHidden = false
    navigationItem.rightBarButtonItems = [
      UIBarButtonItem(image: UIImage(named: "potoAdd"), style: .plain, target: self, action: #selector(didTapDeleteButton(_:))),
      UIBarButtonItem(image: UIImage(named: "potoDelete"), style: .plain, target: self, action: #selector(didTapAddButton(_:))),
    ]
    self.navigationItem.rightBarButtonItem?.tintColor = .black
  }
  
  private func setupUI() {
    self.view.addSubviews([collectionView, emptyView, saveButton])
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
    }
    imagePiker.modalPresentationStyle = .fullScreen
    present(imagePiker, animated: true, completion: nil)
  }
  
  
  //  self.present(imagePiker, animated: true)
  @objc private func didTapDeleteButton(_ sender: UIButton) {
    print("didTapDeleteButton")
    let pickerController = DKImagePickerController()
    
    pickerController.didSelectAssets = { (assets: [DKAsset]) in
      print("didSelectAssets")
      print(assets)
    }
    
    present(pickerController, animated: true, completion: nil)
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
      return 0
    } else {
      return 2
    }
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if imageViews.isEmpty {
      emptyView.isHidden = false
      return 0
    } else {
      emptyView.isHidden = true
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
