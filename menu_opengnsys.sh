#! /bin/bash
# script : menu_opengnsys.sh
# Proposito : Generará un menú donde automaticemos las tareas de op
#	      engnsys como el reinicio del servicio DHCP, MYSQL,
#	      además de lanzar los editores del DHCP y de configure OS
#############################################################################################################################################  Utilizaremos como herramienta principal Dialog.########################
###########################################################################################################
#	limpiamos el terminal.

clear
#	GENERAMOS LAS FUCIONES DEL MENU
#	función que reinicia el dhcp.
serv_dhcp(){
/etc/init.d/networking restart && dialog --title "REINICIO SERVICIO DHCP" --backtitle "DTE laboratorios EUPS" --msgbox "El servicio ha sido reiniciado con exito" 9 50 &&./menu_opengnsys.sh||dialog --title "REINICIO SERVICIO DHCP" --backtitle "DTE laboratorios EUPS" --msgbox "El servicio no ha sido reiniciado con exito" 9 50&&./menu_opengnsys.sh
}

#	función que reinicia la base de datos.

serv_mysql(){
/etc/init.d/networking restart && dialog --title "REINICIO SERVICIO MYSQL" --backtitle "DTE laboratorios EUPS" --msgbox "El servicio ha sido reiniciado con exito" 9 50&&./menu_opengnsys.sh||dialog --title "REINICIO SERVICIO MYSQL" --backtitle "DTE laboratorios EUPS" --msgbox "El servicio no ha sido reiniciado con exito" 9 50&&./menu_opengnsys.sh
}

#	función que reinicia el tft.

serv_tft(){
/etc/init.d/networking restart && dialog --title "REINICIO SERVICIO MYTFT" --backtitle "DTE laboratorios EUPS" --msgbox "El servicio ha sido reiniciado con exito" 9 50&&./menu_opengnsys.sh||dialog --title "REINICIO SERVICIO TFT" --backtitle "DTE laboratorios EUPS" --msgbox "El servicio no ha sido reiniciado con exito" 9 50&&./menu_opengnsys.sh
}

#	función que lanza el fichero DHCP con permisos de root.

edit_dhcp(){
sudo gedit /home/alaspaev/Desktop/menuitem
}

#	función que lanza el fichero configureOS con permisos de root.

edit_confOS(){
sudo gedit /home/alaspaev/Desktop/menuitem
}

#	configuramos el menú con dialog.

dialog --backtitle "DTE laboratorios EUPS" --menu "MENU AUTOMATIZACION TAREAS OPENGNSYS" 15 50 5\
 1  "Reiniciar servicio DHCP"\
 2  "Reiniciar servicio MYSQL"\
 3  "Reiniciar servicio TFT"\
 4  "Lanzar fichero DHCP"\
 5  "Lanzar fichero configureOS" 2>menuitem

#	menuitem guarda el fichero de salida menuitem. Dialog usa la s#	      alida de error típica 2 para exportar el valor del menú selecc#	    ionado.

menuitem=$(cat menuitem)

#	retval no es utilizada pero en dialog si tuviera un valor 0 = #	      aceptar 1=cancelar 255=escapar.

retval=$?

#	bucle donde nos movemos en el menú y el usuario selecciona la #       la acción a ejecutar.

	case $menuitem in 
		1) serv_dhcp;;
		2) serv_mysql;;
		3) serv_tft;;
		4) edit_dhcp;;
		5) edit_confOS;;
esac

#	fin del script.
