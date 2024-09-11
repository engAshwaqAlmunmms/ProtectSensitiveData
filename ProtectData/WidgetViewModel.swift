//
//  WidgetViewModel.swift
//  ProtectData
//
//  Created by Dev.SHooooooQ on 04/03/1446 AH.
//

import Foundation

class WidgetViewModel: ObservableObject {
    
    @Published var widgetText: WidgetText?
    @Published var errorMessage: String?
    
    func loadWidget() {
        encodeJson()
        self.widgetText = self.decodeJson()
        
    }
    
    private func fileURL() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("widget.json")
    }
    
    private func encodeJson() {
        let widgetText = WidgetText(data: "Hello, World!", size: 12, style: "bold", name: "Text1", hOffset: 30, vOffset: 40, alignment: "left", onMouseUp: "action()")
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted // Optional: to make the JSON output more readable
        do {
            let jsonData = try encoder.encode(widgetText)
            let path = fileURL()
            try jsonData.write(to: path, options: .completeFileProtectionUnlessOpen)
            fileExists()
            checkFileProtection()
            print("JSON file successfully written to: \(path)")
            
        } catch {
            self.errorMessage = "Error encoding or writing JSON: \(error)"
            print("Error encoding or writing JSON: \(error)")
        }
    }
    
    private func decodeJson() -> WidgetText? {
        let fileURL = fileURL()
        do {
            // Read the JSON data from the file
            let jsonData = try Data(contentsOf: fileURL)
            
            let decoder = JSONDecoder()
            
            // Decode the JSON data into an instance of Text
            let widget = try decoder.decode(WidgetText.self, from: jsonData)
            // Print the decoded object
            print("Decoded Text object: \(widget)")
            return widget
        } catch {
            self.errorMessage = "Error reading or decoding JSON: \(error)"
            print("Error reading or decoding JSON: \(error)")
            return nil
        }
    }
    
    func fileExists() {
        let fileURL = fileURL()
        if FileManager.default.fileExists(atPath: fileURL.path) {
            print("File exists.")
        } else {
            self.errorMessage = "File does not exist."
            print("File does not exist.")
        }
    }
    
    private func DeleteFile() {
        let fileURL = fileURL()
        do {
            try FileManager.default.removeItem(at: fileURL)
            print("File deleted successfully.")
        } catch {
            self.errorMessage = "Error deleting file: \(error)"
            print("Error deleting file: \(error)")
        }
    }
    
    func checkFileProtection() {
        //USE REAL DEVICE
        let fileURL = fileURL()
        
        do {
            let fileAttributes = try FileManager.default.attributesOfItem(atPath: fileURL.path)
            print("File attributes: \(fileAttributes)")
            if let fileProtection = fileAttributes[FileAttributeKey.protectionKey] {
                print("File protection: \(fileProtection)")
            } else {
                print("File protection attribute not found")
            }
        } catch {
            print("Error retrieving file attributes: \(error)")
        }
    }
}
