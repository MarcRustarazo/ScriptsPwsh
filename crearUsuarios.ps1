#Este script permite añadir usuarios al sistema desde el terminal
#Pedimos el nombre del usuario
$nombreUsuario = Read-Host "[!] Como se llama el usuario"
#Pedimos la contraseña, con el parámetro "-AsSecureString" hacemos que no se muestre
#la contraseña en texto claro.
$password = Read-Host "[!] Qué contraseña queires" -AsSecureString
#Creamos el usuario con el nombre y contraseña especificadas.
#
New-LocalUser $nombreUsuario -Password $password  -FullName "El nombre entero del usuario ${nombreUsuario}" -Description "esta es la descripcion de ${nombreUsuario}"
#
#Listamos los usuarios del
Get-LocalUser $nombreUsuario

$adminSN = Read-Host "[!] ¿Quiéres que el usuario sea administrador?[s/n]"
$respuestaAdminSN = $adminSN.substring(0,1).ToLower()

If($respuestaAdminSN -eq "s"){
  
  #Ponemos al usuario en el grupo Administradores
  Add-LocalGroupMember -Group "Administradores" -Member $nombreUsuario
  Write-Host "Estos son los usurios del grupo Administradores"
  Get-LocalGroupMember -Group "Administradores"

} 
ElseIf ($respuestaAdminSN -eq "n"){

  #Ponemos al usuario en el grupo Usuarios
  Add-LocalGroupMember -Group "Usuarios" -Member $nombreUsuario
  Write-Host "Estos son los usurios del grupo Usuarios"
  Get-LocalGroupMember -Group "Usuarios"

}






