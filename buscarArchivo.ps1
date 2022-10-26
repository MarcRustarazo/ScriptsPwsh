#Este script permite encontrar cualquier directorio o archivo en una ruta especificada.
$queBuscar = Read-Host "[!] Dime qué quieres buscar, d (directorio)/ a (archivo):"
#Con esta variable conseguimos extraer la primera letra de la palabra.
$queBuscarD = $queBuscar.substring(0,1)
#
#Para buscar directorios
#
If ($queBuscarD -eq "d"){
  Write-Host "[!] VAMOS A BUSCAR UN DIRECTORIO"
  $nombreDirectorio = Read-Host "[!] Qué directorio quieres buscar:"
  #Si existe la ruta será True
  $existeDirec = Test-Path $nombreDirectorio
  #Comprobamos que la ruta existe
  #sino muestra un mensaje de error.
  If ($existeDirec -eq $True) {
    Write-Host "[+] El directorio ${nombreDirectorio} si existe"
    Get-ChildItem -Path ${nombreDirectorio}
  } Else {
  Write-Host "[-] No se encuentra el directorio ${nombreDirectorio}"
  }
}
# 
#Para buscar archivos
#
Elseif ($queBuscarD -eq "a"){
  Write-Host "[!] VAMOS A BUSCAR UN ARCHIVO"
  $nombreArchivo = Read-Host "[!] Dime qué fichero quieres buscar:"
  $nombreDirectorio = Read-Host "[!] En qué directorio está:"

  $path = "${nombreDirectorio}${nombreArchivo}"
  #Comprobamos que existe
  $existeArchivo = Test-Path $path
  #Condicional, si existe se busca el archivo y lo muestra
  #sino muestra un mensaje de error.
  If ($existeArchivo -eq $True) {
    Write-Host "[+] El ${nombreArchivo} si existe"
    Get-ChildItem -Path ${nombreDirectorio} -Filter ${nombreArchivo}
  } Else {
  Write-Host "[-] No se encuentra el archivo: ${nombreArchivo}, en el directorio ${nombreDirectorio}"
  Write-Host "[-] Si el archivo si existe en la ruta especificada, prueba a poner la "/" al final cuando escribas la ruta"
  }
}

