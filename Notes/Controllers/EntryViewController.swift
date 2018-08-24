//
//  EntryViewController.swift
//  Notes
//
//  Created by Levi Linchenko on 24/08/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController {
    
    var entry: Entry?
    
    
    @IBOutlet weak var entryText: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    
    func updateViews(){
        guard let entry = entry else {return}
        entryText.text = entry.bodyText
    }
    
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard entryText.text != nil else {return}
        guard let entryText = entryText.text else {return}
        
        if let entry = entry{
            EntryController.shared.update(entryText: entry, bodyText: entryText)
        } else {
            EntryController.shared.create(entryText: entryText)
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    
    
}
