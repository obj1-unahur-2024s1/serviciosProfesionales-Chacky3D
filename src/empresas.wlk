import universidades.*
import profesionales.*

class Empresa {
	
	const profesionalesContratados = #{}
	const honorarioDeReferencia
	const clientes = #{}
	
	method contratar(profesional) { profesionalesContratados.add(profesional) }
	method despedir(profesional) { profesionalesContratados.remove(profesional) }
	method cuantosEstudiaronEn(universidad) { 
		return profesionalesContratados.filter({ profesional => profesional.universidad() == universidad }).size()
	}
	method profesionalesCaros() { 
		return profesionalesContratados.filter({ profesional => profesional.honorariosPorHora() > honorarioDeReferencia})
	}
	method universidadesFormadoras() {
		return profesionalesContratados.map({ profesional => profesional.universidad() }).asSet()
	}
	method profesionalMasBarato() { 
		return profesionalesContratados.fold(profesionalesContratados.anyOne(), { 
			profesional, item => if(profesional.honorariosPorHora() > item.honorariosPorHora()) item else profesional
		})
	}
	method esDeGeneteAcotada() {
		return profesionalesContratados.all({ profesional => profesional.provinciasDondePuedeTrabajar().size() <= 3})
	}
	method puedeAtenderA(solicitante) { return profesionalesContratados.filter({ profesional => solicitante.puedeSerAtendidoPor(profesional) })}
	method darServicio(solicitante) {
		try{
			self.puedeAtenderA(solicitante).anyOne().cobrarServicio()
			clientes.add(solicitante)
		}
		catch e{
			console.println("El solicitante no puede ser atendido por ningun profesional")
		}
	}
	method cantidadDeClientes() { return clientes.size() }
	method loTieneComo(cliente) { return clientes.contains(cliente) }
	method esPocoAtractivo(profesional) {
		const provContratados = profesionalesContratados.map({ contratado => contratado.provinciasDondePuedeTrabajar() }).flatten().asSet()
		const honorariosContratados = profesionalesContratados.map({ contratado => contratado.honorariosPorHora() }).asSet()
		const provProfesional = profesional.provinciasDondePuedeTrabajar()
		return provContratados.intersection(provProfesional).equals(provProfesional) and honorariosContratados.any({ 
			honorario => honorario < profesional.honorariosPorHora()
		})
	}
	
}
