//
//  CharacterDetailsRouter.swift
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

@objc protocol CharacterDetailsRoutingLogic
{
    //func routeToSomewhere(segue: UIStoryboardSegue?)
}

protocol CharacterDetailsDataPassing
{
    var dataStore: CharacterDetailsDataStore? { get }
}

class CharacterDetailsRouter: NSObject, CharacterDetailsRoutingLogic, CharacterDetailsDataPassing
{
    weak var viewController: CharacterDetailsViewController?
    var dataStore: CharacterDetailsDataStore?
    
    
}
