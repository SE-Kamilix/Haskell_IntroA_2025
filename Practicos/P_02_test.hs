--Practico 2




--25 b)
ordena :: (Int, Int) -> (Int, Int)
ordena (x, y) = (min x y , max x y)


--suma :: (Num a, Enum a) => a -> a
--suma n = sum [1..n]

--Recursividad e Inducción Aplicada a Haskell (odio discreta)

-- 3
--a)
-- Devuelve una lista que contiene solo los números pares de la lista de entrada.
soloPares :: [Int] -> [Int]
soloPares[] = []
soloPares (x:xs)    | mod x 2 == 0 = x: soloPares xs --se puede usar: even
                    | otherwise = soloPares xs

--b)
-- Devuelve una lista que contiene solo los números mayores que 10 de la lista de entrada.
mayoresQue10 :: [Int] -> [Int]
mayoresQue10[] = []
mayoresQue10 (x:xs) | x > 10 = x: mayoresQue10 xs
                    | otherwise = mayoresQue10 xs

--Funciones Recursivas --> Tipos Inductivos

{-
Una función de "fold" es aquella que dada una lista devuelve un valor resultante de combinar los elementos
de la lista. Por ejemplo: sum: [Int] -> Int devuelve la sumatoria de los elementos de la lista.
-}

-- HIGH ORDER FUNCTIONS

-- * map: aplica una función a cada elemento de la lista.
sumar1 :: [Int] -> [Int]
sumar1 = map (+ 1)

-- * fold: combina los elementos de una lista para obtener un resultado.
{-
zip:
["juan", "maría"] ["1 de C", "3 de Oro", "7 de Esp"] ---> [("juan","1 de C"),("maría","3 de Oro")]

unzip: lo mismo pero al revés.
-}

-- * zip: combina dos listas en una lista de pares.
zipe :: [a] -> [b] -> [(a, b)]
zipe [] _ = []
zipe _ [] = []
zipe (x:xs) (y:ys) = (x, y) : zipe xs ys

-- * unzip: separa una lista de pares en dos listas.
unzipe :: [(a, b)] -> ([a], [b])
unzipe [] = ([], [])
unzipe ((x, y):xs) = (x:xs1, y:ys1)
    where (xs1, ys1) = unzipe xs

{-
ejemplos:

soloPares (mayoresQue10 (sumar1 [1,5,7,3,5,9,4,6,8,2,56,8,3,7,3,776,43,67,765,67898,76543,22456789,50000000]))
-}

-- Devuelve una lista con los cuadrados de los elementos de la lista de entrada.
cuadradoL :: [Int] -> [Int]
cuadradoL = map (^ 2)

-- Devuelve la suma de los números del 1 hasta n.
suma :: (Num a, Enum a) => a -> a
suma n = sum [1..n]

-- Devuelve la suma de los elementos de una lista.
sumar :: [Int] -> Int
sumar [] = 0
sumar (x:xs) = x + sumar xs

-- Devuelve una lista donde cada elemento se incrementa en 1.
altsumar1 :: [Int] -> [Int]
altsumar1 [] = []
altsumar1 (x:xs) = (x+1): altsumar1 xs

--repartir ["Juan", "Maria"] ["1 de Copa", "3 de Oro", "7 de Espada", "2 de Basto"]
-- Devuelve una lista de pares a partir de dos listas de entrada.
repartir :: [String] -> [String] -> [(String, String)]
repartir [] xs = []
repartir xs [] = []
repartir (x:xs) (y:ys) = (x,y) : repartir xs ys

{-
Definí recursivamente los operadores básicos de listas: length, !!, take, drop, ++. Para los operadores
take y drop deberás hacer recursión en ambos parámetros, en el parámetro lista y en el parámetro
numérico.
-}
--8a)
--usaremos otra función que ordene

{-
9. (i) Definí funciones por recursión para cada una de las siguientes descripciones. (ii) Evaluá los ejemplos manualmente (iii) Identificá si las funciones son de algún tipo ya conocido (filter, map, fold). (iv)
Programálas en haskell y verificá los resultados obtenidos.
a) maximo :: [Int] -> Int, que calcula el máximo elemento de una lista de enteros.
Por ejemplo: maximo [2,5,1,7,3] = 7
Ayuda: Ir tomando de a dos elementos de la lista y ‘quedarse’ con el mayor.
b) sumaPares :: [(Int, Int)] -> Int, que dada una lista de pares de números, devuelve la sumatoria de todos los números de todos los pares.
Por ejemplo: sumaPares [(1,2)(7,8)(11,0)] = 29
c) todos0y1 :: [Int] -> Bool, que dada una lista devuelve True si ésta consiste sólo de 0s y 1s.
Por ejemplo: todos0y1 [1,0,1,2,0,1] = False, todos0y1 [1,0,1,0,0,1] = True
d) quitar0s :: [Int] -> [Int] que dada una lista de enteros devuelve la lista pero quitando todos
los ceros.
Por ejemplo quitar0s [2,0,3,4] = [2,3,4]
e) ultimo :: [a] -> a, que devuelve el último elemento de una lista.
Por ejemplo: ultimo [10,5,3,1] = 1
f ) repetir :: Int-> Int-> [Int], que dado un número n mayor o igual a 0 y un número k arbitrario
construye una lista donde k aparece repetido n veces.
Por ejemplo: repetir 3 6 = [6,6,6]
g) concat :: [[a]] -> [a] que toma una lista de listas y devuelve la concatenación de todas ellas.
Por ejemplo: concat [[1,4],[],[2]] = [1,4,2]
h) rev :: [a] -> [a] que toma una lista y devuelve una lista con los mismos elementos pero en orden
inverso.
Por ejemplo: rev [1,2,3] = [3,2,1]
-}

-- Devuelve el máximo valor dentro de una lista de enteros.
maximo :: [Int] -> Int
maximo [] = error "La lista está vacía"
maximo [x] = x
maximo (x:xs) = max x (maximo xs)

{-
Pricipio de Induccion: 
es una estrategia de demostración sobre estructuras o tipos inductivos.
Los tipos inductivos se pueden definir a partir de:
1. Caso base: caso más simple, no se puede descomponer.
2. Caso Inductivo: a partir de un elemento que ya sabemos que pertenece al tipo

-}

-- Devuelve una lista con el número k repetido n veces.
repetir :: Int -> Int -> [Int]
repetir n k | n == 0 = []
            | n < 0 = error "Numero no valido"
            | otherwise = k: repetir (n - 1) k

{-
todos0y1 :: [Int] -> Bool, que dada una lista devuelve True si ésta consiste sólo de 0s y 1s.
Por ejemplo: todos0y1 [1,0,1,2,0,1] = False, todos0y1 [1,0,1,0,0,1] = True
-}

-- Devuelve True si la lista consiste solo de 0s y 1s.
todos1y0 :: [Int] -> Bool
todos1y0 [] = True
todos1y0 (x:xs) | x == 0 || x == 1 = todos1y0 xs
                | otherwise = False


{-
sumaPares :: [(Int, Int)] -> Int, que dada una lista de pares de números, devuelve la sumatoria de todos los números de todos los pares.
Por ejemplo: sumaPares [(1,2)(7,8)(11,0)] = 29
-}

-- Devuelve la suma de todos los elementos de los pares en una lista de pares.
sumaPares :: [(Int, Int)] -> Int
sumaPares [] = 0
sumaPares ((x, y):xs) = x + y + sumaPares xs


{-
concat :: [[a]] -> [a] que toma una lista de listas y devuelve la concatenación de todas ellas.
Por ejemplo: concat [[1,4],[],[2]] = [1,4,2]
-}

-- Devuelve la concatenación de todas las listas en una lista de listas.
concatenar :: [[a]] -> [a]
concatenar [] = []
concatenar (xs:xss) = xs ++ concatenar xss