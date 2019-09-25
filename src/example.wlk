class Alumno {

	var property nombre
	var property creditos
	const inscripcion = new Inscripcion()
	const property carrerasEstudiadas = []
	const materiasAprobadas = []
	const notas = {}

	method puedeCursar(materia) {
		return self.carreraContieneMateria(materia) and (not(self.aproboMateria(materia))) 
			and materia.cumpleRequisito(self) and not(inscripcion.estaInscripto(materia))
		 }
	
	method carreraContieneMateria(materia){ return carrerasEstudiadas.all({carrera => carrera.contieneMateria(materia)})	

	
	method aproboMateria(materia) {
		return materiasAprobadas.contains(materia)
	}
	
	method estaInscripto(materia){
		return inscripcion.estaInscripto(materia)
	}
	
	method apruebaMateria(materia){
		
		materiasAprobadas.add(materia)
		}

	method inscribirMateria(materia){ 
		if (materia.cumpleRequisito(self) and materia.cupo() > 0 and not(self.estaInscripto(materia))){
			inscripcion.inscripcionMateria(materia)
			materia.inscriptos.add(self)
		}else
		materia.listaDeEspera().add(self)
	}
	
	method darDeBaja(materia){
		if (self.inscripcion().estaInscripto(materia)){
			self.inscripcion().materiasInscriptas().remove(materia)
			materia.listaDeEspera().first().inscribirMateria(materia)
			
		} 
		
	}
}
	



class Materia {
	var property requisito = nada
	var property anio = 1
	var property cupo = 10
	const listaDeEspera = {}
	const inscriptos = {}
	
	method cumpleRequisito(alumno) = requisito.cumpleRequisito(alumno,anio)
	
}

class Credito{
	var property credito = 0
	
	method cumpleRequisito(alumno,anio){ return (alumno.creditos() >= credito)}
}

class Correlativa{
	const listaDeCorrelativas = []
	method cumpleRequisito(alumno,anio) {
		return listaDeCorrelativas.all({ materia => alumno.materiasAprobadas().contains(materia)})   
	
	}
}

class PorAnio{
	
	method cumpleRequisito(alumno,anio){
		
		const anioAnterior = alumno.carrerasEstudiadas().materiasDeAnio(anio)

		return anioAnterior.all({ materia => alumno.materiasAprobadas().contains(materia)})	
		
	}
	
}

object nada{
	method cumpleRequisito(alumno,anio){ return true }
}

class Carrera {

	const property materiasDeCarrera = []
	
	method materiasDeAnio(anio){
		
		return materiasDeCarrera.filter({materia => materia.anio() < anio})
	}
	
	method contieneMateria(materia) = materiasDeCarrera.contains(materia)
	
}

class Inscripcion {

	const materiasInscriptas = []

	method inscripcionMateria(materia){
		materiasInscriptas.add(materia)
	}
	method estaInscripto(materia){ return materiasInscriptas.contains(materia)}
}

class Nota {

	const notasDeMateria = []

}

