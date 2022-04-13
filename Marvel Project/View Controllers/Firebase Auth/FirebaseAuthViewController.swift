////
////  FirebaseAuthViewController.swift
////  Marvel Project
////
////  Created by Guido Mola on 11/04/2022.
////
//import Firebase
//import FirebaseAuthUI
//import FirebaseEmailAuthUI
//
//import Foundation
//
//class FirebaseAuthViewController: UIViewController, FUIAuthDelegate{
//    fileprivate(set) var auth:Auth?
//    fileprivate(set) var authUI: FUIAuth? //only set internally but get externally
//    fileprivate(set) var authStateListenerHandle: AuthStateDidChangeListenerHandle?
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Do any additional setup after loading the view, typically from a nib.
//        self.auth = Auth.auth()
//        self.authUI = FUIAuth.defaultAuthUI()
//        self.authUI?.delegate = self
////        self.authUI?.providers = [FUIPhoneAuth(authUI: self.authUI!),]
//        
//        
//        self.authStateListenerHandle = self.auth?.addStateDidChangeListener { (auth, user) in
//            guard user != nil else {
//                self.loginAction(sender: self)
//                return
//            }
//        }
//    }
//    
//    @IBAction func loginAction(sender: AnyObject) {
//        // Present the default login view controller provided by authUI
//        let authViewController = authUI?.authViewController();
//        self.present(authViewController!, animated: true, completion: nil)
//        
//    }
//    
//    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
//        guard let authError = error else { return }
//        
//        let errorCode = UInt((authError as NSError).code)
//        
//        switch errorCode {
//            case FUIAuthErrorCode.userCancelledSignIn.rawValue:
//                print("User cancelled sign-in");
//                break
//                
//            default:
//                let detailedError = (authError as NSError).userInfo[NSUnderlyingErrorKey] ?? authError
//                print("Login error: \((detailedError as! NSError).localizedDescription)");
//        }
//    }
//}
////
////    private let nameLabel: UILabel = {
////        let label = UILabel()
////        label.backgroundColor = .systemFill
////        label.textAlignment = .center
////        return label
////    }()
////
////    private let logOutButton: UIButton = {
////        let button = UIButton()
////        button.backgroundColor = .systemRed
////        button.setTitle("Log out", for: .normal)
////        return button
////    }()
////
////    override func viewWillAppear(_ animated: Bool) {
////        Auth.auth().addStateDidChangeListener { (auth, user) in
////            if let user = user {
////                self.showUserInfo(user:user)
////            } else {
////                self.showLoginVC()
////            }
////        }
////    }
////
////
////    func showUserInfo(user:User) {
////
////        nameLabel.frame = CGRect(x: 20, y: view.bounds.height / 3, width: view.bounds.width - 40, height: 50)
////        logOutButton.frame = CGRect(x: 20, y: view.bounds.height / 3 + 50,  width: view.bounds.width - 40, height: 50)
////        view.addSubview(nameLabel)
////        view.addSubview(logOutButton)
////    }
////
////    func showLoginVC() {
////        let authUI = FUIAuth.defaultAuthUI()
////        let providers = [FUIEmailAuth()]
////        authUI?.providers = providers
////        let authViewController = authUI!.authViewController()
////        self.present(authViewController, animated: true, completion: nil)
////    }
////
////}
