$nombreArchivo = Read-Host "[!] Dime qué fichero quieres buscar: "
$nombreDirectorio = Read-Host "[!] En qué directorio está: "

$PScore = "${nombreDirectorio}${nombreArchivo}"

$ExisteFile = Test-Path $PScore

If ($ExisteFile -eq $True) {
  Write-Host "[+] El ${nombreArchivo} si existe"
  Get-ChildItem -Path ${nombreDirectorio} -Filter ${nombreArchivo}
} Else {
  Write-Host "[-] No se encuentra el archivo ${nombreArchivo} en el directorio ${nombreDirectorio}"
}

