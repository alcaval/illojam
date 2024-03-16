

_versos_sin_arreglar =  [
	"Pues nada;gente eh;aquí dejo;lo que sería",
	"Mi mayor;creación;hasta la;fecha:",
	"Justo un;añito;después de;del anterior",
	"Y por;supuesto;dedicado;a...",
	"Al señor;Guille y;al señor;Juanito",
	"Seguimos;con;los versos;perversos",
	"De chico;raro;con;descaro",
	"Hijo;de Amparo;y de un;tuerto",
	"Mi tío;es Berto;no Romero;no Tomillo",
	"Le suena;la;barriga;¿diga?",
	"Hello I'm your;belly can you; give me some; comida?",
	"Mira of;course I can;y compro un caldo; de Avecrem",
	"Se creen;ustedes;que soy;rico", 
	"Rico;el caldo;¡Sabe;bien!",
	"¿Sabes qué más sabe bien? Jeje exacto",
	"Aunque parezca pintada por Goya no es más que mi po-po-po",
	"Poción traída de Troya la han traído Luis Bernardo Ernesto",
	"En esto que me da por ver el móvil; mensaje de texto",
	"Resulta ser Felipe VI el remitente",
	"Lo siento brother tengo el casoncio lleno 'e gente",
	"No te rayes le contesto y fuera de contexto resto",
	"Nueve menos dos son siete increíble el gesto",
	"Don Guillempleado vetado lo echaron del reservado",
	"Se pira al prado y se corre mirando un cuadro doblado",
	"Doblado él no el cuadro ¿Champú o gel? Soy calvo",
	"Te ves muy bien ¡Qué guapo! ¿te pregunté? ¡No chato!",
	"Sabes;que;Poncio;Pilato",
	"No se ha compra'o los zapatos",
	"Viene descalzo el jabato",
	"Con los pelos del puto Arrebato",
	"Y ahora te tiro unas líneas sin dar muchos datos",
	"Son cosas banales no de literatos",
	"La cosa es que vengo y me quedo pa' un rato",
	"No miro el formato te pongo el retrato",
	"Me vienen dos culos mulatos",
	"Dos culos bien grandes en un carromato",
	"Culitos de marca no culos baratos",
	"Orondas las nalgas bien anchos los anos",
	"Los cubre una tela del tipo satén",
	"La cosa es que huelen y no huelen bien",
	"Estamos hablando de anos hediondos",
	"Estando en la calle producen asombro",
	"Por sus dimensiones por su basta peste",
	"Subastan el fétido y étnico ambiente",
	"Qué asco qué guarro pa' guarra tu hermana",
	"Se saca diez mocos por fin de semana",
	"Y emana de aquí cierta sabiduría:",
	"Si el culo es rojizo muy mono sería",
	"Sorprende desnudo en la charcutería",
	"Mi abuelo Rogelio con su brujería",
	"Del Día salía un guía prendía la party",
	"Todo el mundo mano arriba and just move your body",
	"Son las fiestas de mi pueblo vente Maribel",
	"Se vino la Ana se vino Susana y la Magdalena también",
	"Recién me enteré de que un toxicómano",
	"Coma o no coma se muere por verme",
	"Me llaman la droga panoja in my pants rayitas de esencia",
	"La demencia que es bélica y trágica mágica",
	"Pito y huevito tal cual Maduro a final del jornal",
	"Nada más que añadir señores: Marca Patxingar"
]
_versos = [
	"Pues nada;gente eh;aquí dejo;lo que sería",
	"Mi mayor;creación;hasta la;fecha:",
	"Justo un;añito;después de;del anterior",
	"Y por;supuesto;dedicado;a...",
	"Al señor;Guille y;al señor;Juanito",
	"Seguimos;con;los versos;perversos",
	"De chico;raro;con;descaro",
	"Hijo;de Amparo;y de un;tuerto",
	"Mi tío;es Berto;no Romero;no Tomillo",
	"Le suena;la;barriga;¿diga?",
	"Hello I'm your;belly can you;give me some;comida?",
	"Mira of;course I can;y compro un caldo;de Avecrem",
	"Se creen;ustedes;que soy;rico", 
	"Rico;el caldo;¡Sabe;bien!"
]
randomise();
_versos = array_shuffle(_versos);
_verso_perverso = ""
_verso_perverso_index = 0
_verso_perverso_comparison = ""
_split_verso_perverso = []
_wrong_versos = []
_word_counter = 0
_result = ""
_current_word_selected = 0

//SHAKE
_elapsed_time = 0
_duration = 69 // in steps
_shake_begin = false

_original_x = obj_bokeron.x
_original_y = obj_bokeron.y

_restart_timer_flag = false

obj_arrow_key.x = x - 20
obj_arrow_key.y = y

for (var _i = 0; _i < 6; _i++) {
	var _random_index = irandom(array_length(_versos)-1);
	_wrong_versos[_i] = _versos[_random_index]
}

function reset() {
	_verso_perverso = ""
	_verso_perverso_comparison = ""
	_split_verso_perverso = []
	_wrong_versos = []
	_word_counter = 0
	_result = ""
	_current_word_selected = 0
	_versos = array_shuffle(_versos);
	for (var _i = 0; _i < 6; _i++) {
		var _random_index = irandom(array_length(_versos)-1);
		_wrong_versos[_i] = _versos[_random_index]
	}
	var _obj_to_control = instance_find(obj_arrow_key, 0);
	_obj_to_control.visible = true
	obj_bokeron.sprite_index = spr_bokeron_portrait
}
	