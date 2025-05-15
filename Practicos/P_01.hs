
--Practico 01 (NO MODIFICAR)

{-

-}


-- 13. En las siguientes definiciones identificá las variables, las constantes y el nombre de la función
--a) f.x = 5 ∗ x
f :: Int -> Int
f x = 5 * x

--b) duplica.a = a + a
duplica :: Int -> Int
duplica a = a + a

--c) por2.y = 2 ∗ y
por2 :: Int -> Int
por2 y = 2 * y

--d) multiplicar.zz.tt = zz ∗ tt
multi :: Int -> Int -> Int
multi z t = z*t

--Ejemplo de Cuadrado de un número
cuadrado :: Int -> Int
cuadrado x = x^2

--14. Escribí una función que dados dos valores, calcule su promedio.
promedio :: Fractional a => a -> a -> a
promedio a b = (a + b)/2


signo :: Int -> Int
signo x | x==0 = 0
        | x>0 = 1    -- esta madre es una función con guardas, son condicionales que devuelven un valor diferente cuando se cumple alguna.
        | otherwise = -1   -- minimo una debe de cumplir y ejecutarse, o sinó tira error

entre0y9 :: Int -> Bool
entre0y9 x = x>=0&&x<=9
        --Podemos poner


{- rangoPrecio : Int → String, que dado un n´umero que representa el precio de una computadora,
retorne “muy barato” si el precio es menor a 2000, “demasiado caro” si el precio es mayor que 5000,
“hay que verlo bien” si el precio est´a entre 2000 y 5000, y “esto no puede ser!” si el precio es negativo. -}

rangoPrecio :: Int -> String
rangoPrecio x   | x<2000 = "Muy Barato"
                | x>5000 = "Demasiado Caro"
                | x>=2000&&x<=5000 = "Hay que verlo Bien"


{-
esMultiplo2 : Int → Bool, que dado un entero n devuelve True si n es m´ultiplo de 2.
Ayuda: usar mod, el operador que devuelve el resto de la divisi´on.
-}

esMultiplo2 :: Int -> Bool
esMultiplo2 = even

emd :: Int -> Int -> Bool
emd a b = a `mod` b == 0

{-
Definir la función esBisiesto: Int→ Bool, que indica si un año es bisiesto. Un año es bisiesto si es divisible
por 400 o es divisible por 4 pero no es divisible por 100.
-}

esBis :: Int -> Bool
esBis x = x `mod` 400 == 0 || x `mod` 4 == 0&& (x `mod` 100) /= 0 -- más rapido en una sola linea


{-21. Definir la funci´on dispersion : Int→ Int→ Int→ Int, que toma los tres valores y devuelve la diferencia
entre el m´as alto y el m´as bajo. Ayuda: extender max y min a tres argumentos, usando las versiones de
dos elementos. De esa forma se puede definir dispersi´on sin escribir ninguna guarda (las guardas est´an en
max y min, que estamos usando).-}

disp :: Int -> Int -> Int -> Int
disp x y z  = maximum [x, y, z] - minimum [x, y, z]


{-22. Definir la funci´on celsiusToFahr : Float→ Float, pasa una temperatura en grados Celsius a grados
Fahrenheit. Para realizar la conversi´on hay que multiplicar por 1.8 y sumar 32.-}

celciusToFahr :: Float -> Float
celciusToFahr x = x*1.8+32 --Acá no hace falta parentesis, ya que por precedencia te queda igual a que no los pongas.


{-23. Definir la funci´on fahrToCelsius : Float→ Float, la inversa de la anterior. Para realizar la conversi´on hay
que primero restar 32 y despu´es dividir por 1.8.
-}

fahrToCelsius :: Float -> Float
fahrToCelsius x = (x-32) / 1.8

{-
24. Definir la funci´on haceFrioF : Float→ Bool, indica si una temperatura expresada en grados Fahrenheit
es fr´ıa. Decimos que hace fr´ıo si la temperatura es menor a 8 grados Celsius.
-}

haceFrioF :: Float -> Bool
haceFrioF x = fahrToCelsius x<8 {-Acá usamos la función "fahrToCelsius" que definimos antes,
Esto es bueno para entender que podemos reutilizar una funcion en otra para ahorrar espacio-} 

-- segundo3 : (Int, Int, Int) → Int, que dada una terna de enteros devuelve su segundo elemento.

segundo3 :: (Int, Int, Int) -> Int
segundo3 (x, y, z) =  y

{-
ordena : (Int, Int) → (Int, Int), que dados dos enteros los ordena de menor a mayor.
-}

ordena :: (Int, Int) -> (Int, Int)
ordena (a, b)   | a <= b = (a, b)
                | otherwise = (b, a)

{-
Si quisiesemos hacer ordena3 , el cual ordene 3 elementos, se nos va un poquito a la mierda el codigo, nos quedaría algo así:

ordena3 :: (Int, Int, Int) -> (Int, Int, Int)
ordena3 (a, b, c) | a <= b && b <= c = (a, b, c)
| a <= c && c <= b = (a, c, b)
| b <= a && a <= c = (b, a, c)
| b <= c && c <= a = (b, c, a)
| c <= a && a <= b = (c, a, b)
| otherwise = (c, b, a)

Efectivamente, un lio, y peor si queremos seguir metiendole elementos. Por eso es que vamos a usar la función `Sort` del modulo `Data.List`
Y nos queda algo así:

ordena3 :: (Int, Int, Int) -> (Int, Int, Int)
ordena3 (a, b, c) = let [x, y, z] = sort [a, b, c] --> Acá usé let para asignarle un valor a una lista [x, y, z] y poder operar con ella usando Sort
in (x, y, z)

-}