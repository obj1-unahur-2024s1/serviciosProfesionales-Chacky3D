import universidades.*
import profesionales.*
import empresas.*

class Persona {
	
	const provincias = #{}
	
	method puedeSerAtendidoPor(profesional) { return !provincias.intersection(profesional.provinciasDondePuedeTrabajar()).isEmpty() }
	
}

class Institucion{
	
	const provincias = #{}
	
	method puedeSerAtendidoPor(profesional) { return !provincias.intersection(profesional.provinciasDondePuedeTrabajar()).isEmpty() }
	
}

class Club{
	
	const provincias = #{}
	
	method puedeSerAtendidoPor(profesional) { return !provincias.intersection(profesional.provinciasDondePuedeTrabajar()).isEmpty() }
	
}