//
//  ViewController.swift
//  DocumentDistance
//
//  Created by Sahil Gangele on 12/29/17.
//  Copyright © 2017 Sahil Gangele. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var documentDistanceLabel: UILabel!
    
    @IBOutlet weak var textViewOne: UITextView!
    @IBOutlet weak var textViewTwo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewOne.delegate = self
        textViewTwo.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.updateDocumentDistanceLabel(textViewOne: self.textViewOne, textViewTwo: self.textViewTwo)
    }
    
    func updateDocumentDistanceLabel(textViewOne: UITextView, textViewTwo: UITextView) {
        // Go to work on document distance
        let documentOne = Document(word: textViewOne.text)
        let documentTwo = Document(word: textViewTwo.text)
        let distance = Document.computeDistance(documentOne: documentOne, documentTwo: documentTwo)
        self.documentDistanceLabel.text = String(format: "%.2f", distance)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.updateDocumentDistanceLabel(textViewOne: self.textViewOne, textViewTwo: self.textViewTwo)
    }

}
