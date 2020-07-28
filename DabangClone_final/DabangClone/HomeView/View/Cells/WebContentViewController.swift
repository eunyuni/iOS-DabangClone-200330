//
//  WebContentViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/07/22.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import WebKit
class WebContentViewController: UIViewController {
  
  var webView = WKWebView()
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "다방 블로그"
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .plain, target: self, action: #selector(didTapBackButton(_:)))
    self.navigationItem.leftBarButtonItem?.tintColor = .black
    setupUI()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.navigationBar.isHidden = false
    
  }
  
  
  // MARK: -Action
  @objc private func didTapBackButton(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
  }
  // MARK: -setupUI
  private func setupUI() {
    webView.uiDelegate = self
    self.view.addSubview(webView)
    setupConstraint()
  }
  
  // MARK: -setupConstraint
  private func setupConstraint() {
    webView.snp.makeConstraints {
      $0.top.bottom.leading.trailing.equalToSuperview()
    }
  }
}
extension WebContentViewController: WKUIDelegate {
}

