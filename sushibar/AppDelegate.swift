//
//  AppDelegate.swift
//  sushibar
//
//  Created by mzp on 2016/10/29.
//  Copyright © 2016 mzp. All rights reserved.
//

import Cocoa

fileprivate extension NSTouchBarItemIdentifier {
    static let kome = NSTouchBarItemIdentifier("jp.mzp.touchbar.kome")
    static let fish = NSTouchBarItemIdentifier("jp.mzp.touchbar.fish")
    static let sushi = NSTouchBarItemIdentifier("jp.mzp.touchbar.sushi")
//    static let lane = NSTouchBarItemIdentifier("jp.mzp.touchbar.lane")
    static let komelane = NSTouchBarItemIdentifier("jp.mzp.touchbar.lane.kome")
    static let fishlane = NSTouchBarItemIdentifier("jp.mzp.touchbar.lane.fish")
    static let sushilane = NSTouchBarItemIdentifier("jp.mzp.touchbar.lane.sushi")
}

@available(OSX 10.12.2, *)
@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSTouchBarProvider, NSTouchBarDelegate {

    @IBOutlet weak var window: NSWindow!
    var touchBar: NSTouchBar?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.title = "🍣"

        if let frame = window.contentView?.frame {
            let sushi = NSTextView(frame: NSMakeRect(frame.size.width/2-64, frame.size.height/2-64, 150, 128))
            sushi.string = "🍣"
            sushi.drawsBackground = false
            sushi.isEditable = false
            sushi.isSelectable = false
            sushi.font = NSFont.systemFont(ofSize: 128)
            window.contentView?.addSubview(sushi)
        }

        self.touchBar = makePrimaryTouchBar()
    }


    func makePrimaryTouchBar() -> NSTouchBar {
        let mainBar = NSTouchBar()
        mainBar.delegate = self
        mainBar.defaultItemIdentifiers = [.kome, .fish, .sushi]
        return mainBar
    }

    func makeSecondaryTouchBar(tLane _lane:NSTouchBarItemIdentifier) -> NSTouchBar {
        let mainBar = NSTouchBar()
        mainBar.delegate = self
        mainBar.defaultItemIdentifiers = [_lane]
        return mainBar
    }

    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        if identifier == .kome {
            let item = NSPopoverTouchBarItem(identifier: identifier)
            item.collapsedRepresentationLabel = "🍚"
            item.popoverTouchBar = makeSecondaryTouchBar(tLane: .komelane)
            return item
        } else if identifier == .fish {
            let item = NSPopoverTouchBarItem(identifier: identifier)
            item.collapsedRepresentationLabel = "🐟"
            item.popoverTouchBar = makeSecondaryTouchBar(tLane: .fishlane)
            return item
        }else if identifier == .sushi {
            let item = NSPopoverTouchBarItem(identifier: identifier)
            item.collapsedRepresentationLabel = "🍣"
            item.popoverTouchBar = makeSecondaryTouchBar(tLane: .sushilane)
            return item
        } else if identifier == .sushilane {
            let item = NSCustomTouchBarItem(identifier: identifier)
            let sushiLaneVC = SushiLaneController()
            sushiLaneVC.setStr(str:"🍣")
            item.viewController = sushiLaneVC
            return item
        } else if identifier == .fishlane {
            let item = NSCustomTouchBarItem(identifier: identifier)
            let sushiLaneVC = SushiLaneController()
            sushiLaneVC.setStr(str:"🐟")
            item.viewController = sushiLaneVC
            return item
        } else if identifier == .komelane {
            let item = NSCustomTouchBarItem(identifier: identifier)
            let sushiLaneVC = SushiLaneController()
            sushiLaneVC.setStr(str:"🍚")
            item.viewController = sushiLaneVC
            return item
        } else {
            return nil
        }
    }

    @objc
    func tapped(_ sender : NSObject) {
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

