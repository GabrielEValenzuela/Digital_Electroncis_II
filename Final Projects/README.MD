Ideas:

# Control de Temperatura:

Utilizando el uC como unidad de control, y un sensor (Como el LM31 o LM55) emular el control de temperatura con un ventilador de 5V. La temperatura y velocidad del ventilador (Expresada en rmp) se visualizará en un display. Además, al hacer una interface de comunicación serial (USB por ejemplo) podría crease un log del uso. Podría añadirse la posibilidad de controlar la velocidad del ventilador  a través de alguna entrada externa o ver la forma de usar LabView (Creo que fue lo que Ud recomendó) para manejarlo.

# Proyecto de Sistema de Control I
Para el proyecto de Sistema de Control I hicimos un Helicóptero de un grado de libertad (ODF Helicopter) el cual ya tenemos el diagrama de bloques y las funciones de transferencia correspondientes. Utilizando un motor de 3.3V (El cuál tendría que ver de conseguirlo de China, ya que nacional no hay) y un potenciómetro se controla la posición de un brazo de palanca.

# Reloj digital con alarma integrada

El uC permite a través del sensor DS3231 u otro similar para implementar un RTOS que permita ingresar una determinada hora para disparar una alarma. Se podría conectar a la computadora para poder  setear la hora (Incluso, no se si será posibile puesto que el PIC 16F887 tiene ciertas limitaciones, añadir una interface de comunicación inalámbrica (BT) para conectarse)

# Otros proyectos
Hemos visto también la aplicación de un sistema de alarma de una casa, utilizando un display y un teclado matricial (Que podría también añadir un módulo de conexión inalámbrica a fin de, por ejemplo, enviar una "señal silenciosa" en caso de que el sensor detecte algo inusual)
