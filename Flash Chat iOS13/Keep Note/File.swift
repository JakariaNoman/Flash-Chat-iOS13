//
//  File.swift
//  Flash Chat iOS13
//
//  Created by Jakaria Noman on 29/12/24.
//  Copyright © 2024 Angela Yu. All rights reserved.
//

import Foundation

/*
1. In MultiScreen in storyboard- When we add them in navigationController From Root or initial View Controller then automatacilly add Button Which is called "Back" in NavigationBar In left side.So that we can easily pop the top view controller in from Navigation Stcak view
 2. Present Modal = Present a new view without affecting the navigation stack (independent).
3. Show = Push the new view onto the navigation stack (part of a hierarchy).
 ### **Alamofire**:
 **Alamofire** is a Swift-based library used for making network requests in iOS and macOS applications. It simplifies tasks such as sending HTTP requests, handling responses, and working with JSON data. Alamofire streamlines common networking operations like authentication, file uploads/downloads, and data serialization, making it easier to interact with REST APIs.

 - **Key Features**:
   - Simplifies **HTTP requests** (GET, POST, PUT, DELETE).
   - Supports **JSON encoding/decoding**.
   - Handles **file uploads/downloads**.
   - Built-in **error handling** and **response validation**.

 ---

 ### **Firebase**:
 **Firebase** is a platform developed by Google that provides cloud-based tools for building mobile and web apps. It offers a variety of services like real-time databases, authentication, cloud storage, and analytics, making it easier to develop and manage backend functionality.

 - **Key Features**:
   - **Firebase Authentication**: Simplifies user authentication via email, social logins, and anonymous sign-ins.
   - **Firestore/Realtime Database**: NoSQL databases for storing and syncing data in real-time.
   - **Firebase Cloud Messaging (FCM)**: Push notifications to engage users.
   - **Firebase Analytics**: Tracks user behavior and app usage.

 Both **Alamofire** and **Firebase** are essential tools in iOS development for handling networking and backend services efficiently.
 */

/*
  -- UIAlertController: How to make the right button bolded?
  -- https://stackoverflow.com/questions/59357176/uialertcontroller-how-to-make-the-right-button-bolded
*/
 
 /*
 email: 1@3.com
 password: 123456
*/

/*
 What is thw difference between let x and static let x?
 With let, you need an instance of the class to access the constant.
 With static let, you access it directly via the class name (or struct, enum).
 
 class MyClass {
     let instanceConstant = 42  // Instance constant
     stati let x = 102
 }
 let myObject = MyClass()
 print(myObject.instanceConstant)  // Access through an instance
 print(MyClass.instanceConstant)   // Access through the type itself
 */

/*
 tableview Data Source: Set tableview property like rows ..cell property etc
 tablveiew Delegate : Set user interaction with tableview data
 */

/*
 Type casting : https://docs.swift.org/swift-book/documentation/the-swift-programming-language/typecasting/
 ------>>>>>>>> as, as?, as!, is, any ,anyObject, NSObject ???
 Keyword    Meaning    Usage
 
 as   -- Type casting (works when you're sure about the type)    Used when you know the type will match.
 as?  --  Safe type casting (returns nil if the cast fails)    Used when you're unsure and want to avoid crashes.
 as!  --  Forced type casting (can crash if cast fails)    Used when you're certain the cast will succeed.
 is  --  Type checking (checks if an object is of a specific type)    Used to check the type before casting.
 Any  --  A type that can represent any type (objects, primitive types, etc.)    Used to store mixed types or unknown types.
 AnyObject --   A type that can represent any object (only class types)    Used to store object references (not primitive types).
 NSObject  --  The base class for most Cocoa and UIKit objects    Used for class-based objects, especially when interoperating with Objective-C.
 
 
 A protocol can be constrained to AnyObject to ensure that only class types (reference types) can conform to it. In other words, a protocol constrained to AnyObject cannot be adopted by structs or enums, as they are value types.

 How does it work?
 When you add a protocol constraint like AnyObject to a protocol, you are making sure that only classes can adopt the protocol, not structs or enums.

 For example, let's say you want to create a protocol that can only be adopted by class instances (objects that inherit from NSObject or any other class). You would define the protocol like this:
 
 protocol MyProtocol: AnyObject {
     func doSomething()
 }

 class MyClass: MyProtocol {
     func doSomething() {
         print("Doing something in MyClass.")
     }
 }

 struct MyStruct: MyProtocol {  // Error: 'MyStruct' does not conform to protocol 'MyProtocol'
     func doSomething() {
         print("Doing something in MyStruct.")
     }
 }

 */

/*
 How AddSnapshotLister works?
 ---> Initial Snapshot: When you first call addSnapshotListener(), you receive all the data in the collection at that time.
 ---> Real-Time Updates: After the initial snapshot, Firestore will only send new data (i.e., documents added to Firestore after the listener was established) or updates to existing data.
 ---> Listener Behavior: Firestore does not send the entire collection every time you call addSnapshotListener(). It only sends the new data or the updated data that has changed since the last snapshot.
 */


/*
 View Life cycle:
 -> ViewDidLoad -> viewWillAppear -> viewDidAppear -> viewWillDisspear -> viewWDidDisspear
 */

/*
 App Life Cycle:
 App Delegate (didFinishLaunchingWithOptions) -> ViewDidLoad -> ViewWillAppear ->  .....
 Scenedelegate actually handle when we terminate to another screen. When we use multiple app simultaneously it will handle by scenedelegate. If any scene is delete or remove then it will again call App Delegate.
 https://samsungu.udemy.com/course/ios-13-app-development-bootcamp/learn/lecture/16813366#overview
 */
