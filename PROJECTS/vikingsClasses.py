import random

# Soldier : Clase genérica de Soldado


class Soldier:
    def __init__(self, health, strength):
        self.health = health                    # Iniciliza el atributo health
        self.strength = strength                # Inicializa el atributo fuerza
    
    def attack(self):
        return self.strength                    # Devuelve la fuerza del soldado cuando ataca

    def receiveDamage(self, damage):
        self.health -= damage                   # Reduce la salud del soldado por el daño

    
# Viking : Subclase de Soldier

class Viking(Soldier):
    def __init__(self, name, health, strength): 
        self.name = name
        self.health = health
        self.strength = strength

    def battleCry(self):
        return "Odin Owns You All!"

    def receiveDamage(self, damage):
        self.health -= damage
        if self.health > 0:
            return f"{self.name} has received {damage} points of damage"
        else:
            return f"{self.name} has died in act of combat"
        
# Saxon : Subclase de Soldier

class Saxon(Soldier):
    def __init__(self, health, strength):
        self.health = health
        self.strength = strength

    def receiveDamage(self, damage):
        self.health -= damage
        if self.health > 0:
            return f"A Saxon has received {damage} points of damage"
        else:
            return f"A Saxon has died in combat"

# WAR : Clase genérica que simula la guerra entre Vikings y Saxons

class War():
    def __init__(self):                                        # Inicializa en el constructor dos listas vacías para almacenar los objetos Viking y Saxon
        self.vikingArmy = []                                  
        self.saxonArmy = []                                    

    def addViking(self, viking):                               # Añade un objeto Viking a la lista vikingArmy
        self.vikingArmy.append(viking)                          
    
    def addSaxon(self, saxon):                              
        self.saxonArmy.append(saxon)                           # Añade un objeto Saxon a la lista saxonArmy
    
    def vikingAttack(self):                                    # Simula un ataque Vikingo a un Sajón aleatorio
        viking_num = random.randint(0, len(self.vikingArmy)-1) 
        viking = self.vikingArmy[viking_num]
        saxon_num = random.randint(0, len(self.saxonArmy)-1)
        saxon = self.saxonArmy[saxon_num]

        resultado = saxon.receiveDamage(viking.strength)       # Devuelve el resultado del ataque vikingo
        
        if saxon.health <= 0:
            self.saxonArmy.remove(saxon)                       # Elimina al Sajón del ejército si muere

        return resultado

    def saxonAttack(self):                                     # Simula un ataque Sajón a un Vikingo aleatorio 
        viking_num = random.randint(0, len(self.vikingArmy)-1)
        viking = self.vikingArmy[viking_num]
        saxon_num = random.randint(0, len(self.saxonArmy)-1)
        saxon = self.saxonArmy[saxon_num]

        resultado = viking.receiveDamage(saxon.strength)      # Devuelve el resultado de un ataque Sajón
        
        if viking.health <= 0:
            self.vikingArmy.remove(viking)                    # Elimina al Vikingo del ejército si muere

        return resultado

    def showStatus(self):                                     # Retorna el estado actual de la guerra: victoria de Vikingos, supervivencia de Sajones o batalla en curso
        if not self.saxonArmy:                                ## Verificamos si contiene un array vacío
            return "Vikings have won the war of the century!"
        elif not self.vikingArmy:
            return "Saxons have fought for their lives and survive another day..."
        else:
            return "Vikings and Saxons are still in the thick of battle."

# #yop / WAR 2
# class War2:

#     def __init__(self):
#         # your code here

#     def addViking(self, Viking):
#         # your code here
    
#     def addSaxon(self, Saxon):
#         # your code here
    
#     def vikingAttack(self):
#         # your code here

#     def saxonAttack(self):
#         # your code here

#     def showStatus(self):
#         # your code here

#     pass


