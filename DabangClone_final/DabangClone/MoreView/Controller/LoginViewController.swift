//
//  ViewController.swift
//  DabangClone
//
//  Created by 정의석 on 2020/03/20.
//  Copyright © 2020 pandaman. All rights reserved.
//

import UIKit
import KakaoOpenSDK
import SnapKit
import Then
import Alamofire
import FBSDKLoginKit
import FBSDKShareKit
import AuthenticationServices
import SwiftyJSON
import KeychainSwift
//import Kingfisher
//import Facebook
//import RxSwift
//import GoogleMap
//import KakaoMap(?)

class LoginViewController: UIViewController {
    
    //MARK: KakaoLogin Session
    let session = KOSession.shared()
    //MARK: Property
    let dabangLogoImage = UIImageView().then {
        $0.image = UIImage(named: "dabangLogo")
    }
    
    //MARK: 카카오 로그인 버튼
    let kakaoLoginButton = UIButton().then {
        $0.addTarget(self, action: #selector(touchUpLoginButton(_:)), for: .touchUpInside)
        $0.setBackgroundImage(UIImage(named: "KakaoLoginNew"), for: .normal)
    }
    
    //MARK: 페이스북 로그인 버튼
    let facebookLoginButton = UIButton().then {
        $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        $0.setBackgroundImage(UIImage(named: "FacebookLoginNew"), for: .normal)
    }
    
    let appleLoginButton = ASAuthorizationAppleIDButton(type: .signIn, style: .whiteOutline)
    
    let appleLoginButtonView = UIView().then {
        $0.backgroundColor = .white
    }
    
    let emailTextField = UITextField().then {
        $0.placeholder = "아이디(이메일 주소)"
        $0.background = UIImage(named: "TextFieldBG")
        $0.addLeftPadding()
    }
    
    let pwTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.background = UIImage(named: "TextFieldBG")
        $0.addLeftPadding()
    }
    
    let pureLoginButton = UIButton(type: .system).then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.layer.cornerRadius = 4
        $0.backgroundColor = UIColor(named: "PureLoginButtonColor")
        $0.addTarget(self, action: #selector(didTapPureLoginButton), for: .touchUpInside)
    }
    
    let findPwButton = UIButton(type: .system).then {
        $0.setTitle("비밀번호 찾기 | ", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.backgroundColor = .clear
    }
    
    let signUpUseEmailButton = UIButton(type: .system).then {
        $0.setTitle("이메일로 회원가입", for: .normal)
        $0.setTitleColor(UIColor.gray, for: .normal)
        $0.backgroundColor = .clear
        $0.addTarget(self, action: #selector(didTapSignUpUseEmailButton), for: .touchUpInside)
    }
    
    let bottomGrayView = UIView().then {
        $0.backgroundColor = UIColor(named: "TextFieldColor")
    }
    let bottomCallNumLabel = UILabel().then {
        $0.text = "고객센터 02-1899-6840"
        $0.textColor = .gray
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 18, weight: .regular)
    }
    
    let loginAlert = UIView().then {
        $0.layer.cornerRadius = 5
        $0.backgroundColor = UIColor(named: "AlertColor")
    }
    let loginAlertLabel = UILabel().then {
        $0.text = "로그인 후 알림을 받을 수 있습니다."
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    lazy var tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureAction(_:)))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        pwTextField.delegate = self
        emailTextField.delegate = self
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowNotification(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowNotification(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        setupUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    //MARK: 알림 눌렀을 때 뜨는 로그인 뷰에 띄울 얼럿
    private func showLoginAlert() {
        loginAlert.alpha = 1
        loginAlertLabel.alpha = 1
        
        view.addSubview(loginAlert)
        loginAlert.addSubview(loginAlertLabel)
        
        loginAlert.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.snp.centerY).multipliedBy(1.7)
            $0.width.equalToSuperview().multipliedBy(0.7)
            $0.height.equalTo(30)
        }
        
        loginAlertLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        
        UIView.animate(withDuration: 0.5, delay: 1, animations: {
            self.loginAlert.alpha = 0
            self.loginAlertLabel.alpha = 0
        }, completion: { f in
            self.loginAlert.isHidden = true
            self.loginAlertLabel.isHidden = true
        })
        
        
        
    }
    
    
    //MARK: - SetupUI
    private func setupUI() {
        addAppleLoginButton()
        view.addGestureRecognizer(tapGesture)
        view.addSubviews([
            dabangLogoImage,
            emailTextField,
            pwTextField,
            pureLoginButton,
            findPwButton,
            signUpUseEmailButton,
            kakaoLoginButton,
            facebookLoginButton,
            bottomGrayView,
            appleLoginButtonView
        ])
        
        bottomGrayView.addSubview(bottomCallNumLabel)
        setupConstraints()
    }
    
    //MARK: Layout
    private func setupConstraints() {
        
        dabangLogoImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(140)
        }
        
        emailTextField.snp.makeConstraints {
            $0.centerY.equalToSuperview().offset(-100)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.height.equalToSuperview().multipliedBy(0.06)
        }
        
        pwTextField.snp.makeConstraints {
            $0.leading.equalTo(emailTextField)
            $0.top.equalTo(emailTextField.snp.bottom).offset(10)
            $0.width.equalTo(emailTextField)
            $0.height.equalTo(emailTextField)
        }
        
        pureLoginButton.snp.makeConstraints {
            $0.leading.equalTo(emailTextField)
            $0.top.equalTo(pwTextField.snp.bottom).offset(10)
            $0.height.width.equalTo(emailTextField)
        }
        
        signUpUseEmailButton.snp.makeConstraints {
            $0.leading.equalTo(view.snp.centerX)
            $0.top.equalTo(pureLoginButton.snp.bottom).offset(15)
        }
        
        findPwButton.snp.makeConstraints {
            $0.trailing.equalTo(signUpUseEmailButton.snp.leading)
            $0.top.equalTo(pureLoginButton.snp.bottom).offset(15)
        }
        
        appleLoginButtonView.snp.makeConstraints {
            $0.leading.equalTo(emailTextField)
            $0.top.equalTo(findPwButton.snp.bottom).offset(30)
            $0.trailing.equalTo(emailTextField)
            $0.height.equalTo(emailTextField)
        }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.leading.equalTo(emailTextField)
            $0.top.equalTo(appleLoginButtonView.snp.bottom).offset(15)
            $0.trailing.equalTo(emailTextField)
            $0.height.equalTo(emailTextField)
        }
        
        facebookLoginButton.snp.makeConstraints {
            $0.leading.equalTo(emailTextField)
            $0.top.equalTo(kakaoLoginButton.snp.bottom).offset(15)
            $0.trailing.equalTo(emailTextField)
            $0.height.equalTo(emailTextField)
        }
        
        
        bottomGrayView.snp.makeConstraints {
            $0.bottom.leading.trailing.equalToSuperview()
            $0.top.equalTo(kakaoLoginButton.snp.bottom).offset(170)
        }
        
        bottomCallNumLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        showLoginAlert()
    }
    
    //MARK: - 자체 로그인
    @objc private func didTapPureLoginButton() {
        let emailValidation = emailTextField.text?.validateEmail() ?? false
        let passwordValidation = pwTextField.text?.validatePassword() ?? false
        if emailValidation == true {
            print("올바른 이메일")
            self.navigationController?.popViewController(animated: true)//
        } else {
            print("올바르지 않은 이메일")
        }
        
        if passwordValidation == true {
            print("올바른 패스워드")
            self.navigationController?.popViewController(animated: true)//
        } else {
            print("올바르지 않은 패스워드")
        }
        
        if emailValidation && passwordValidation {
            localLogin()
        }
    }
    
    func localLogin() {
        APIManager.shared.postUserLogin(email: emailTextField.text!, password: pwTextField.text!) { (result) in
            switch result {
            case .success(let isLoggedIn):
                if isLoggedIn {
                    print("로그인 성공")
                    APIManager.shared.getUserProfile { (result) in
                        switch result {
                        case .success(let user):
                            APIManager.shared.loginWay = .local
                            UserData.shared.user = user
                            //HomeView로 이동
                        case .failure(let error):
                            print("유저정보 로드 실패: ",error)
                        }
                    }
                }
            case .failure(let error):
                print("로그인 실패")
                print(error)
            }
        }
    }
    
    @objc private func didTapSignUpUseEmailButton() {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    //MARK: - APPLE Login
    func addAppleLoginButton() {
        appleLoginButtonView.addSubview(appleLoginButton)
        appleLoginButton.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        appleLoginButton.addTarget(self, action: #selector(handleAppleSignInbutton(_:)), for: .touchDown)
        print("addtarget")
        
    }
    
    @objc private func handleAppleSignInbutton(_ sender: UIButton) {
        print("Apple login")
        let request = ASAuthorizationAppleIDProvider().createRequest()
      request.requestedScopes = [.email, .fullName, ]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    //MARK: - KAKAO Login
    @objc private func touchUpLoginButton(_ sender: UIButton) {
        guard let session = KOSession.shared() else {
            return
        }
        
        if session.isOpen() {
            session.close()
        }
        
        session.open { (error) in
            if error != nil || !session.isOpen() { return }
            KOSessionTask.userMeTask(completion: { (error, user) in
                guard let user = user,
                    let email = user.account?.email,
                    let nickname = user.account?.profile?.nickname else { return }
                
                if let token = session.token {
                    print("AccessToken :", token.accessToken)
                    print("RefreshToken :", token.refreshToken)
                    
                    //AF Post
                    self.postKakaoToken(Token: token.accessToken)
                }
                print("email :", email, " nickname :", nickname)
                let mainVC = HomeViewController()
                
              self.navigationController?.popViewController(animated: true)
            })
        }
    }
    
    func postKakaoToken(Token: String) {
      print("kakao Login")
        let kakaoToken = Token
        let param: Parameters = [
            "accessToken" : kakaoToken
            //      "username" : "admin",
            //      "password" : "admin123"
        ]
        
        //        let url = URL(string: "https://moonpeter.com/members/kakaoToken/")
        let url = URL(string: "http://dabang-loadbalancer-779366673.ap-northeast-2.elb.amazonaws.com/members/kakaoToken/")
//      let url = URL(string: "https://moonpeter.com/members/kakaoToken/")
        AF.request(url!, method: .post, parameters: param, encoding: URLEncoding.httpBody)
            .responseJSON { (response) in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    let accessToken = json["token"].stringValue
                    APIManager.shared.userPk = json["user"]["pk"].intValue
                    let result = APIManager.shared.setAccessTokenIntoKeyChain(token: accessToken, key: Key.keyChain)
                    APIManager.shared.loginWay = .kakao
                    print(result ? "카카오 로그인 성공 -> 토큰저장 성공" : "카카오 로그인 성공 -> 토큰저장 실패")
                case .failure(_):
                    print("카카오 로그인 실패")
                }
                
                //        AF.request(url!, method: .post, parameters: param, encoding: URLEncoding.httpBody, headers: .none, interceptor: .none).responseString { response in
                //            print("성공? :", response.result)
                //            let resultString =  response.result
                //      self.navigationController?.popViewController(animated: true)//
                //        }
        }
    }
    
    
    //MARK: - Facebook Login
    @objc private func didTapButton() {
        print("페이스북 로그인")
        
        let loginManager = LoginManager()
        loginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, err) in
            //      guard let result = result else { return }
            //      self.loginManagerDidComplete(result)
            
            if let err = err {
                print(err.localizedDescription)
                return
            }
            guard let result = result, let token : AccessToken = result.token else { return }
            //      guard let token: AccessToken = result?.token else {
            //        print("There is no token in Facebook sign in.")
            //        return
            //      }
            if(result.isCancelled) {
                print("isCancelled")
                //Show Cancel alert
            } else if(result.grantedPermissions.contains("email")) {
                self.returnUserData()
                self.postFacebookToken(Token: token.tokenString)
                
                //        self.navigationController?.popViewController(animated: true)
                //        print(token.appID, token.graphDomain, token.tokenString)
            }
        }
    }
    
    func postFacebookToken(Token: String) {
        let facebookToken = Token
        let param: Parameters = [
            "accessToken" : facebookToken
//            "username" : "admin",
//            "password" : "admin123"
        ]
        let url = URL(string: "http://dabang-loadbalancer-779366673.ap-northeast-2.elb.amazonaws.com/members/facebookToken/")
//        let url = URL(string: "http://dabang-loadbalancer-779366673.ap-northeast-2.elb.amazonaws.com/api/token/")
        AF.request(url!, method: .post, parameters: param, encoding: URLEncoding.httpBody)
        .responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let accessToken = json["token"].stringValue
                APIManager.shared.userPk = json["user"]["pk"].intValue
                let result = APIManager.shared.setAccessTokenIntoKeyChain(token: accessToken, key: Key.keyChain)
                APIManager.shared.loginWay = .facebook
                print(result ? "페이스북 로그인 성공 -> 토큰저장 성공" : "페이스북 로그인 성공 -> 토큰저장 실패")
              self.navigationController?.popViewController(animated: true)

            case .failure(_):
                print("페이스북 로그인 실패")
            }
//        AF.request(url!, method: .post, parameters: param, encoding: URLEncoding.httpBody, headers: .none, interceptor: .none).responseString { response in
//            print("성공? :", response.result)
//            //            let resultString =  response.result
       }
    }
    
    
    
    func returnUserData() {
        let graphRequest : GraphRequest = GraphRequest(graphPath: "me", parameters: ["fields":"email,name"])
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            if ((error) != nil) {
                // Process error
                print("\n\n Error: \(String(describing: error))")
            } else {
                let resultDic = result as! NSDictionary
                print("\n\n  fetched user: \(String(describing: result))")
                if (resultDic.value(forKey:"name") != nil) {
                    let userName = resultDic.value(forKey:"name")! as! String
                    print("\n User Name is: \(String(describing: userName))")
                }
                
                if (resultDic.value(forKey:"email") != nil) {
                    let userEmail = resultDic.value(forKey:"email")! as! String
                    print("\n User Email is: \(String(describing: userEmail))")
                }
            }
        })
    }
    
    
    
    
    @objc func keyboardWillShowNotification(_ noti: Notification) {
        guard let userInfo = noti.userInfo,
            let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect, //frame의 최종 위치
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
            else { return }
        
        if frame.origin.y >= UIScreen.main.bounds.height {
            //내려갔을 때
            self.view.transform = .identity
        } else {
            
            UIView.animate(withDuration: duration) {
                self.view.transform = .init(translationX: 0, y: -frame.height)
            }
        }
    }
    
    @objc private func tapGestureAction(_ gesture: UITapGestureRecognizer) {
        if pwTextField.isEditing {
            pwTextField.endEditing(true)
        } else if emailTextField.isEditing {
            emailTextField.endEditing(true)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
}


extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            // Create an account in your system.
            let userIdentifier = appleIDCredential.user
            let userFirstName = appleIDCredential.fullName?.givenName
            let userLastName = appleIDCredential.fullName?.familyName
            let userEmail = appleIDCredential.email
            print(userEmail, userFirstName, userLastName)
            
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            appleIDProvider.getCredentialState(forUserID: userIdentifier) { (credentialState, error) in
                switch credentialState {
                case .authorized:
                  self.navigationController?.popViewController(animated: true)
                case .revoked:
                    // The Apple ID credential is revoked. Show SignIn UI Here.
                    break
                case .notFound:
                    // No credential was found. Show SignIn UI Here.
                    break
                default:
                    break
                }
            }
            
            //Navigate to other view controller
        } else if let passwordCredential = authorization.credential as? ASPasswordCredential {
            // Sign in using an existing iCloud Keychain credential.
            let username = passwordCredential.user
            let password = passwordCredential.password
            
            //Navigate to other view controller
        }
        
        
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("AppleLogin Error :", error.localizedDescription)
    }
}
