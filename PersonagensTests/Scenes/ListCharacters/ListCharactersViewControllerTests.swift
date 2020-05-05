//
//  ListCharactersViewControllerTests.swift
//  desafio-ios-joni-campos
//
//  Created by Joni de Campos on 27/04/20.
//  Copyright (c) 2020 Joni de Campos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//


@testable import Personagens_Marvel
import XCTest

class ListCharactersViewControllerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: ListCharactersViewController!
  var window: UIWindow!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    window = UIWindow()
    setupListCharactersViewController()
  }
  
  override func tearDown()
  {
    window = nil
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupListCharactersViewController()
  {
    let bundle = Bundle.main
    let storyboard = UIStoryboard(name: "Main", bundle: bundle)
    sut = storyboard.instantiateViewController(withIdentifier: "ListCharactersViewController") as! ListCharactersViewController
  }
  
  func loadView()
  {
    window.addSubview(sut.view)
    RunLoop.current.run(until: Date())
  }
  

  
  class ListCharactersBusinessLogicSpy: ListCharactersBusinessLogic
  {
    
    func proximaPagina(limit: Int, offset: Int) {
        
    }
    var doSomethingCalled = false
    
    func doSomething(request: ListCharacters.Something.Request)
    {
      doSomethingCalled = true
    }
  }
  
  // MARK: Tests
  
  func testShouldDoSomethingWhenViewIsLoaded()
  {
    // Given
    let spy = ListCharactersBusinessLogicSpy()
    sut.interactor = spy
    
    // When
    loadView()
    
    // Then
    XCTAssertTrue(spy.doSomethingCalled, "viewDidLoad() should ask the interactor to do something")
  }
  
  func testDisplaySomething()
  {
    // Given
    
    let oResultado: CharacterDataWrapper?
    
    let url = Bundle.main.url(forResource: "characters", withExtension: "json")!
    do {
        let data = try Data(contentsOf: url)
        oResultado = try! JSONDecoder().decode(CharacterDataWrapper.self, from: data)
        
        
        let viewModel = ListCharacters.Something.ViewModel(oCharacters: ListCharacters.Something.Response.init(resultado: oResultado!))
        
        // When
        sut.displaySomething(viewModel: viewModel)
        
        // Then
       // XCTAssertEqual(sut.self, "", "displaySomething(viewModel:) should update the name text field")
        
        
    } catch {
        print(error)
    }
   

}
}
