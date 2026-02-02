//
//  ViewController.swift
//  testingCode
//
//  Created by Deepinderpal Singh on 23/12/24.
//

import UIKit

class ViewController: UIViewController {
    //var arrData = [4,3,1,70,33]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // sorting Bubble sort
        //        for i in 0..<arrData.count{
        //            for j in 0..<(arrData.count-i-1){
        //                if arrData[j] > arrData[j+1]{
        //                    var temp = 0
        //                    temp = arrData[j+1]
        //                    arrData[j+1] = arrData[j]
        //                    arrData[j] = temp
        //
        //                }
        //            }
        //        }
        //        print(arrData)
        
        // patern   1
        for i in 1..<5{
            for _ in 1...i {
                print("*", terminator: " ")
            }
            print("")
        }
        print("\n")
        
        for i in 1...5{
            for _ in stride(from: 5, to: i, by: -1){
                print(terminator: " ")
            }
            for _ in 1...i{
                print("*", terminator: " ")
            }
            print(" ")
        }
        
        print("\n")
        
        for i in stride(from: 0, to: 6, by: 1){
            for j in stride(from: 0, to: i, by: 1){
                print(j, terminator: " ")
            }
            print("")
        }
        
        print("\n")
        
        for i in stride(from: 5, through: 0, by: -1){
            for j in stride(from: 5, through: i, by: -1){
                print(j,terminator: " ")
            }
            print("")
        }
        
        print("\n")
        
        var value = 0
        for i in 1...5{
            for _ in 1...i{
                value = value+1
                print(value,terminator: " ")
            }
            print("")
        }
        
        print("\n")
        
        for _ in 1...5{
            for _ in 1...5{
                print("*", terminator: " ")
            }
            print(" ", terminator: "\n")
        }
        print("\n")
        
        for i in 1...5{
            
            for _ in 1...i{
                print("*", terminator: " ")
            }
            print("", terminator: "\n")
        }
        
        print("\n")
        
        var value1 = 0
        for i in 1...5{
            for _ in 1...i{
                value1 = value1+1
                print(value1, terminator: " ")
            }
            print("")
        }
        
        print("\n")
        
        for i in 1...5{
            for j in 1...i{
                print(j, terminator: " ")
            }
            print("")
        }
        
        print("\n")
        
        for i in 1...5{
            for _ in 1...i{
                print(i, terminator: " ")
            }
            print("")
        }
        
        print("\n")
        
        for i in 1...5{
            for _ in i...5{
                print("*", terminator: "")
            }
            print("")
        }
        print("\n")
        
        for i in 1...5{
            for j in i...5{
                print(j, terminator: " ")
            }
            print("")
        }
        print("\n")
        
        for i in 1...5{
            for _ in i...5{
                print(i, terminator: " ")
            }
            print("")
        }
        
        print("\n")
        for i in 1...5{
            for _ in stride(from: 5, through: i, by: -1){
                print(terminator: " ")
            }
            for _ in 1...i{
                print("*", terminator: " ")
            }
            print("")
        }
        print("\n")
        for i in stride(from: 5, through: 1, by: -1) {
            // Print spaces for alignment
            for _ in stride(from: 5, to: i, by: -1) {
                print(" ", terminator: "")
            }
            
            // Print asterisks
            for _ in 1...i {
                print("*", terminator: " ")
            }
            
            print("") // Move to the next line
        }
        
        print("\n")
        
        for i in 1...5{
            for _ in 1...i{
                print("*", terminator: " ")
            }
            print("")
            
            for j in 
        }
    }
}

