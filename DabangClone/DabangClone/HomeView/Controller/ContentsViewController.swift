//
//  ContentsViewController.swift
//  DabangClone
//
//  Created by 황정덕 on 2020/04/29.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import WebKit
class ContentsViewController: UIViewController {
  
  var webView = WKWebView()
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = ""
    self.tabBarController?.tabBar.isHidden = true
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .plain, target: self, action: #selector(didTapBackButton(_:)))
    self.navigationItem.leftBarButtonItem?.tintColor = .black
    setupUI()
  }
  
  
  // MARK: -Action
  func configue(urlString: String) {
    let myURL = URL(string: urlString)
    let myRequest = URLRequest(url: myURL!)
    webView.load(myRequest)
    
  }
  @objc private func didTapBackButton(_ sender: UIButton) {
    self.dismiss(animated: true)
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
extension ContentsViewController: WKUIDelegate {
}
