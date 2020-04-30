//
//  MockProtocols.swift
//  desafio-ios-joni-campos
//
//  Created by Joni de Campos on 30/04/20.
//  Copyright © 2020 Joni de Campos. All rights reserved.
//

import Foundation
import UIKit



protocol MockProtocols: class{

    
    func callAPIMarvelCharactersMock(limit: Int, offset: Int, completion: @escaping (_ result: CharacterDataWrapper ) ->() )
    
    
}




