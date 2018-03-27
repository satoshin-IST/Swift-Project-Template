#!/usr/bin/swift
//
//  main.swift
//  Skelton
//
//  Created by 佐藤 慎 on 2018/01/19.
//  Copyright © 2018年 i-studio development team. All rights reserved.
//


import Foundation

// MARK: - Structs

struct Templates {
    static let projectName = "XLProjectName"
    static let bundleDomain = "XLOrganizationIdentifier"
    static let author = "XLAuthorName"
    static let userName = "XLUserName"
    static let organizationName = "XLOrganizationName"
}

struct ProjectSettings {
    var name: String
    var bundleDomain: String
    var author: String
    var userName: String
    var organizationName: String
}

// MARK: - Functions

public func printInfo<T>(message: T)  {
    print("\n-------------------Info:-------------------------")
    print("\(message)")
    print("--------------------------------------------------\n")
}

public func printErrorAndExit<T>(message: T) {
    print("\n-------------------Error:-------------------------")
    print("\(message)")
    print("--------------------------------------------------\n")
    exit(1)
}

public func shell(path: String, args: String...) -> (output: String, exitCode: Int32) {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.currentDirectoryPath = path
    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    task.waitUntilExit()
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as String? ?? ""
    return (output, task.terminationStatus)
}

public func prompt(message: String, defaultValue: String) -> String {
    print("\n> \(message) (or press Enter to use defaultValue is「\(defaultValue)」)")
    let line = readLine()
    return line == nil || line == "" ? defaultValue : line!
}

// MARK: - Extension

extension NSURL {
    var fileName: String? {
        var fileName: AnyObject?
        do {
            try getResourceValue(&fileName, forKey:  URLResourceKey.nameKey)
        } catch let error as NSError {
            printErrorAndExit(message: error.localizedDescription)
            return nil
        }
        return fileName as? String
    }
    
    var isDirectory: Bool {
        var isDirectory: AnyObject?
        do {
            try getResourceValue(&isDirectory, forKey:  URLResourceKey.isDirectoryKey)
        } catch let error as NSError {
            printErrorAndExit(message: error.localizedDescription)
            return false
        }
        return isDirectory as? Bool ?? false
    }
    
    func renameIfNeeded(_ projectName: String) {
        guard let fileName = fileName, let _ = fileName.range(of: Templates.projectName) else {
            return
        }
        let renamedFileName = fileName.replacingOccurrences(of: Templates.projectName, with: projectName)
        do {
            try FileManager.default.moveItem(at: self as URL, to: NSURL(fileURLWithPath: renamedFileName, relativeTo: deletingLastPathComponent) as URL)
        } catch let error as NSError {
            printErrorAndExit(message: error.localizedDescription)
        }
    }
    
    func updateContent(settings: ProjectSettings) {
        guard let path = path else {
            print("ERROR READING: \(self)")
            return
        }
        guard let content = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) else {
            return
        }
        
        var newContent = content.replacingOccurrences(of: Templates.projectName, with: settings.name)
        newContent = newContent.replacingOccurrences(of: Templates.bundleDomain, with: settings.bundleDomain)
        newContent = newContent.replacingOccurrences(of: Templates.author, with: settings.author)
        newContent = newContent.replacingOccurrences(of: Templates.userName, with: settings.userName)
        newContent = newContent.replacingOccurrences(of: Templates.organizationName, with: settings.organizationName)
        
        do {
            try newContent.write(to: self as URL, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("ERROR Write Content: \(self)")
        }
    }
}

// MARK: - Start Configure

var projectSettings = ProjectSettings(name: "ProjectName",
                                      bundleDomain: "jp.co.i-studio",
                                      author: "[開発者名]",
                                      userName: "Git UserName",
                                      organizationName: "HAKUHODO i-studio, Inc")

let fileManager = FileManager.default
let runScriptPathURL = NSURL(fileURLWithPath: fileManager.currentDirectoryPath, isDirectory: true)

guard let firstARG = CommandLine.arguments.first else {
    fatalError()
}

guard let path = NSURL(fileURLWithPath: firstARG, relativeTo: runScriptPathURL as URL).deletingLastPathComponent?.path else {
    fatalError()
}

let currentScriptPathURL = NSURL(fileURLWithPath: path, isDirectory: true)
let iOSProjectTemplateForlderURL = NSURL(fileURLWithPath: "Project-iOS", relativeTo: currentScriptPathURL as URL)
let ignoredFiles = [".DS_Store", "UserInterfaceState.xcuserstate"]

// MARK: - Start project Settings Input

print("\nLet's go over some question to generate your base project code!")

projectSettings.name = prompt(message: "Project name", defaultValue: projectSettings.name)

//Check if folder already exists
let newProjectFolderURL = NSURL(fileURLWithPath: projectSettings.name, relativeTo: runScriptPathURL as URL)
guard let newProjectFolderPath = newProjectFolderURL.path, !newProjectFolderPath.isEmpty  else {
    printErrorAndExit(message: "newProjectFolderPath failure Unwrapped or isEmpty")
    fatalError()
}
var isDirectory: ObjCBool = true
if fileManager.fileExists(atPath: newProjectFolderPath, isDirectory: &isDirectory){
    printErrorAndExit(message: "\(isDirectory.boolValue ? "folder already" : "file") exists in \(String(describing: runScriptPathURL.path)) directory, please delete it and try again")
}

projectSettings.bundleDomain = prompt(message: "Bundle domain", defaultValue: projectSettings.bundleDomain)
projectSettings.author       = prompt(message: "Author", defaultValue: projectSettings.author)
projectSettings.userName     = prompt(message: "Git username", defaultValue: projectSettings.userName)
projectSettings.organizationName = prompt(message: "Organization Name", defaultValue: projectSettings.organizationName)

// MARK: - Copy template folder to a new folder inside run script url called projectName

do {
    try fileManager.copyItem(at: iOSProjectTemplateForlderURL as URL, to: newProjectFolderURL as URL)
} catch let error as NSError {
    printErrorAndExit(message: error.localizedDescription)
}

// MARK: - Rename files and update content

let enumerator = fileManager.enumerator(at: newProjectFolderURL as URL, includingPropertiesForKeys: [.nameKey, .isDirectoryKey], options: [], errorHandler: nil)!
var directories = [NSURL]()

print("\nCreating \(projectSettings.name) ...")

for file in enumerator.allObjects {
    guard let fileURL = file as? NSURL else {
        print("unwrapped failure", file)
        continue
    }
    guard let fileName = fileURL.fileName,  !ignoredFiles.contains(fileName) else {
        continue
    }
    
    if fileURL.isDirectory {
        directories.append(fileURL)
    } else {
        fileURL.updateContent(settings: projectSettings)
        fileURL.renameIfNeeded(projectSettings.name)
    }
}

for fileURL in directories.reversed() {
    fileURL.renameIfNeeded(projectSettings.name)
}

//print("git init\n")
//print(shell(args: "git", "init").output)
//print("git add .\n")
//print(shell(args: "git", "add", ".").output)
//print("git commit -m 'Initial commit'\n")
//print(shell(args: "git", "commit", "-m", "'Initial commit'").output)
//print("git remote add origin git@github.com:\(userName)/\(projectName).git\n")
//print(shell(args: "git", "remote", "add", "origin", "git@github.com:\(userName)/\(projectName).git").output)

var name = projectSettings.name
print("newProjectFolderPath = \(newProjectFolderPath)")

print("carthage bootstrap --platform iOS --no-use-binaries --cache-builds")
print(shell(path: "/\(newProjectFolderPath)/\(name)", args: "carthage", "bootstrap", "--platform", "iOS","--no-use-binaries","--cache-builds").output)

print("pod install --project-directory=\(name) --no-repo-update\n")
print(shell(path: newProjectFolderPath, args: "pod", "install", "--project-directory=\(name)").output)


print("open \(name)/\(name).xcworkspace\n")
print(shell(path: newProjectFolderPath, args: "open", "\(name)/\(name).xcworkspace").output)
