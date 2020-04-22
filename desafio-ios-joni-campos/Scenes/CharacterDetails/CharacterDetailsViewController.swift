//
//  CharacterDetailsViewController.swift
//  desafio-ios-joni-campos
//
//  Created by Joni de Campos on 15/04/20.
//  Copyright (c) 2020 Joni de Campos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Foundation
import Kingfisher



var personagem: Character!

var selectedPersonagemID: Int!

protocol CharacterDetailsDisplayLogic: class
{
    func displaySomething(viewModel: CharacterDetails.Something.ViewModel)
}

class CharacterDetailsViewController: UIViewController, CharacterDetailsDisplayLogic
{
    
    
    var personagem: Character!
    
    
    @IBOutlet weak var imagemPersonagem: UIImageView!
    @IBOutlet weak var nomePersonagem: UILabel!
    @IBOutlet weak var descricaoPersonagem: UILabel!
    
    
    
    var interactor: CharacterDetailsBusinessLogic?
    var router: (NSObjectProtocol & CharacterDetailsRoutingLogic & CharacterDetailsDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = CharacterDetailsInteractor()
        let presenter = CharacterDetailsPresenter()
        let router = CharacterDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething()
    {
        let request = CharacterDetails.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: CharacterDetails.Something.ViewModel)
    {
        
        nomePersonagem.text = personagem.name
        descricaoPersonagem.text = personagem.description
        
        let imagePath = (personagem?.thumbnail?.path ?? "") + "." + (personagem?.thumbnail?.thumbnailExtension ?? "")
        
        // using Kingfisher
        let url = URL(string: imagePath)
        
        
        let processor = RoundCornerImageProcessor(cornerRadius: 50)
        imagemPersonagem.kf.indicatorType = .activity
        imagemPersonagem.kf.setImage(with: url, options: [.processor(processor)])
        
        
    }
    
    @IBAction func HDCara(_ sender: Any) {
        
        selectedPersonagemID = personagem.id
       
        
    }
    
    
    
}
