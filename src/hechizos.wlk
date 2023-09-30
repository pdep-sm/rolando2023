class Hechizo {
	method poder()
	method esPoderoso()
	method precio()
	
	method unidadesDeLucha(luchador) = self.poder() 
	
	method precio(armadura) = armadura.unidadesBase() + self.precio()
}


class HechizoLogos inherits Hechizo {

	const nombre
	const multiplicador

	override method poder() = nombre.length() * multiplicador
	
	override method esPoderoso() = self.poder() > 15
	
	override method precio() = self.poder()

}

object hechizoBasico inherits Hechizo {

	override method poder() = 10

	override method esPoderoso() = false
	
	override method precio() = 10

}

class LibroHechizos inherits Hechizo {
	const hechizos

	override method poder() = self.hechizosPoderosos().sum{ hechizo => hechizo.poder() }
	
	method hechizosPoderosos() = hechizos.filter{ hechizo => hechizo.esPoderoso() }

	override method esPoderoso() = self.hechizosPoderosos().isNotEmpty()
	
	override method precio() = 0 //TODO Franco :) xD  
	
}

