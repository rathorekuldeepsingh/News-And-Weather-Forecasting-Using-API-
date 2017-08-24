////
////  Swift.swift
////  News
////
////  Created by kuldeep singh on 7/14/17.
////  Copyright © 2017 kuldeep singh. All rights reserved.
////
//
//import Foundation
//open class SlideMenuController: UIViewController, UIGestureRecognizerDelegate {
//    
//    public enum SlideAction {
//        case open
//        case close
//    }
//    
//    public enum TrackAction {
//        case leftTapOpen
//        case leftTapClose
//        case leftFlickOpen
//        case leftFlickClose
//        case rightTapOpen
//        case rightTapClose
//        case rightFlickOpen
//        case rightFlickClose
//    }
//    
//    
//    struct PanInfo {
//        var action: SlideAction
//        var shouldBounce: Bool
//        var velocity: CGFloat
//    }
//    
//    open weak var delegate: SlideMenuControllerDelegate?
//    
//    open var opacityView = UIView()
//    open var mainContainerView = UIView()
//    open var leftContainerView = UIView()
//    open var rightContainerView =  UIView()
//    open var mainViewController: UIViewController?
//    open var leftViewController: UIViewController?
//    open var leftPanGesture: UIPanGestureRecognizer?
//    open var leftTapGesture: UITapGestureRecognizer?
//    open var rightViewController: UIViewController?
//    open var rightPanGesture: UIPanGestureRecognizer?
//    open var rightTapGesture: UITapGestureRecognizer?
//    
//    public required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
//    
//    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
//    
//    public convenience init(mainViewController: UIViewController, leftMenuViewController: UIViewController) {
//        self.init()
//        self.mainViewController = mainViewController
//        leftViewController = leftMenuViewController
//        initView()
//    }
//    
//    public convenience init(mainViewController: UIViewController, rightMenuViewController: UIViewController) {
//        self.init()
//        self.mainViewController = mainViewController
//        rightViewController = rightMenuViewController
//        initView()
//    }
//    
//    public convenience init(mainViewController: UIViewController, leftMenuViewController: UIViewController, rightMenuViewController: UIViewController) {
//        self.init()
//        self.mainViewController = mainViewController
//        leftViewController = leftMenuViewController
//        rightViewController = rightMenuViewController
//        initView()
//    }
//    
//    open override func awakeFromNib() {
//        initView()
//}
//}
