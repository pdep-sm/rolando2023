import artefactos.*
import hechizos.* 

object personaje { /** companion object */
	
	const property valorBaseHechiceria = 3
	
}

class Personaje {

	var property valorBaseLucha = 1
	var property hechizoPreferido = hechizoBasico
	const artefactos = []
	var monedas = 100

	method nivelDeHechiceria() = personaje.valorBaseHechiceria() * hechizoPreferido.poder() + fuerzaOscura.valor()

	method seCreePoderoso() = hechizoPreferido.esPoderoso()

	method agregarArtefacto(artefacto) {
		artefactos.add(artefacto)
	}

	method removerArtefacto(artefacto) {
		artefactos.remove(artefacto)
	}

	method valorDeLucha() = valorBaseLucha + self.aporteDeArtefactos()
	
	method unidadesDeMejorArtefactoSin(artefacto){
		const copiaArtefactos = artefactos.copyWithout(artefacto)
		const mejorArtefacto = copiaArtefactos.max{ otro => otro.unidadesDeLucha(self) }
		return mejorArtefacto.unidadesDeLucha(self)
	}

	method aporteDeArtefactos() = artefactos.sum{ artefacto => artefacto.unidadesDeLucha(self) }

	method masLuchadorQueHechicero() = self.valorDeLucha() > self.nivelDeHechiceria()
}

object fuerzaOscura {

	var valor = 5

	method valor() = valor

	method provocarEclipse() {
		valor *= 2
	}

}

