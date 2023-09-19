object rolando {

	const valorBaseHechiceria = 3
	var valorBaseLucha = 1
	var hechizoPreferido = hechizoBasico
	const artefactos = []

	method nivelDeHechiceria() = valorBaseHechiceria * hechizoPreferido.poder() + fuerzaOscura.valor()

	method hechizoPreferido(nuevoHechizo) {
		hechizoPreferido = nuevoHechizo
	}

	method seCreePoderoso() = hechizoPreferido.esPoderoso()

	method valorBaseLucha(nuevoValor) {
		valorBaseLucha = nuevoValor
	}

	method agregarArtefacto(artefacto) {
		artefactos.add(artefacto)
	}

	method removerArtefacto(artefacto) {
		artefactos.remove(artefacto)
	}

	method valorDeLucha() = valorBaseLucha + self.aporteDeArtefactos()

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

object espectroMalefico {

	var nombre = "espectro maléfico"

	method poder() = nombre.length()

	method nombre(nuevoNombre) {
		nombre = nuevoNombre
	}

	method esPoderoso() = self.poder() > 15

}

object hechizoBasico {

	method poder() = 10

	method esPoderoso() = false

}

object espadaDelDestino {
	method unidadesDeLucha(luchador) = 3
}

object collarDivino {
	var cantidadDePerlas = 5
	
	method unidadesDeLucha(luchador) = cantidadDePerlas
	method cantidadDePerlas(nuevaCantidad) {
		cantidadDePerlas = nuevaCantidad
	}
}

object mascaraOscura {
	const unidadesMinimas = 4
	
	method unidadesDeLucha(luchador) = unidadesMinimas.max(fuerzaOscura.valor() / 2)
}

object armadura {
	const unidadesBase = 2
	
	method unidadesDeLucha(luchador) = unidadesBase + refuerzo.unidadesDeLucha(luchador)
}

object bendicion {
	method unidadesDeLucha(luchador) = luchador.nivelDeHechiceria()
}