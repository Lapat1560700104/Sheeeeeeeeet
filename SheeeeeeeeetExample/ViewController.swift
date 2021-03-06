//
//  ViewController.swift
//  SheeeeeeeeetExample
//
//  Created by Daniel Saidi on 2017-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 To make the example easier to overview, the view controller
 has been split up into many smaller files.
 
 Action sheet appearance is setup by `AppDelegate` using the
 `DemoAppearance` class. In a real
 
 should be configured as globally as
 possible, e.g. by a bootstrapper when the app starts. It is
 handled here to simplify understanding the example.
 
 
 */


import UIKit
import Sheeeeeeeeet

class ViewController: UIViewController {

    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPreviewHandling(with: .sheet)
    }
    
    
    // MARK: - Properties
    
    var actionSheet: ActionSheet?
    
    var actionSheetPeekHandler: ActionSheetPeekHandler?
    
    var tableViewOptions: [TableViewOption] = [
        .standard,
        .singleSelect,
        .multiSelect,
        .toggle,
        .links,
        .headerView,
        .sections,
        .danger,
        .peekPop,
        .peekPopSheet,
        .peekPopHeader
    ]
    
    func foodOptions() -> [FoodOption] {
        return [.fast, .light, .homeMade, .fancy, .none]
    }
    
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView? {
        didSet {
            tableView?.delegate = self
            tableView?.dataSource = self
        }
    }
}


// MARK: - Public Functions

extension ViewController {
    
    func handleNonSheetOption(_ option: TableViewOption) {
        switch option {
        case .peekPopHeader: setupPreviewHandling(with: .header)
        case .peekPopSheet: setupPreviewHandling(with: .sheet)
        default: break
        }
        alert(option: option)
    }
    
    func setupPreviewHandling(with peekBehavior: ActionSheetPeekBehavior) {
        guard let view = tableView else { return }
        actionSheetPeekHandler = ActionSheetPeekHandler(
            in: self,
            peekSource: self,
            sourceView: view,
            peekBehavior: peekBehavior)
    }
}
