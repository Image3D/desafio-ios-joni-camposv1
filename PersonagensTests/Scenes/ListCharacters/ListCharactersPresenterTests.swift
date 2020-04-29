//
//  ListCharactersPresenterTests.swift
//  desafio-ios-joni-campos
//
//  Created by Joni de Campos on 27/04/20.
//  Copyright (c) 2020 Joni de Campos. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

//@testable import desafio_ios_joni_campos
@testable import Personagens_Marvel
import XCTest

class ListCharactersPresenterTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: ListCharactersPresenter!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupListCharactersPresenter()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupListCharactersPresenter()
  {
    sut = ListCharactersPresenter()
  }
  
  // MARK: Test doubles
  
  class ListCharactersDisplayLogicSpy: ListCharactersDisplayLogic
  {
    var displaySomethingCalled = false
    
    func displaySomething(viewModel: ListCharacters.Something.ViewModel)
    {
      displaySomethingCalled = true
    }
  }
  
  // MARK: Tests
  
  func testPresentSomething()
  {
    // Given
    
    
    let spy = ListCharactersDisplayLogicSpy()
    sut.viewController = spy
    let response = ListCharacters.Something.Response(resultado: )
    
    // When
    sut.presentSomething(response: response)
    
    // Then
    XCTAssertTrue(spy.displaySomethingCalled, "presentSomething(response:) should ask the view controller to display the result")
  }
}