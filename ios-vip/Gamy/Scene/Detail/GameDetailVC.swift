//
//  GameDetailVC.swift
//  Gamy
//
//  Created by Ariel on 05/11/20.
//

import UIKit

protocol GameDetailDisplayLogic: class {
    func detailResult(result: Result<GameDetail.ViewModel, Error>)
}

class GameDetailVC: UIViewController, GameDetailDisplayLogic {
    
    @IBOutlet weak var label: UILabel!
    
    var router: (NSObjectProtocol & GameDetailRoutingLogic & GameDetailDataPassing)?
    var interactor: GameDetailBussinessLogic?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let interactor = GameDetailInteractor()
        let presenter = GameDetailPresenter()
        let router = GameDetailRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewDetail = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ActivityIndicator.start(on: self)
        interactor?.requestDetail()
        ActivityIndicator.stop(on: self)
    }
    
    func detailResult(result: Result<GameDetail.ViewModel, Error>) {
        switch result {
        case .success(let viewModel):
            DispatchQueue.main.async {
                self.label.text = viewModel.title
            }
        case .failure(let error):
            Alert.showErrorDialog(on: self, with: error as! BaseError)
        }
    }
}
