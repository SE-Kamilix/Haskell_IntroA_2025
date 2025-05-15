# 2 Programación funcional

## 2.1 Programación funcional y programación imperativa

* La *programación funcional* es un estilo de programación cuyo método básico de computación es la aplicación de funciones a sus argumentos.
* Un *lenguaje de programación funcional* es uno que soporta y potencia el estilo funcional.
* La *programación imperativa* es un estilo de programación en el que los programas están formados por instrucciones que especifican cómo se ha de calcular el resultado.
* Ejemplo de problema para diferenciar los estilos de programación: *Sumar los n primeros números.*

## 2.2 Solución mediante programación imperativa

* Programa

```
def suma(n):
    contador = 0
    total    = 0 
    while contador < n:
        contador = contador + 1 
        total    = total + contador 
    return total
```

* Evaluación de suma(4):

```
|contador | total |
|---------|-------|
|0        | 0     |
|1        | 1     |
|2        | 3     |
|3        | 6     |
|4        | 10    |
```

## 2.3 Solución mediante programación funcional

* Programa:

```
suma n = sum [1..n]
```

* Evaluación de suma 4:

```
suma 4 
= sum [1..4]        [def. de suma] 
= sum [1, 2, 3, 4]  [def. de [..]] 
= 1 + 2 + 3 + 4     [def. de sum] 
= 10                [def. de +]
```
