//
//  ViewController.swift
//  CustomActionlistTextViewDemonstration
//
//  Created by Peter Ivanics on 29/01/16.
//  Copyright © 2016 peterivanics. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var normalTextView: CustomActionlistUITextView!;
    @IBOutlet weak var copyOnlyTextView: CustomActionlistUITextView!;
    @IBOutlet weak var readOnlyTextView: CustomActionlistUITextView!;
    @IBOutlet weak var everythingButCutTextView: CustomActionlistUITextView!;
    @IBOutlet weak var pasteAndSelectTextView: CustomActionlistUITextView!;
    
    override func viewDidLoad()
    {
        super.viewDidLoad();
        
        self.configureTextViews();
    }
    
    /**
     Cancels editing the view, dismisses the keyboard. Called when the user taps on the view.
     
     - parameter touches: A set of UITouch instances that represent the touches for the starting phase of the event represented by event.
     - parameter event:   An object representing the event to which the touches belong.
     
     - Author: Peter Ivanics
     - Date: 29.01.2016.
     */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    // MARK: - Private functions
    private func configureTextViews()
    {
        self.configureCopyOnlyTextView();
        self.configureReadOnlyTextView();
        self.configureEverythingButCutTextView();
        self.configurePasteAndSelectTextView();
    }
    
    private func configureCopyOnlyTextView()
    {
        self.copyOnlyTextView.setAllActions(false);
        self.copyOnlyTextView.setCopy(true);
    }
    
    private func configureReadOnlyTextView()
    {
        self.readOnlyTextView.setAllActions(false);
    }
    
    private func configureEverythingButCutTextView()
    {
        self.everythingButCutTextView.setCut(false);
    }
    
    private func configurePasteAndSelectTextView()
    {
        self.pasteAndSelectTextView.setAllActions(false);
        self.pasteAndSelectTextView.setPaste(true);
        self.pasteAndSelectTextView.setSelect(true);
        self.pasteAndSelectTextView.setSelectAll(true);
    }
}

