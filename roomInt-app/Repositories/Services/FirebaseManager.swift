//
//  FirebaseManager.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 30/12/21.
//

//import Firebase
//import FirebaseAuth
//import FirebaseStorage
//import FirebaseFirestore
//
//class FirebaseManager: NSObject {
//    let auth: Auth
//    let storage: Storage
//    let firestore: Firestore
//
//    static let shared = FirebaseManager()
//
//    override init() {
//        FirebaseApp.configure()
//
//        self.auth = Auth.auth()
//        self.storage = Storage.storage()
//        self.firestore = Firestore.firestore()
//
//        #if EMULATORS
//        print(
//        """
//        *****************************************
//        Testing on Firebase Emulators
//        *****************************************
//
//        """
//        )
//        self.auth.useEmulator(withHost: "localhost", port: 9099)
//        self.storage.useEmulator(withHost: "localhost", port: 9199)
//        let settings = self.firestore.settings
//        settings.host = "localhost:8080"
//        settings.isSSLEnabled = false
//        settings.isPersistenceEnabled = false
//        firestore.settings = settings
//        #elseif DEBUG
//        print(
//        """
//        *****************************************
//        Testing on Debug Mode
//        *****************************************
//
//        """
//        )
//        #endif
//        super.init()
//    }
//}
