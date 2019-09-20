class Alumno {

	var property nombre
	var property creditos
	var property inscripcion
	var property carrerasEstudiadas = []
	const materiasAprobadas = []

	method puedeCursar(materia) {
		if (carrerasEstudiadas.any().contieneMateria(materia) and (not(self.aproboMateria(materia)))) {
			return "hola"
		}else return false
		
	
	}
	method aproboMateria(materia) {
		return materiasAprobadas.contains(materia)
	}
	
	method estaInscripto(materia){
		return inscripcion.estaInscripto(materia)
	}
	
	
}

class Materia {

	var property credito
	var property anoMateria
	var property requisito
	
	
	method cumpleRequisito(alumno, correlativas){ return requisito.cumpleRequisito()}

	method definirCorrelativas(materia){ requisito.listaDeCorrelativas().add(materia)}
	
}

object correlativas{
	const listaDeCorrelativas = []
	
	method cumpleRequisito(alumno) {
		return alumno.materiasAprobadas().contains(listaDeCorrelativas.all())
	}
}

object porAnio{
	method cumpleRequisito(alumno){  }
}

class Carrera {

	const materiasDeCarrera = []

	method contieneMateria(materia) = materiasDeCarrera.contains(materia)

}

class Inscripcion {

	const materiasInscriptas = []


	method estaInscripto(materia){ return materiasInscriptas.contains(materia)}
}

class Notas {

	const notasDeMateria = []

}

