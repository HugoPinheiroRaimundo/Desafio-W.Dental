//
//  RecoverPasswordViewModel.swift
//  Desafio W.Dental
//
//  Created by Hugo Pinheiro on 24/09/21.
//

class RecoverPasswordViewModel {
    
    // MARK: - Properties
    private var Reset: Reset? {
        didSet {
            guard let p = Reset else { return }
            self.setupText(with: p)
            self.didFinishFetch?()
        }
    }
    var error: Error? {
        didSet { self.showAlertClosure?() }
    }
    var isLoading: Bool = false {
        didSet { self.updateLoadingStatus?() }
    }
    
    var userID: String?
    var title: String?
    
    
    private var dataService: DataService?
    
    // MARK: - Closures for callback, since we are not using the ViewModel to the View.
    var showAlertClosure: (() -> ())?
    var updateLoadingStatus: (() -> ())?
    var didFinishFetch: (() -> ())?
    
    // MARK: - Constructor
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    // MARK: - Network call
    func fetchReset(withId id: Int) {
        self.dataService?.requestFetchReset(with: id, completion: { (reset, error) in
            if let error = error {
                self.error = error
                self.isLoading = false
                return
            }
            self.isLoading = true
            self.error = nil
            self.isLoading = false
            self.Reset = reset
            
            
        })
    }
    
    // MARK: - UI Logic
    
    private func setupText(with reset: Reset) {
        if let userId = reset.userID, let title = reset.title {
            
            self.userID = "UserID: \(userId)"
            self.title = "Title: \(title)"
        }
          
        }
    }



