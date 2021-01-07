//
//  CriadorDeLances.swift
//  LeilaoIOS
//
//  Created by Gabriel Mendonça Sousa Gonçalves  on 07/01/21.
//

import UIKit

class CriadorDeLances: NSObject {
    
    private var leilao:Leilao!
    
    func para( descricao: String) -> Self {
        leilao = Leilao(descricao: descricao)
        
        return self
    }
    
    func lance(_ usuario: Usuario, _ valor: Double) -> Self {
        leilao.propoe(lance: Lance(usuario, valor))
        
        return self
    }
    
    func constroi() -> Leilao {
        return leilao
    }
}
