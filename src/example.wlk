class Alumno {

	var property nombre
	var property creditos
	var property inscripcion
	const property carrerasEstudiadas = []
	const property materiasAprobadas = []

	method puedeCursar(materia) {
		if (self.carreraContieneMateria(materia) and (not(self.aproboMateria(materia)))) {
			return "hola"
		}else return false
		
	}
	
	method carreraContieneMateria(materia){ return carrerasEstudiadas.any().contains(materia)	}
	
	method aproboMateria(materia) {
		return materiasAprobadas.contains(materia)
	}
	
	method estaInscripto(materia){
		return inscripcion.estaInscripto(materia)
	}
	
	method carreraContieneMateria()
	
}

class Materia {
	var property requisito
	
	method cumpleRequisito(alumno){ return requisito.cumpleRequisito(alumno)}

}

object creditos{
	var property credito = 0
	
	method cumpleRequisito(alumno){ return (alumno.creditos() >= credito)}
}

object correlativas{
	const listaDeCorrelativas = []
	method cumpleRequisito(alumno) {
		return listaDeCorrelativas.all({ materia => alumno.materiasAprobadas().contains(materia)})   
	
	}
}

object porAnio{
	method cumpleRequisito(alumno){  }
	
}

object nada{
	
}

class Carrera {

	const materiasDeCarrera = []

	method contieneMateria(materia) = materiasDeCarrera.contains(materia)

}

class Inscripcion {

	const materiasInscriptas = []


	method estaInscripto(materia){ return materiasInscriptas.contains(materia)}
}

class Nota {

	const notasDeMateria = []

}

