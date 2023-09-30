import personaje.fuerzaOscura

object arma {
	const unidadesLucha = 3
	
	method unidadesDeLucha(luchador) = unidadesLucha
	
	method precio() = 5 * unidadesLucha
}

object collarDivino {
	var property cantidadDePerlas = 5
	
	method unidadesDeLucha(luchador) = cantidadDePerlas
	
	method precio() = 2 * cantidadDePerlas

}

class Mascara {
	var property unidadesMinimas = 4
	const indiceDeOscuridad
	
	method unidadesDeLucha(luchador) = unidadesMinimas.max(fuerzaOscura.valor() / 2 * indiceDeOscuridad)
	
	method precio() = 70 + fuerzaOscura.valor() * indiceDeOscuridad
	 
}

class Armadura {
	const property unidadesBase = 2
	var property refuerzo
	
	method unidadesDeLucha(luchador) = unidadesBase + refuerzo.unidadesDeLucha(luchador)
	
	method precio() = refuerzo.precio(self)

}

class CotaDeMalla {
	const unidadesLucha
	
	method unidadesDeLucha(luchador) = unidadesLucha

	method precio(armadura) = unidadesLucha / 2
	
}

object bendicion {
	
	method unidadesDeLucha(luchador) = luchador.nivelDeHechiceria()
	
	method precio(armadura) = armadura.unidadesBase()
}

object refuerzoNulo {
	
	method unidadesDeLucha(luchador) = 0
	
	method precio(armadura) = 2
	
}

object espejoFantastico {

	method unidadesDeLucha(luchador) = luchador.unidadesDeMejorArtefactoSin(self)
	
	method precio() = 90
	
}