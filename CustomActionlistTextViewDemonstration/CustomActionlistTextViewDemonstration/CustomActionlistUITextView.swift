//
//  CustomActionlistUITextView.swift
//  Reslink
//
//  Created by Peter Ivanics on 22/01/16.
//  Copyright © 2016 Peter Ivanics. All rights reserved.
//

import UIKit

/// A custom UITextView class that allows enabling and disabling UIResponderStandardEditActions to be performed on it. By default all the actions are enabled.
class CustomActionlistUITextView: UITextView
{
    // MARK: - Variables
    /// Contains the list of enabled actions on the TextView.
    private var enabledActions: [Selector] = [
        "paste:",
        "copy:",
        "cut:",
        "select:",
        "selectAll:",
        "_promptForReplace:",
        "_transliterateChinese:",
        "_showTextStyleOptions:",
        "_define:",
        "_addShortcut:",
        "_accessibilitySpeak:",
        "_accessibilitySpeakLnaguageSelection",
        "_accessibilityPauseSpeaking",
        "_share:",
        "makeTextWritingDirectionRightToLeft:",
        "makeTextWritingDirectionLeftToRight:"
    ];
    
    // MARK: - Overriden event handlers
    /**
     Requests the receiving responder to enable or disable the specified command in the user interface.
     
     - parameter action: A selector that identifies a method associated with a command. For the editing menu, this is one of the editing methods declared by the UIResponderStandardEditActions informal protocol (for example, copy:).
     - parameter sender: The object calling this method. For the editing menu commands, this is the shared UIApplication object. Depending on the context, you can query the sender for information to help you determine whether a command should be enabled.
     
     - returns: YES if the the command identified by action should be enabled or NO if it should be disabled.
     
     - Author: Peter Ivanics
     - Date: 22.01.2016.
     */
    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool
    {
        if !self.enabledActions.contains(action)
        { return false; }
        
        return true;
    }
    
    // MARK: - Setter functions
    /**
     Sets the status of the paste action.
     
     - parameter enabled: The flag indicating the action's status. If true, the action can be performed on the TextView, otherwise it is disabled.
     
     - Author: Peter Ivanics
     - Date: 22.01.2016.
     */
    func setPaste(enabled: Bool)
    {
        self.setAction("paste:", enabled: enabled);
    }
    
    /**
     Sets the status of the copy action.
     
     - parameter enabled: The flag indicating the action's status. If true, the action can be performed on the TextView, otherwise it is disabled.
     
     - Author: Peter Ivanics
     - Date: 22.01.2016.
     */
    func setCopy(enabled: Bool)
    {
        self.setAction("copy:", enabled: enabled);
    }
    
    /**
     Sets the status of the cut action.
     
     - parameter enabled: The flag indicating the action's status. If true, the action can be performed on the TextView, otherwise it is disabled.
     
     - Author: Peter Ivanics
     - Date: 22.01.2016.
     */
    func setCut(enabled: Bool)
    {
        self.setAction("cut:", enabled: enabled);
    }
    
    /**
     Sets the status of the select action.
     
     - parameter enabled: The flag indicating the action's status. If true, the action can be performed on the TextView, otherwise it is disabled.
     
     - Author: Peter Ivanics
     - Date: 22.01.2016.
     */
    func setSelect(enabled: Bool)
    {
        self.setAction("select:", enabled: enabled);
    }
    
    /**
     Sets the status of the selectAll action.
     
     - parameter enabled: The flag indicating the action's status. If true, the action can be performed on the TextView, otherwise it is disabled.
     
     - Author: Peter Ivanics
     - Date: 22.01.2016.
     */
    func setSelectAll(enabled: Bool)
    {
        self.setAction("selectAll:", enabled: enabled);
    }
    
    /**
     Sets the status of the share action.
     
     - parameter enabled: The flag indicating the action's status. If true, the action can be performed on the TextView, otherwise it is disabled.
     
     - Author: Peter Ivanics
     - Date: 22.01.2016.
     */
    func setShare(enabled: Bool)
    {
        self.setAction("_share:", enabled: enabled);
    }
    
    /**
     Sets the status of the define action.
     
     - parameter enabled: The flag indicating the action's status. If true, the action can be performed on the TextView, otherwise it is disabled.
     
     - Author: Peter Ivanics
     - Date: 22.01.2016.
     */
    func setDefine(enabled: Bool)
    {
        self.setAction("_define:", enabled: enabled);
    }
    
    /**
     Sets the status of actions.
     
     - parameter enabled: The flag indicating the actions' status. If true, the actions can be performed on the TextView, otherwise they are disabled.
     
     - Author: Peter Ivanics
     - Date: 22.01.2016.
     */
    func setAllActions(enabled: Bool)
    {
        if enabled
        {
            self.enabledActions = [
                "paste:",
                "copy:",
                "cut:",
                "select:",
                "selectAll:",
                "_promptForReplace:",
                "_transliterateChinese:",
                "_showTextStyleOptions:",
                "_define:",
                "_addShortcut:",
                "_accessibilitySpeak:",
                "_accessibilitySpeakLnaguageSelection",
                "_accessibilityPauseSpeaking",
                "_share:",
                "makeTextWritingDirectionRightToLeft:",
                "makeTextWritingDirectionLeftToRight:"
            ];
        }
        else
            { self.enabledActions = []; }
    }
    
    // MARK: - Private functions
    /**
    Sets the allowance to perform the provided action on the TextField.
    
    - parameter action:  The action to be set.
    - parameter enabled: The flag indicating the action's status. If true, the action can be performed on the TextView, otherwise it is disabled.
    
    - Author: Peter Ivanics
    - Date: 22.01.2016.
    */
    private func setAction(action: Selector, enabled: Bool)
    {
        if enabled && self.enabledActions.contains(action) == false
            { self.enabledActions.append(action); }
        else if enabled == false
        {
            if let index = self.enabledActions.indexOf(action)
                { self.enabledActions.removeAtIndex(index); }
        }
    }
}