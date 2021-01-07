//
//  AvaliadorTests.swift
//  LeilaoIOSTests
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 21/12/20.
//

import XCTest
@testable import LeilaoIOS

class AvaliadorTests: XCTestCase {
    
    var leiloeiro: Avaliador!
    private var joao:Usuario!
    private var jose: Usuario!
    private var maria: Usuario!

    override func setUpWithError() throws {
        joao = Usuario(nome: "Joao")
        jose = Usuario(nome: "Jose")
        maria = Usuario(nome: "Maria")
        leiloeiro = Avaliador()
    }

    override func tearDownWithError() throws {
    }
    
    func testDeveEntenderLanceEmOrdemCrescente() {
        
        let leilao = CriadorDeLances().para(descricao: "Playstation 4")
            .lance(maria, 250.0)
            .lance(joao, 300.0)
            .lance(jose, 400.0).constroi()
        
        // Acao
 
        try? leiloeiro.avalia(leilao: leilao)
        
        // Validacao
        
        XCTAssertEqual(250.0, leiloeiro.menorLance())
        XCTAssertEqual(400.0, leiloeiro.maiorLance())
    }
    func testDeveEntenderLeilaoComApenasUmLance() {
        
        let leilao = CriadorDeLances().para(descricao: "Playstation 5")
            .lance(joao, 1000.0).constroi()
        
        try? leiloeiro.avalia(leilao: leilao)
        
        XCTAssertEqual(1000.0, leiloeiro.menorLance())
        XCTAssertEqual(1000.0, leiloeiro.maiorLance())
        
    }
    
    func testEncontrarOsTresMaioresLances() {
        
        let leilao = CriadorDeLances().para(descricao: "playstation 5")
            .lance(joao,300.0)
            .lance(maria,400.0)
            .lance(joao,500.0)
            .lance(maria,600.0).constroi()
        
        
        try? leiloeiro.avalia(leilao: leilao)
        
        let listaLances = leiloeiro.tresMaiores()
        
        XCTAssertEqual(3, listaLances.count)
        XCTAssertEqual(600.0, listaLances[0].valor)
        XCTAssertEqual(500.0, listaLances[1].valor)
        XCTAssertEqual(400.0, listaLances[2].valor)
    }
    
    func testDeveIgnorarLeilaoSemLances() {
        let leilao = CriadorDeLances().para(descricao: "Playstation 5").constroi()
        
        XCTAssertThrowsError(try leiloeiro.avalia(leilao: leilao), "Não é possivel avaliar leilão sem lances") { (error) in
            print(error.localizedDescription)
        }
    }
    
    


}
