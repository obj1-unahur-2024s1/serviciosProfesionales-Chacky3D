import universidades.*

class ProfesionalVinculado {
	const universidad
	
	method universidad() { return universidad }
	method provinciasDondePuedeTrabajar() { return #{ universidad.provincia() } }
	method honorariosPorHora() { return universidad.honorariosRecomendados() }
	method cobrar(importe) { universidad.recibir(importe / 2) }
	method cobrarServicio() { self.cobrar(self.honorariosPorHora()) }
	
}

class ProfesionalAsociado {
	const universidad
	
	method universidad() { return universidad }
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	method honorariosPorHora() { return 3000 }
	method cobrar(importe) { asociacionDeProfesionalesDelLitoral.recibir(importe) }
	method cobrarServicio() { self.cobrar(self.honorariosPorHora()) }
	
}

class ProfesionalLibre {
	const universidad
	const provinciasDondePuedeTrabajar = #{}
	var honorariosPorHora
	var dineroRecaudado = 0
	
	method universidad() { return universidad }
	method provinciasDondePuedeTrabajar() { return provinciasDondePuedeTrabajar }
	method provinciasDondePuedeTrabajar(provincias) { provinciasDondePuedeTrabajar.addAll(provincias) }
	method honorariosPorHora(valor) { honorariosPorHora = valor }
	method honorariosPorHora() { return honorariosPorHora }
	method dineroRecaudado() { return dineroRecaudado }
	method cobrar(importe) { dineroRecaudado = dineroRecaudado + importe }
	method cobrarServicio() { self.cobrar(self.honorariosPorHora()) }
	method pasarDineroA(persona, importe) { 
		persona.cobrar(importe)
		dineroRecaudado = dineroRecaudado - importe
	}
	
}
