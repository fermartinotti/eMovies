# eMovies
 Challenge eMovie para Rappi.

## ¿En qué consiste el principio de responsabilidad única? ¿Cuál es su propósito?
Es uno de los principios mas importantes de los principios solid SOLID de Robert C. Martin. 
Este principio nos propone que una clase (o podria ser un modulo) tenga una y solo una responsabilidad. De esta manera generamos un desacoplamiento y una separacion muy clara de responsabilidades, facil de mantener y por sobre todo muy facil de escalar o cambiar determinadas funcionalidades afectando lo minimo posible.

### ¿Qué características tiene, según su opinión, un “buen” código o código limpio?
Principalmente tiene que ser un codigo entendible y en lo posible autodocumentado. Lograr llevar adelante los 5 principios SOLID lo mas cercano a la realidad posible. Respetar convenciones, realizar separacion de responsabilidades prestando mucha atencion a no generar un cycle dependency y utilizar variables Weak/unowned cuando corresponda. Comunicar clases utilizando protocolos cuando sea posible y necesario. Evitar realizar Force Unwrapp (en lo posible no realizarlo nunca).
Utilizar patrones de diseño y no reinventar la rueda. Evitar la repeticion de codigo.

### Detalla cómo harías todo aquello que no hayas llegado a completar.
Cache: 
Utilizaria NSCache (por su simple implementacion) para consultar siempre si la informacion que estoy por pedir esta cacheada, en caso contrario realizaria el llamado a la API y almacernaria esa respuesta en la cache.
