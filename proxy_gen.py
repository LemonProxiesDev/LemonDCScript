#Generatore di subnet per lemonProxies


indirizzo_ip = str(input('Inserisci l\'indirizzo ip (senza le ultime tre cifre): '))

ip_totali = int(input('Quanti ip ha la subnet?: '))

password = str(input('Inserisci la password: ')) 

for i in range(ip_totali + 1):
    print(indirizzo_ip + '.' + str(i) + ':lemonproxies:3128:' + password)
 
