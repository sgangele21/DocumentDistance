//
//  Document.swift
//  DocumentDistance
//
//  Created by Sahil Gangele on 1/2/18.
//  Copyright © 2018 Sahil Gangele. All rights reserved.
//

import Darwin

public class Document {
    
    var count: Int {
        return self.words.count
    }
    var freqencies: [String : Int] {
        var frequencyDict: [String : Int] = [:]
        for word in words {
            if let frequency = frequencyDict[String(word)] {
                frequencyDict[String(word)] = frequency + 1
            } else {
                frequencyDict[String(word)] = 1
            }
        }
        return frequencyDict
    }
    var words: [Substring]
    
    // It accepts a string of alphanumerics
    public init(word: String) {
        self.words = word.split(separator: " ")
    }
    
    
    static func computeInnerProduct(documentOne: Document, documentTwo: Document) -> Double {
        // You look at the frequencies of each word as a component of the vector
        var product: Double = 0.0
        // Iterate through all the words in documentOne
        for (word,_) in documentOne.freqencies {
            // If word is in both documents, compute dot product
            if let documentTwoWordFrequency = documentTwo.freqencies[word], let documentOneWordFrequency = documentOne.freqencies[word] {

                product += Double(documentOneWordFrequency * documentTwoWordFrequency)
                
            }
        }
        return product
    }
    
    static func computeMagnitude(document: Document) -> Double {
        // Computing magnitude is simply taking each components of the vector, squaring it, and summing them all together
        // This is the equivalent of finding dot product of it's own vector
        return pow(computeInnerProduct(documentOne: document, documentTwo: document), 0.5)
        //return sqrt(computeInnerProduct(documentOne: document, documentTwo: document))
    }
    
    static func computeVectorAngle(documentOne: Document, documentTwo: Document) -> Double {
        let numerator: Double = computeInnerProduct(documentOne: documentOne, documentTwo: documentTwo)
        let denominator: Double = computeMagnitude(document: documentOne) * computeMagnitude(document: documentTwo)
        let angle = acos(numerator / denominator)
        // Convert to degrees
        return (angle * 180.0) / Double.pi
    }
    
    static func computeDistance(documentOne: Document, documentTwo: Document) -> Double {
        return computeVectorAngle(documentOne: documentOne, documentTwo: documentTwo)
    }
 
}

