class Universidad{
	
	const provincia
	const honorariosRecomendados
	var dineroRecibidoPorDonaciones = 0
	
	method provincia() { return provincia }
	method honorariosRecomendados() { return honorariosRecomendados }
	method dineroRecibidoPorDonaciones() { return dineroRecibidoPorDonaciones }
	method recibir(importe) { dineroRecibidoPorDonaciones = dineroRecibidoPorDonaciones + importe }
	
}

object asociacionDeProfesionalesDelLitoral{
	var dineroRecaudado = 0
	
	method dineroRecaudado() { return dineroRecaudado }
	method recibir(importe) { dineroRecaudado = dineroRecaudado + importe }
	
}