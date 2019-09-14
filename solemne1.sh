#!/bin/bash
clear
echo "*******************************************"
echo "****************Bienvenido*****************"
echo "Que opcion desea realizar?"
echo ""
echo "1.- Crear Usuario"
echo "2.- Elimnar usuario"
echo "3.- Crear grupo"
echo "4.- Agregar usuario al grupo"
echo "5.- Eliminar usuario del grupo"
echo "6.- Salir"
echo ""
echo " Ingrese opcion "
read opcion
#aqui comeinza creacion de usuario
if [ $opcion = 1 ];
then
	echo "Ingresar usuario a crear"
	read usuario
	echo "¿Desea agregarlo a grupos especificos?(s/n)"
	read respuesta1
	if [ $respuesta1 = s ];
	then
		echo "Ingrese nombre del grupo primario"
		read grupo1
		groupadd $grupo1
		echo "Ingrese nombnre del grupo secundario"
		read grupo2
		groupadd $grupo2
		useradd $usuario -g $grupo1 -G $grupo2
		echo "Su solicitud se completo con exito"
		fi
	if [ $respuesta1 = n ];
        then
		echo "¿Esta seguro de crearlo? (s/n)"
		read resp2
       		if [ $resp2 = s ];
		then
		useradd $usuario
       		echo "Su solicitud se completo con exito"
        fi
		if [ $resp2 = n ];
	then
		echo "El usuario no fue creado"
	fi
fi
fi
if [ $opcion = 2 ];
then
	echo "ingrese usuario a eliminar"
	read usuario2
	echo "¿Esta seguro de eliminar al $usuario2 (s/n)?"
	read resp3
	if [ $resp3 = s ];
	then
		userdel $usuario2
		echo "el usuario $usuario2 ha sido eliminado correctamente"
	fi
	if [ $resp3 != s ];
	then
		echo "El usuario $usuario2 no ha sido eliminado"
	fi
fi
if [ $opcion = 3 ];
then
	echo "Ingrese el nombre del grupo a crear"
	read grupo
	echo "¿Esta seguro de crear grupo llamado $grupo (s/n)?"
	read resp4
	if [ $resp4 = s ];
	then		
		groupadd $grupo
		echo "el grupo $grupo ha sido creado correctamente"
	fi
	if [ $resp4 != s ];
	then
		echo "El grupo $grupo no ha sido creado"
	fi
fi
if [ $opcion = 4 ];
then
	echo "Ingrese usuario"
	read usuario3
	echo "Ingrese nombre de grupo a asignar"
	read grupo3
	usermod $usuario3 -g $grupo3
fi
if [ $opcion = 5 ];
then
	echo "ingrese el usuario que quiere remover"
	read usuario4
	echo "indique el grupo del que desea eliminar"
	read grupo4
	echo "Esta seguro (s/n)"
	read resp5
	if [ $resp5 = s ];
	then
	gpasswd -d $usuario4 $grupo4
	echo "El usuario $usuario4 ha sido removido del grupo $grupo4 con exito"
	fi
	if [ $resp5 != s ];
	then 
		echo "El usuario $usuario4 no ha sido removido"
	fi
fi
if [ $opcion = 6 ];
then
	echo "Muchas gracias por operar con nosotro, hasta pronto"
	break
fi


