# 🚲 Système Shop de BMX FiveM

Script de location de vélos BMX pour les serveur role play FiveM.

`Ce script est entièrement modifiable et adaptable le selon vos besoins.`

Le Prix part defaut :

- BMX - 5 minutes (100$)
- BMX – 10 minutes (200$)
- Cruiser – 10 minutes (300$)
- Scorcher – 20 minutes (600$)
- TriBike Course – 1h (1000$)

## 📍 Configuration du prix dans : 

```client.lua
options = {
            {
                title = 'BMX 5 minutes',
                description = 'Prix : 100$',
                icon = 'bicycle',
                onSelect = function()
                    TriggerServerEvent('bmxshop:buyBike', 'bmx', 100, 5) <- 100 et le prix ->
                end
            },
            {
                title = 'BMX 10 minutes',
                description = 'Prix : 200$',
                icon = 'bicycle',
                onSelect = function()
                    TriggerServerEvent('bmxshop:buyBike', 'bmx', 200, 10) <- 200 et le prix ->
                end
            },
            {
                title = 'Cruiser 10 minutes',
                description = 'Prix : 300$',
                icon = 'bicycle',
                onSelect = function()
                    TriggerServerEvent('bmxshop:buyBike', 'cruiser', 300, 10) <- 300 et le prix ->
                end
            },
            {
                title = 'Scorcher 20 minutes',
                description = 'Prix : 600$',
                icon = 'bicycle',
                onSelect = function()
                    TriggerServerEvent('bmxshop:buyBike', 'scorcher', 600, 20) <- 600 et le prix ->
                end
            },
            {
                title = 'TriBike Course 1h',
                description = 'Prix : 1000$',
                icon = 'bicycle',
                onSelect = function()
                    TriggerServerEvent('bmxshop:buyBike', 'tribike2', 1000, 60000) <- 1000 et le prix ->
                end
            }
```

---

## 🚀 Fonctionnalités

- ✅ PNJ vendeur statique
- ✅ Interaction via ox_target
- ✅ Menu contextuel avec ox_lib
- ✅ Paiement en argent liquide (ESX)
- ✅ Spawn automatique du vélo
- ✅ Système de location avec timer automatique
- ✅ Suppression du véhicule à la fin du temps
- ✅ Blip sur la carte
- ✅ Vélos disponibles

---

 ## 📦 Dépendances

- 🔹 **ox_lib**  
  👉 https://github.com/overextended/ox_lib  

- 🔹 **ox_target**  
  👉 https://github.com/overextended/ox_target

- 🔹 **ESX**  
  👉 https://github.com/mitlight/es_extended

- 🔹 FXServer (FiveM)

⚠️ Assurez-vous que `ox_lib` et `ox_target` et `es_extended` sont installés et démarrés avant le dossier.

---

## ⚙️ Compatibilité Framework

- ✔️ cerulean
- ✔️ Standalone  
- ✔️ Serveur RP  
- ✔️ ESX  
- ✔️ OneSync
- ✔️ ox_lib
- ✔️ ox_target

---

## 🗺️ Mapping

- 🔹 **SKATEPARK + INTÉRIEUR**  
  👉 https://pablitomodz.tebex.io/package/5656300  

- 🔹 **Vidéo du Mapping**  
  👉 https://www.youtube.com/watch?v=MzK-br3qQME

---

## 📥 Installation

### 1️⃣ Télécharger le dossier

Placez le dossier dans votre `resources/`

---

### 2️⃣ Ajouter au server.cfg

Ajoutez les lignes suivantes dans votre `server.cfg` :

```cfg
ensure ox_lib
ensure ox_target
ensure es_extended
ensure chops_bmx
```
