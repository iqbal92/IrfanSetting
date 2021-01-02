//
//  CompanyViewController.m
//  SettingScreen
//
//  Created by Pixster Macmini2 on 17/10/17.
//  Copyright © 2017 irfan pathan. All rights reserved.
//

#import "CompanyViewController.h"

@interface CompanyViewController ()

@end

@implementation CompanyViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _CompanyDetail.backgroundColor = [UIColor whiteColor];
    
    self.title = _CompanyTitle;
    
    NSURL *websiteUrl = [NSURL URLWithString:_CompanyUrl];
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:websiteUrl];
    
    [_CompanyDetail loadRequest:urlRequest];
}

-(IBAction)onTapCancel:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
    func setNotificationEndFast(identifire : Int) {
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["sdfsdfds"])
        
        let content = UNMutableNotificationContent()
        content.title = "sdfd"
        content.categoryIdentifier = "sdfsdf"
        content.body = "sdfsdfsdf"
        content.sound = UNNotificationSound.default
        
        let triggerDateComponent = Calendar.current.dateComponents([.day, .hour, .minute], from: Date().addHours(identifire))
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComponent, repeats: false)
        
        let request = UNNotificationRequest(identifier: "fast end", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { (error) in
           if error != nil {
               print(error!)
               
           } else {
               print("\(request.description)")
           }
       })
    }
*/


/*
GET PENDING NOTIFICATION
center.getPendingNotificationRequests { (notifications) in
            print("Count: \(notifications.count)")
                
            for item in notifications {
                
                let id = item.identifier
                let time = item.content
                let categoryId = time.categoryIdentifier
                print(time)
                print("id: \(id)")
                guard let trigger = item.trigger as? UNCalendarNotificationTrigger else { return }
                var day = trigger.dateComponents.weekday
                let nextFireDate = trigger.nextTriggerDate()
                let title = item.content.body
                }
   }

*/

/*
        //Attributed text view with privacy policy link (clickable textview)

        let attributedString = NSMutableAttributedString(string: "By continueing you agree terms and conditions and the privacy policy")

        attributedString.addAttribute(.link, value: "https://pixsterstudio.com/privacy-policy.html", range: (attributedString.string as NSString).range(of: "terms and conditions"))

        attributedString.addAttribute(.link, value: "https://pixsterstudio.com/terms-of-use.html", range: (attributedString.string as NSString).range(of: "privacy policy"))

        textview.backgroundColor = UIColor(named: "newBGColor")
        textview.textAlignment = .center
        textview.linkTextAttributes = [ NSAttributedString.Key.foregroundColor: UIColor.blue]
        textview.attributedText = attributedString
        textview.delegate = self
        textview.isSelectable = true
        textview.isEditable = false
        textview.delaysContentTouches = false
        textview.isScrollEnabled = false
        textview.font = UIFont(name: "AvenirNext-Regular", size: 10)

        func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {

            if URL.scheme == "terms" {
                print("---- TERMS & CONDITION -----")
                return false
            } else  if URL.scheme == "privacy"{
                print("---- PRIVACY & POLICY -----")
                 return false
            }
            return true
        }

*/

PC
/*
    
import UIKit
import AudioToolbox
import LocalAuthentication
import Valet
public enum ALConstants {
    static let nibName = "AppLocker"
    static let kPincode = "pincode" // Key for saving pincode to keychain
    static let kLocalizedReason = "Unlock with sensor" // Your message when sensors must be shown
    static let duration = 0.3 // Duration of indicator filling
    static let maxPinLength = 4
    
    enum button: Int {
        case delete = 1000
        case cancel = 1001
    }
}
public typealias onSuccessfulDismissCallback = (_ mode: ALMode?) -> () // Cancel dismiss will send mode as nil
public typealias onFailedAttemptCallback = (_ mode: ALMode) -> ()
public struct ALOptions { // The structure used to display the controller
    public var title: String?
    public var subtitle: String?
    public var image: UIImage?
    public var color: UIColor?
    public var isSensorsEnabled: Bool?
    public var onSuccessfulDismiss: onSuccessfulDismissCallback?
    public var onFailedAttempt: onFailedAttemptCallback?
    public init() {}
}
public enum ALMode { // Modes for AppLocker
    case validate
    case change
    case deactive
    case create
}
public class AppLocker: UIViewController {
    
    // MARK: - Top view
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var submessageLabel: UILabel!
    @IBOutlet var pinIndicators: [Indicator]!
    @IBOutlet weak var cancelButton: UIButton!
    
    static let valet = Valet.valet(with: Identifier(nonEmpty: "Druidia")!, accessibility: .whenUnlockedThisDeviceOnly)
    // MARK: - Pincode
    private var onSuccessfulDismiss: onSuccessfulDismissCallback?
    private var onFailedAttempt: onFailedAttemptCallback?
    private let context = LAContext()
    private var pin = "" // Entered pincode
    private var reservedPin = "" // Reserve pincode for confirm
    private var isFirstCreationStep = true
//    private var savedPin: String? {
//        get {
//            return AppLocker.valet.string(forKey: ALConstants.kPincode)
//        }
//        set {
//            guard let newValue = newValue else { return }
//            AppLocker.valet.set(string: newValue, forKey: ALConstants.kPincode)
//        }
//    }
    private var savedPin: String? {
       get {
         return UserDefaults.standard.string(forKey: ALConstants.kPincode)
       }
       set {
         UserDefaults.standard.set(newValue, forKey: ALConstants.kPincode)
       }
     }
    public override func viewDidLoad() {
        super.viewDidLoad()
        // https://stackoverflow.com/questions/56459329/disable-the-interactive-dismissal-of-presented-view-controller-in-ios-13
        modalPresentationStyle = .fullScreen
    }
    
    fileprivate var mode: ALMode = .validate {
        didSet {
            switch mode {
            case .create:
                submessageLabel.text = "Create your passcode" // Your submessage for create mode
            case .change:
                submessageLabel.text = "Enter your passcode" // Your submessage for change mode
            case .deactive:
                submessageLabel.text = "Enter your passcode" // Your submessage for deactive mode
            case .validate:
                submessageLabel.text = "Enter your passcode" // Your submessage for validate mode
                cancelButton.isHidden = true
                isFirstCreationStep = false
            }
        }
    }
    
    private func precreateSettings () { // Precreate settings for change mode
        mode = .create
        clearView()
    }
    
    private func drawing(isNeedClear: Bool, tag: Int? = nil) { // Fill or cancel fill for indicators
        let results = pinIndicators.filter { $0.isNeedClear == isNeedClear }
        let pinView = isNeedClear ? results.last : results.first
        pinView?.isNeedClear = !isNeedClear
        
        UIView.animate(withDuration: ALConstants.duration, animations: {
            pinView?.backgroundColor = isNeedClear ? .clear : .white
        }) { _ in
            isNeedClear ? self.pin = String(self.pin.dropLast()) : self.pincodeChecker(tag ?? 0)
        }
    }
    
    private func pincodeChecker(_ pinNumber: Int) {
        if pin.count < ALConstants.maxPinLength {
            pin.append("\(pinNumber)")
            if pin.count == ALConstants.maxPinLength {
                switch mode {
                case .create:
                    createModeAction()
                case .change:
                    changeModeAction()
                case .deactive:
                    deactiveModeAction()
                case .validate:
                    validateModeAction()
                }
            }
        }
    }
    
    // MARK: - Modes
    private func createModeAction() {
        if isFirstCreationStep {
            isFirstCreationStep = false
            reservedPin = pin
            clearView()
            submessageLabel.text = "Confirm your passcode"
        } else {
            confirmPin()
        }
    }
    
    private func changeModeAction() {
        if pin == savedPin {
            precreateSettings()
        } else {
            onFailedAttempt?(mode)
            incorrectPinAnimation()
        }
    }
    
    private func deactiveModeAction() {
        if pin == savedPin {
            removePin()
        } else {
            onFailedAttempt?(mode)
            incorrectPinAnimation()
        }
    }
    
    private func validateModeAction() {
        if pin == savedPin {
            dismiss(animated: true) {
                self.onSuccessfulDismiss?(self.mode)
            }
        } else {
            onFailedAttempt?(mode)
            incorrectPinAnimation()
        }
    }
    
    private func removePin() {
       // AppLocker.valet.removeObject(forKey: ALConstants.kPincode)
        UserDefaults.standard.removeObject(forKey: ALConstants.kPincode)
        dismiss(animated: true) {
            self.onSuccessfulDismiss?(self.mode)
        }
    }
    
    private func confirmPin() {
        if pin == reservedPin {
            savedPin = pin
            dismiss(animated: true) {
                self.onSuccessfulDismiss?(self.mode)
            }
        } else {
            onFailedAttempt?(mode)
            incorrectPinAnimation()
        }
    }
    
    private func incorrectPinAnimation() {
        pinIndicators.forEach { view in
            view.shake(delegate: self)
            view.backgroundColor = .clear
        }
        AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
    }
    
    fileprivate func clearView() {
        pin = ""
        pinIndicators.forEach { view in
            view.isNeedClear = false
            UIView.animate(withDuration: ALConstants.duration, animations: {
                view.backgroundColor = .clear
            })
        }
    }
    
    // MARK: - Touch ID / Face ID
    fileprivate func checkSensors() {
        if case .validate = mode {} else { return }
        
        var policy: LAPolicy = .deviceOwnerAuthenticationWithBiometrics // iOS 8+ users with Biometric and Custom (Fallback button) verification
        
        // Depending the iOS version we'll need to choose the policy we are able to use
        if #available(iOS 9.0, *) {
            // iOS 9+ users with Biometric and Passcode verification
            policy = .deviceOwnerAuthentication
        }
        
        var err: NSError?
        // Check if the user is able to use the policy we've selected previously
        guard context.canEvaluatePolicy(policy, error: &err) else {return}
        
        // The user is able to use his/her Touch ID / Face ID 👍
        context.evaluatePolicy(policy, localizedReason: ALConstants.kLocalizedReason, reply: {  success, error in
            if success {
                DispatchQueue.main.async { [weak self] in
                    guard let `self` = self else { return }
                    self.dismiss(animated: true) {
                        self.onSuccessfulDismiss?(self.mode)
                    }
                }
            }else {
                
            }
        })
    }
    
    // MARK: - Keyboard
    @IBAction func keyboardPressed(_ sender: UIButton) {
        switch sender.tag {
        case ALConstants.button.delete.rawValue:
            drawing(isNeedClear: true)
        case ALConstants.button.cancel.rawValue:
            clearView()
            dismiss(animated: true) {
                self.onSuccessfulDismiss?(nil)
            }
        default:
            drawing(isNeedClear: false, tag: sender.tag)
        }
    }
    
}
// MARK: - CAAnimationDelegate
extension AppLocker: CAAnimationDelegate {
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        clearView()
    }
}
// MARK: - Present
public extension AppLocker {
    // Present AppLocker
    class func present(with mode: ALMode, and config: ALOptions? = nil, over viewController: UIViewController? = nil) {
        let vc = viewController ?? UIApplication.shared.keyWindow?.rootViewController
        guard let root = vc,
            
            let locker = Bundle(for: self.classForCoder()).loadNibNamed(ALConstants.nibName, owner: self, options: nil)?.first as? AppLocker else {
                return
        }
        locker.messageLabel.text = config?.title ?? ""
        locker.submessageLabel.text = config?.subtitle ?? ""
        locker.view.backgroundColor = config?.color ?? .black
        locker.mode = mode
        locker.modalPresentationStyle = .fullScreen
        locker.onSuccessfulDismiss = config?.onSuccessfulDismiss
        locker.onFailedAttempt = config?.onFailedAttempt
        
        if config?.isSensorsEnabled ?? false {
            locker.checkSensors()
        }
        
        if let image = config?.image {
            locker.photoImageView.image = image
        } else {
            locker.photoImageView.isHidden = true
        }
        
        root.present(locker, animated: true, completion: nil)
    }
}


*/


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
