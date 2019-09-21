class Alumno {

	var property nombre
	var property creditos
	var property inscripcion
	const carrerasEstudiadas = []
	const materiasAprobadas = []

	method puedeCursar(materia) {
		return self.carreraContieneMateria(materia) and (not(self.aproboMateria(materia))) 
			and materia.cumpleRequisito(self) and inscripcion.estaInscripto(materia)
		 }
	
	method carreraContieneMateria(materia){ return carrerasEstudiadas.contains(materia)	}//agregar carrera
	
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
	
	method cumpleRequisito(alumno) = requisito.cumpleRequisito(alumno)

}

class Credito{
	var property credito = 0
	
	method cumpleRequisito(alumno){ return (alumno.creditos() >= credito)}
}

class Correlativa{
	const listaDeCorrelativas = []
	method cumpleRequisito(alumno) {
		return listaDeCorrelativas.all({ materia => alumno.materiasAprobadas().contains(materia)})   
	
	}
}

class porAnio{
	method cumpleRequisito(alumno){  }
	
}

object nada{
	method cumpleRequisito(alumno){ return true }
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

