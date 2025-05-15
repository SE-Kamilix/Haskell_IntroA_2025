print(__name__)
terminal_activada = True

def presentación():
    return print("Hola amigo")
presentación()

nombre = input("Quien eres?\n")

count = 20
while count > 0 and terminal_activada == True:
    print(f"Sos re gil {nombre}!!")
    count -= 1


