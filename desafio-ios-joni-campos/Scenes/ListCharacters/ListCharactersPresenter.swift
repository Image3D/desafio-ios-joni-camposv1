//
//  ListCharactersPresenter.swift
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

protocol ListCharactersPresentationLogic
{
    func presentSomething(response: ListCharacters.Something.Response)
}

class ListCharactersPresenter: ListCharactersPresentationLogic
{
    weak var viewController: ListCharactersDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: ListCharacters.Something.Response)
    {
        let viewModel = ListCharacters.Something.ViewModel(oCharacters: response)
        viewController?.displaySomething(viewModel: viewModel)
    }
}
