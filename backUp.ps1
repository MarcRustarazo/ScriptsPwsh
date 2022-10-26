#Este script permite copiar cualquier directorio o archivo a una ruta especificada.
$queQuieresBK = Read-Host "[!] Qué quieres copiar, directorio o archivo [d/a]:"
#Con esta variable conseguimos extraer la primera letra de la palabra.
$queQuieresBKD = $queQuieresBK.substring(0,1)

If ($queQuieresBKD -eq "d"){
  $nombreDirectorio = Read-Host "[!] Qué directorio quieres guardar:"
  $nombreDirectorioDestino = Read-Host "[!] En qué directorio quires guardar la bk:"
  #Si exisite da True
  $ExisteDirectorio = Test-Path $nombreDirectorio
  $ExisteDirec = Test-Path $nombreDirectorioDestino
  
  #Comprobamos si existen los directorios  
  If ($ExisteDirec -eq $True){
    Write-Host "[+] El directorio destino existe"
    If ($ExisteDirectorio -eq $True){
      Write-Host "[+] El directorio ${nombreDirectorio} si existe"
      #Cuando copiamos recursivamente un archivo, a mi, por lo menos, me lanza un error
      #diciendo que el path especificado es muy largo, pero sigue haciendo su función
      #asi que haciendo esto "$ErrorActionPreference = 'SilentlyContinue'" evitamos que salga
      #cualquie error.
      $ErrorActionPreference = 'SilentlyContinue'
      #Copiamos el directorio a la ruta especificada antes.
      Copy-Item -Path ${nombreDirectorio} -Destination ${nombreDirectorioDestino} -Recurse -Force -Passthru | out-null
      Write-Host "[+] Se ha hecho la copia de seguridad !"
      dir ${nombreDirectorioDestino}
      #Hacemos que la variable "$ErrorActionPreference" ya pueda mostrar los errores 
      $ErrorActionPreference = 'Continue'
    } Else {
      Write-Host "[-] No se encuentra el direcotrio: ${nombreDirectorio}"
    }
  } Else {
    Write-Host "[-] El directorio especificado (${nombreDirectorioDestino}) no existe"
  }

}

Elseif ($queQuieresBKD -eq "a"){
  $nombreArchivo = Read-Host "`n[!] Dime qué fichero quieres guardar:"
  $nombreDirectorio = Read-Host "[!] En qué directorio está: "
  $nombreDirectorioDestino = Read-Host "[!] En qué directorio quires guardar la bk:"
  $PScore = "${nombreDirectorio}/${nombreArchivo}"
  #Si exisite da True
  $ExisteFile = Test-Path $PScore
  $ExisteDirec = Test-Path $nombreDirectorioDestino
  $Extension = ".bak"
  
  #Comprobamos si existen los directorios
  If ($ExisteDirec -eq $True){
    Write-Host "[+] El directorio destino existe"
    If ($ExisteFile -eq $True){
      Write-Host "[+] El ${nombreArchivo} si existe"
      #Copiamos el archivo a la ruta especificada, con el nombre igual pero añadiendo la exitension .bak
      Copy-Item -Path ${nombreDirectorio}${nombreArchivo} -Destination ${nombreDirectorioDestino}${nombreArchivo}${Extension} -Force
      Write-Host "[+] Se ha hecho la copia de seguridad !"
      dir ${nombreDirectorioDestino}
    } Else {
      Write-Host "[-] No se encuentra el archivo ${nombreArchivo} en el directorio ${nombreDirectorio}"
    }
  } Else {
    Write-Host "[-] El directorio especificado (${nombreDirectorioDestino}) no existe"
  }
}
