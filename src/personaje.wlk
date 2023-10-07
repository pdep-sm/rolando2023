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
	const capacidadMaxima

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
	
	method comprarArtefacto(artefacto) {
		if (monedas >= artefacto.precio() and self.capacidadRestante() >= artefacto.peso()) {
			monedas = monedas - artefacto.precio()
			
			self.agregarArtefacto(artefacto)
		} //TODO: Leo :)
			
	}
	
	method comprarHechizo(hechizo) {
		const precioFinal = 0.max(hechizo.precio() - (hechizoPreferido.precio() / 2))
		
		if (monedas >= precioFinal) {
			monedas = monedas - precioFinal
			hechizoPreferido = hechizo
		}//TODO: Leo :) :)
	}
	
	method capacidadRestante() = capacidadMaxima - 
		artefactos.sum { artefacto => artefacto.peso() }
}

object fuerzaOscura {

	var valor = 5

	method valor() = valor

	method provocarEclipse() {
		valor *= 2
	}

}

class Npc inherits Personaje {
	const nivelDificultad = dificultadModerada
	
	override method valorDeLucha() = super() * nivelDificultad.multiplicador()
}

const dificultadFacil = new NivelDificultad(multiplicador = 1)
const dificultadModerada = new NivelDificultad(multiplicador = 2)
const dificultadDificil = new NivelDificultad(multiplicador = 4)

class NivelDificultad {
	const property multiplicador
}

class Comerciante {
	
	var property categoria
	var property comision
	
	method aplicarImpuesto(artefacto) = artefacto.precio() + categoria.impuesto(artefacto.precio(), self)
	
	method recategorizar() {
		categoria.recategorizar(self)
	}
	
	method duplicarComision() {
		comision = comision * 2
	}
}


/*
 * Los comerciantes pueden cambiar su situación impositiva, 
* espontáneamente o a raíz de una recategorización compulsiva. 
* En este caso, los comerciantes registrados pasan a tener impuesto a 
* las ganancias, los independientes duplican su porcentaje de comisión 
* (y en caso de superar el 21% se registran) y los que ya pagaban 
* impuesto a la ganancia, siguen igual. 
 */

object independiente {
	
	method impuesto(monto, comerciante) = monto * comerciante.comision()
	
	method recategorizar(comerciante) {
		comerciante.duplicarComision()
		
		if (comerciante.comision() > 0.21)
			comerciante.categoria(registrado)
	}
}

object registrado {
	
	const iva = 0.21
	
	method impuesto(monto, comerciante) = monto * iva 

	method recategorizar(comerciante) {
		comerciante.categoria(impuestoALasGanancias)
	}
}

object impuestoALasGanancias {
	var minimoNoImponible = 42
	var recargo = 0.35
	
	method impuesto(monto, comerciante) = 
		0.max(monto - minimoNoImponible) * recargo
		
	method recategorizar(comerciante) {}
}

















