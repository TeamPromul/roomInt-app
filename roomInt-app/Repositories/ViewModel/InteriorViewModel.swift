//
//  InteriorViewModel.swift
//  roomInt-app
//
//  Created by Muhammad Rifki Widadi on 31/12/21.
//

import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class InteriorViewModel: ObservableObject {
    typealias CompletionHandler = (DocumentReference) -> Void
    
    static let shared = InteriorViewModel()
    @Published var listInterior = [Interior]()

    private let store = Firestore.firestore().collection("Interiors")

//    func fetchDataInterior() async {
//        do {
//            let documentSnapshot = try await FirebaseManager.shared.firestore.collection("User")
//                .whereField("isDesainer", isEqualTo: true)
//                .getDocuments()
//            print(<#T##items: Any...##Any#>)
//        } catch {
//            print(error)
//        }
//    }
    
    init() {
        fetch()
    }
    
    func fetch() {
        store.getDocuments { snapshot, error in
            guard let documents = RepositoryHelper.extractDocuments(snapshot, error) else { return }
            
            self.listInterior = RepositoryHelper.extractData(from: documents, type: Interior.self)
            
        }
    }
    
    func add(inter: Interior, completionHandler: CompletionHandler? = nil) {
        do {
            let ref = try store.addDocument(from: inter) { error in
                // Unresolved Error
                if let error = error {
                    print("Unresolved error: Unable to place the interior", error.localizedDescription)
                }
            }
            completionHandler?(ref)
        } catch {
            RepositoryHelper.handleParsingError(error)
        }
    }
}



struct RepositoryHelper {
    static func handleQueryError(_ error: Error) {
        // Resolve the error, ex: Show popup etc.
        print("Unresolved Error: Failed to query data;", error.localizedDescription)
    }

    static func handleParsingError(_ error: Error) {
        // Resolve the error, ex: Show popup etc.
        print("Unresolved Error: Failed to parse data;", error.localizedDescription)
    }

    static func extractData<T: Decodable>(from documents: [QueryDocumentSnapshot], type: T.Type) -> [T] {
        var results = [T]()

        for document in documents {
            do {
                guard let data = try document.data(as: T.self) else { continue }
                results.append(data)
            } catch { handleParsingError(error) }
        }

        return results
    }

    static func extractDocuments(_ snapshot: QuerySnapshot?, _ error: Error?) -> [QueryDocumentSnapshot]? {
        if let error = error {
            handleQueryError(error)
        } else if let snapshot = snapshot {
            return snapshot.documents
        }

        return nil
    }
}
