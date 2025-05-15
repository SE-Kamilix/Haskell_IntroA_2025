# 1 Funciones

## 1.1 Funciones en Haskell

* En  *Haskell* , una *función* es una *aplicación* que toma uno o más *argumentos* y devuelve un  *valor* .
* En Haskell, las funciones se definen mediante *ecuaciones* formadas por el  *nombre de la función* , los *nombres de los argumentos* y el *cuerpo* que especifica cómo se calcula el valor a partir de los argumentos.
* Ejemplo de definición de función en Haskell:

```
doble x = x + x
```

* Ejemplo de evaluación:

```
doble 3 
= 3 + 3   [def. de doble] 
= 6       [def. de +] 
```

## 1.2 Evaluaciones de funciones en Haskell

* Ejemplo de evaluación anidada impaciente:

```
doble (doble 3)  
= doble (3 + 3)   [def. de doble]  
= doble 6         [def. de +]    
= 6 + 6           [def. de doble]  
= 12              [def. de +]
```

* Ejemplo de evaluación anidada perezosa:

```
doble (doble 3) 
= (doble 3) + (doble 3)    [def. de doble] 
= (3 +3) + (doble 3)       [def. de doble] 
= 6 + (doble 3)            [def. de +] 
= 6 + (3 + 3)              [def. de doble] 
= 6 + 6                    [def. de +] 
= 12                       [def. de +]
```

## 1.3 Comprobación de propiedades

* Propiedad: El doble de x más y es el doble de x más el doble de y
* Expresión de la propiedad:

```
prop_doble x y = doble (x+y) == (doble x) + (doble y)  
```

* Comprobación de la propiedad con QuickCheck:

```
ghci> quickCheck prop_doble
+++ OK, passed 100 tests.
```

* Para usar QuickCheck hay que importarlo, escribiendo al principio del fichero

```
import Test.QuickCheck
```

## 1.4 Refutación de propiedades

* Propiedad: El producto de dos números cualesquiera es distinto de su suma.
* Expresión de la propiedad:

```
prop_prod_suma x y = x*y /= x+y
```

* Refutación de la propiedad con QuickCheck:

```
ghci> quickCheck prop_prod_suma
*** Failed! Falsifiable (after 1 test):
0
0
```

* Refinamiento: El producto de dos números no nulos cualequiera es distinto de su suma.

```
prop_prod_suma' x y = 
    x /= 0 && y /= 0 ==> x*y /= x+y
```

* Refutación de la propiedad con QuickCheck:

```
ghci> quickCheck prop_prod_suma'
+++ OK, passed 100 tests.
ghci> quickCheck prop_prod_suma'
*** Failed! Falsifiable (after 5 tests):  
2
2
```
