//
//  PersonagensTests.swift
//  PersonagensTests
//
//  Created by Joni de Campos on 23/04/20.
//  Copyright © 2020 Joni de Campos. All rights reserved.
//

import XCTest
@testable import Personagens_Marvel

class PersonagensTests: XCTestCase {
    
    override func setUp() {
        
        super.setUp()
    }
    
    override func tearDown() {
       
        super.tearDown()
    }

    
    //MARK: - Teste ListCharactersViewController
    func testViewLoading(){
        
        guard let vc = getViewController(loading: true) else {  fail(); return }
        
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
    
    func fail() {
        XCTAssert(false, "Falha!")
    }
    
    
    
    
    
    
    
}
