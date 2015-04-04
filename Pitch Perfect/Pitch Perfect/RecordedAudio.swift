//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Paul Byrne on 20/03/2015.
//  Copyright (c) 2015 Paul Byrne. All rights reserved.
//

import Foundation

class RecordedAudio {
    
    var filePathURL:NSURL
    var title:String
    
    
    // Designated Initialiser
    init (filePathURL:NSURL,title:String){
        
        self.filePathURL = filePathURL
        self.title = title
        
    }
    
}