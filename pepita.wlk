object pepita {
	var energia = 100
	
	method comer(comida) {
		energia += comida.energiaQueAporta()
	}
	
	method volar(distancia) {
		self.validarVolar(distancia)
		
		energia -= self.energiaParaVolar(distancia)
	}
	
	method energiaParaVolar(distancia) = 10 + distancia
	
	method puedeVolar(distancia) = energia >= self.energiaParaVolar(distancia)
	
	method validarVolar(distancia) {
		if (!self.puedeVolar(distancia)) self.error("Energía para volar insuficiente")
	}
	
	method energia() = energia
}

object alpiste {
	method energiaQueAporta() = 20
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() = madurez
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() = base * madurez
}

object pepon {
	var energia = 30
	var ultimaComida = manzana
	
	method energia() = energia
	
	method comer(comida) {
		self.validarNoRepeticionDeComida(comida)
		
		energia += comida.energiaQueAporta() / 2
		ultimaComida = comida
	}
	
	method volar(distancia) {
		self.validarVolar(distancia)
		
		energia -= self.energiaParaVolar(distancia)
	}
	
	method energiaParaVolar(distancia) = 20 + (2 * distancia)
	
	method puedeVolar(distancia) = energia >= self.energiaParaVolar(distancia)
	
	method validarVolar(distancia) {
		if (!self.puedeVolar(distancia)) self.error("Energía para volar insuficiente")
	}
	
	method validarNoRepeticionDeComida(comida) {
		if (comida == ultimaComida) self.error("Pepón no puede comer la misma comida de forma consecutiva")
	}
}

object roque {
	var ave = pepita
	var cenas = 0
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas += 1
	}
}