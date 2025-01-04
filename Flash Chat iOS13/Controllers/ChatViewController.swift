//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestoreInternal

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    let db = Firestore.firestore()
    var message: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView.delegate = self // interact with user.
        tableView.dataSource = self //set tableview property. like number of rows and cell property
        navigationItem.hidesBackButton = true
        navigationItem.title = Constants.appName
        
        tableView.register(
            UINib(nibName: Constants.cellNibName, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier
        )
        loadMessage()
    }
    
    func loadMessage() {        // if we want to get FireStore once ,then we will use   db.collection(Constants.FStore.collectionName).addSnapshotListener
        //But For real Time data we will use addSnapshotListener to use real time data
        db.collection(Constants.FStore.collectionName)
            .order(by: Constants.FStore.dateField)
            .addSnapshotListener { (querySnapshot, error) in
            self.message = []
            if let e = error {
                print("There was an issue to retriving data from FireStore.\(e)")
            } else {
                if let snapShotDocuments = querySnapshot?.documents {
                    for doc in snapShotDocuments { //snapShotDocuments contains data array
                        let data = doc.data() //data contains dictionary of messageSender and messageBody,
                        
                        if let messageSender = data[Constants.FStore.senderField] as? String,
                           let messageBody = data[Constants.FStore.bodyField] as? String {
                            
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.message.append(newMessage)
                          
                            DispatchQueue.main.async { // why dispathchQueue? When Execute user Interaction Data in Closure .Then it will be better to use DispathcQueue.
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.message.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextfield.text,
           let messageSender = Auth.auth().currentUser?.email { //get current user info from fireStore.
            if messageBody.count == 0 { return }
            self.messageTextfield.text = ""
            
            db.collection(Constants.FStore.collectionName).addDocument(data: [
                Constants.FStore.senderField : messageSender,
                Constants.FStore.bodyField : messageBody,
                Constants.FStore.dateField : Date().timeIntervalSince1970
            ]) { error in
                if let e = error {
                    print("There is an error to store data in FireStore: \(e)")
                } else {
                    print("Successfully data Saved.")
                    DispatchQueue.main.async {
                        self.messageTextfield.text = ""
                    }
                }
            }
        }
    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
            logOutConfirmation{ value in
                
                if value {
                    self.navigationController?.popToRootViewController(animated: true)
                } else {
                    self.goAppSetting()
                }
            }
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}

extension ChatViewController {
    
    private func logOutConfirmation(completion: @escaping(Bool)-> Void) {
        let alertController = UIAlertController(
            title: "Do you want to log out?",
            message: nil,
            preferredStyle: .alert
        )
        //Ok button
        let okButton = UIAlertAction(
            title: "Ok",
            style: .default,
            handler: { _ in
                completion(true)
            }
        )
        
        //cancel button
        let cancelButton = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: {_ in
                completion(false)
            }
        )
        
        alertController.addAction(cancelButton)
        alertController.addAction(okButton)
        alertController.preferredAction = okButton //https://stackoverflow.com/questions/59357176/uialertcontroller-how-to-make-the-right-button-bolded
        self.present(alertController, animated: true, completion: nil)
    }
    
    private func goAppSetting() {
        if let urlString = URL(string: UIApplication.openSettingsURLString) {
            if UIApplication.shared.canOpenURL(urlString) {
                UIApplication.shared.open(urlString)
            }
        }
    }
    
}

extension ChatViewController: UITableViewDataSource { //set tableview property.
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = message[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        
        cell.label.text = message.body
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImage.isHidden = true
            cell.rightImage.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: Constants.BrandColors.purple)
        } else {
            cell.leftImage.isHidden = false
            cell.rightImage.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.purple)
            cell.label.textColor = UIColor(named: Constants.BrandColors.lightPurple)
        }
        return cell
    }
}

//extension ChatViewController: UITableViewDelegate { // interact with user interaction.
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        <#code#>
//    }
//}
