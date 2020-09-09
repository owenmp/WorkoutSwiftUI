//
//  CardioStruct.swift
//  WorkoutCreator
//
//  Created by Owen Malcolmson-Priest on 27/08/2020.
//  Copyright © 2020 Owen Malcolmson-Priest. All rights reserved.
//

import Foundation



struct workout: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var days: [String]
    var repeatEvery = 0
    var cardioExercises : [cardio] = []
    var strengthExercises : [strength] = []
    var flexibilityExercises : [flexibility] = []
    
}

struct flexibility: Identifiable, Codable {
    let id = UUID()
    var name: String
    var description: String
    var reps: Int
    var sets: Int
    var timeHeld: Int
    var equipment: String
}

struct strength: Identifiable, Codable {
    let id = UUID()
    var name: String
    var description: String
    var sets: Int
    var reps: Int
    var weight: Double
    var equipment: String

}


struct cardio: Identifiable, Codable {
    let id = UUID()
    var name: String
    var description: String
    var hours: Int
    var minutes: Int
    var distance : Double
    var equipmentNeeded: String
}

private let _hiddenSharedInstance = db()

class db: ObservableObject {
    var cardioList: [cardio] = []

    //@ObservableObject var car = [cardio]()
    var strengthList: [strength] = []
    var flexibilityList: [flexibility] = []
    @Published var cardioForWorkout : [cardio] = []
    @Published var flexibilityForWorkout : [flexibility] = []
    @Published var strengthForWorkout : [strength] = []
    @Published var daysRepeated : [String] = []

    class var sharedInstance: db{
           return _hiddenSharedInstance;
       }
    
    init(){
        
        getCardioList()
        getStrengthList()
        getFlexibilityList()
       
    }

    
    /**
     Save structs using JSON
     */
func saveCardioList(){
       
       let readListURL = urlToFileInDocuments("bookmarkList.list")
       let encoder = PropertyListEncoder()
       encoder.outputFormat = .xml
       if let data = try? encoder.encode(cardioList){
           print("Encoded Data To Be Written:")
           print(String(data: data,encoding: .utf8)!)
           try? data.write(to: readListURL, options: .noFileProtection)
       } else{
           print("Does not work")}
       
   }
    
    
    func saveStrengthList(){
        
        let readListURL = urlToFileInDocuments("strengthList.list")
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        if let data = try? encoder.encode(strengthList){
            print("Encoded Data To Be Written:")
            print(String(data: data,encoding: .utf8)!)
            try? data.write(to: readListURL, options: .noFileProtection)
        } else{
            print("Does not work")}
        
    }
    
    func saveFlexibilityList(){
        
        let readListURL = urlToFileInDocuments("flexibilityList.list")
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        if let data = try? encoder.encode(flexibilityList){
            print("Encoded Data To Be Written:")
            print(String(data: data,encoding: .utf8)!)
            try? data.write(to: readListURL, options: .noFileProtection)
        } else{
            print("Does not work")}
        
    }
    
    
    
    
    
    

func cardioFileExistsInDocs( _ fileName: String ) -> Bool {
    let fileManager = FileManager.default
    let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
    let docsDir = dirPaths[0]
    let filepathName = docsDir + "/\(fileName)"
    return fileManager.fileExists(atPath: filepathName)
}

func urlToFileInDocuments( _ fileName: String ) -> URL {
    let docDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let fileURL = docDirectory.appendingPathComponent(fileName)
    print(fileURL)
    return fileURL
}
    
    
    
    
    
    func getCardioList(){
           if cardioFileExistsInDocs("bookmarkList.list"){
               let readListURL = urlToFileInDocuments("bookmarkList.list")
               if let dataFromFile = try? Data(contentsOf: readListURL){
                   let decoder = PropertyListDecoder()
                   if let title = try? decoder.decode([cardio].self, from: dataFromFile){
                       cardioList = title

                   }
               }
           } else {
               saveCardioList()
           }
       }
    
    
    func getStrengthList(){
           if cardioFileExistsInDocs("strengthList.list"){
               let readListURL = urlToFileInDocuments("strengthList.list")
               if let dataFromFile = try? Data(contentsOf: readListURL){
                   let decoder = PropertyListDecoder()
                   if let title = try? decoder.decode([strength].self, from: dataFromFile){
                       strengthList = title

                   }
               }
           } else {
               saveStrengthList()
           }
       }
    
    func getFlexibilityList(){
           if cardioFileExistsInDocs("flexibilityList.list"){
               let readListURL = urlToFileInDocuments("flexibilityList.list")
               if let dataFromFile = try? Data(contentsOf: readListURL){
                   let decoder = PropertyListDecoder()
                   if let title = try? decoder.decode([flexibility].self, from: dataFromFile){
                       flexibilityList = title

                   }
               }
           } else {
               saveFlexibilityList()
           }
       }
    
    
    
    
    
    
    
    
    

}

