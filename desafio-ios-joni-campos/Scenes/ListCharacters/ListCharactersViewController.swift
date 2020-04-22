//
//  ListCharactersViewController.swift
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


protocol ListCharactersDisplayLogic: class
{
  func displaySomething(viewModel: ListCharacters.Something.ViewModel)
}

class ListCharactersViewController: UITableViewController, ListCharactersDisplayLogic
{
  var interactor: ListCharactersBusinessLogic?
  var router: (NSObjectProtocol & ListCharactersRoutingLogic & ListCharactersDataPassing)?

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
    let interactor = ListCharactersInteractor()
    let presenter = ListCharactersPresenter()
    let router = ListCharactersRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  //MARK: - Routing
  
//  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//  {
//    if let scene = segue.identifier {
//      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
//      if let router = router, router.responds(to: selector) {
//        router.perform(selector, with: segue)
//      }
//    }
//  }
    
    
  
  // MARK: -  View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
    
  
  //@IBOutlet weak var nameTextField: UITextField!
  
  func doSomething()
  {
    let request = ListCharacters.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: ListCharacters.Something.ViewModel)
  {
    
    print("Mostre os personagens")
    

    //trata erros da API result

    let codeAPI =  viewModel.oCharacters.resultado.code
    
    if ( codeAPI == 200){
        DispatchQueue.main.async{
            
            oComics  = viewModel.oCharacters.resultado
            
            self.tableView.reloadData()
            //self.tableView.isHidden = false;
        }
        
    }else{
        //Mostre os erros da API
        if (codeAPI == 409 ){
            let mensagemErro =  oComics?.status
            
            DispatchQueue.main.async{
                self.exibirMensagem(titulo: "Erro de API", mensagem: mensagemErro!)
            }
            
        }
        
    }
    
  }
    
    
    
    //MARK: - Mostra mensagem de erro
    // Para exibir alertas na tela
    func exibirMensagem(titulo: String, mensagem: String)
    {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        
        alerta.addAction(cancelar)
        
        present(alerta, animated: true, completion: nil)
    }
         
     
     
    
     
    //MARK: -  Define a quantidade de sessões da nossa tabela
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Retorna o numero de linhas da sessão
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let contagem = oComics?.data?.count ?? 0
        
        return (contagem)
        //return MyVariables.pedidosWix.count
    }
     
     
    //MARK: - Execute o TableView
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
       
        
        let personagens = oComics
        
        //pegua os dados do array de um registro
        let personagemLinha = personagens?.data?.characters![indexPath.row]
        
        //crie uma variavel com o identificador da celula
        let celulaID = "celulaID"
        
        //executa o loop da Table View para a celula = celulaID
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaID, for: indexPath) as! celula
        
        
        celula.nomeCiente.text = personagemLinha?.name
        
        let imagePath = (personagemLinha?.thumbnail?.path ?? "") + "." + (personagemLinha?.thumbnail?.thumbnailExtension ?? "")
        
        
        let url = URL(string: imagePath)
        
        // using Kingfisher
        let processor = RoundCornerImageProcessor(cornerRadius: 100)
        celula.characterImage.kf.indicatorType = .activity
        celula.characterImage.kf.setImage(with: url, options: [.processor(processor)])
        
        
        return celula
        
    }
    
     
        
     
     // Chama a tela do detalhe passando o indexPath selecionado, isto é a linha que foi selecionado na TableView
      // Utilizado para passar dados de um ViewController para outro
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         
          
          // verifica se o segue está correto
          if segue.identifier == "detalhePersonagem"
          {
              
             //pega o indexPath Selecionado
             if let indexPath = tableView.indexPathForSelectedRow {
                 
                 
                 let personagens = oComics
                 
                 //pegua os dados do array de um registro
                 let personagemLinha = personagens?.data?.characters![indexPath.row]
                 
                 
                 
                 //let persongemSelecionado = self.filmes[indexPath.row]
                 
                 
                 //chama a tela do detalhe passando o filmeSelecionado
                 let viewControllerDestino = segue.destination as! CharacterDetailsViewController
                 viewControllerDestino.personagem = personagemLinha
             }
          }
          
      }
    
    
    
    
    
    
}
