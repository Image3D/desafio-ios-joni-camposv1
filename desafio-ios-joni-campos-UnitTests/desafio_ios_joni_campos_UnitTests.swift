//
//  desafio_ios_joni_campos_UnitTests.swift
//  desafio-ios-joni-campos-UnitTests
//
//  Created by Joni de Campos on 23/04/20.
//  Copyright © 2020 Joni de Campos. All rights reserved.
//


import XCTest
@testable import Personagens_Marvel


class desafio_ios_joni_campos_UnitTests: XCTestCase {
    
    var systemUndertest: UIViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        systemUndertest = UIViewController()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    //MARK: - Teste ListCharactersViewController
    func testViewLoading(){
        guard let vc = getViewController(loading: true) else { fail(); return }
        
        XCTAssertNotNil(vc.exibirMensagem(titulo: "Mensagem", mensagem: "Mensagem carregada"))
    }
   

    
    //MARK: - Auxiliary testing functions
    func getViewController(loading: Bool) -> ListCharactersViewController? {
        
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CharacterList") as? ListCharactersViewController else {
            return nil
        }
        
        if loading {
            let _ = vc.view // view called
        }
        
        return vc
    }
    
    
   
    
}
