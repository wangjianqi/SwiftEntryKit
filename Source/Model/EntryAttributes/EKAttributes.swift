//
//  EKAttributes.swift
//  SwiftEntryKit
//
//  Created by Daniel Huri on 4/19/18.
//  Copyright (c) 2018 huri000@gmail.com. All rights reserved.
//

import Foundation
import UIKit

public struct EKAttributes {
    
    // MARK: Identification
    
    /**
     A settable **optional** name that matches the entry-attributes.
     - Nameless entries cannot be inquired using *SwiftEntryKit.isCurrentlyDisplaying(entryNamed: _) -> Bool*
     */
    public var name: String?
    
    // MARK: Display Attributes
    
    /** Entry presentation window level */
    ///层级:normal:0 statusBar:1000 alert:2000
    public var windowLevel = WindowLevel.statusBar
    
    /** The position of the entry inside the screen */
    ///弹框位置：上中下
    public var position = Position.top

    /** The display manner of the entry. */
    ///优先级
    public var precedence = Precedence.override(priority: .normal, dropEnqueuedEntries: false)
    
    /** Describes how long the entry is displayed before it is dismissed */
    ///展示时间
    public var displayDuration: DisplayDuration = 2 // Use .infinity for infinite duration
    
    /** The frame attributes of the entry */
    ///设置宽度和高度
    public var positionConstraints = PositionConstraints()
    
    // MARK: User Interaction Attributes
    
    /** Describes what happens when the user interacts the screen,
     forwards the touch to the application window by default */
    ///屏幕交互
    public var screenInteraction = UserInteraction.forward
    
    /** Describes what happens when the user interacts the entry,
     dismisses the content by default */
    ///弹框交互
    public var entryInteraction = UserInteraction.dismiss

    /** Describes the scrolling behaviour of the entry.
     The entry can be swiped out and in with an ability to spring back with a jolt */
    ///滑动
    public var scroll = Scroll.enabled(swipeable: true, pullbackAnimation: .jolt)
    
    /** Generate haptic feedback once the entry is displayed */
    ///反馈
    public var hapticFeedbackType = NotificationHapticFeedback.none
    
    /** Describes the actions that take place when the entry appears or is being dismissed */
    public var lifecycleEvents = LifecycleEvents()
    
    // MARK: Theme & Style Attributes
    
    /** The display mode of the entry */
    public var displayMode = DisplayMode.inferred
    
    /** Describes the entry's background appearance while it shows */
    ///弹框背景
    public var entryBackground = BackgroundStyle.clear
    
    /** Describes the background appearance while the entry shows */
    ///屏幕背景
    public var screenBackground = BackgroundStyle.clear
    
    /** The shadow around the entry */
    ///阴影
    public var shadow = Shadow.none
    
    /** The corner attributes */
    ///圆角
    public var roundCorners = RoundCorners.none
    
    /** The border around the entry */
    ///边框
    public var border = Border.none
    
    /** Preferred status bar style while the entry shows */
    public var statusBar = StatusBar.inferred
    
    // MARK: Animation Attributes
    
    /** Describes how the entry animates in */
    public var entranceAnimation = Animation.translation
    
    /** Describes how the entry animates out */
    public var exitAnimation = Animation.translation
    
    /** Describes the previous entry behaviour when a new entry with higher display-priority shows */
    public var popBehavior = PopBehavior.animated(animation: .translation)

    /** Init with default attributes */
    public init() {}
}
