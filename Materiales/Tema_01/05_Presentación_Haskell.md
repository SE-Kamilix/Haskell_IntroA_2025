# 5 Presentación de Haskell

## 5.1 Ejemplo de recursión sobre listas

* Especificación: (sum xs) es la suma de los elementos de xs.
* Ejemplo: sum [2,3,7] == 12
* Definición:

```
sum []     = 0
sum (x:xs) = x + sum xs
```

* Evaluación:

```
sum [2,3,7] 
= 2 + sum [3,7]           [def. de sum] 
= 2 + (3 + sum [7])       [def. de sum] 
= 2 + (3 + (7 + sum []))  [def. de sum] 
= 2 + (3 + (7 + 0))       [def. de sum] 
= 12                      [def. de +] 
```

* Tipo de sum: (Num a) => [a] -> a

## 5.2 Ejemplo con listas de comprensión

* Especificación: (ordena xs) es la lista obtenida ordenando xs mediante el algoritmo de ordenación rápida.
* Ejemplo:

```
ordena [4,6,2,5,3] == [2,3,4,5,6]
ordena "deacb"     == "abcde"
```

* Definición:

```
ordena [] = []
ordena (x:xs) = 
    (ordena menores) ++ [x] ++ (ordena mayores)
    where menores = [a | a <- xs, a <= x]
          mayores = [b | b <- xs, b > x]
```

* Tipo de ordena: Ord a => [a] -> [a]

## 5.3 Evaluación del ejemplo con listas de comprensión

```
ordena [4,6,2,3] 
= (ordena [2,3]) ++ [4] ++ (ordena [6])  
  [def. ordena] 
= ((ordena []) ++ [2] ++ (ordena [3])) ++ [4] ++ (ordena [6]) 
  [def. ordena] 
= ([] ++ [2] ++ (ordena [3])) ++ [4] ++ (ordena [6]) 
  [def. ordena] 
= ([2] ++ (ordena [3])) ++ [4] ++ (ordena [6,5]) 
  [def. ++] 
= ([2] ++ ((ordena []) ++ [3] ++ [])) ++ [4] ++ (ordena [6]) 
  [def. ordena] 
= ([2] ++ ([] ++ [3] ++ [])) ++ [4] ++ (ordena [6]) 
  [def. ordena] 
= ([2] ++ [3]) ++ [4] ++ (ordena [6]) 
  [def. ++] 
= [2,3] ++ [4] ++ (ordena [6]) 
  [def. ++] 
= [2,3,4] ++ (ordena [6]) 
  [def. ++] 
= [2,3,4] ++ ((ordena []) ++ [6] ++ (ordena [])) 
  [def. ordena] 
= [2,3,4] ++ ((ordena []) ++ [6] ++ (ordena [])) 
  [def. ordena] 
= [2,3,4] ++ ([] ++ [6] ++ []) 
  [def. ordena] 
= [2,3,4,6]
  [def. ++]
```
