# Atualiza o site do Hospital Intensivet no GitHub Pages.
# Uso:  & 'C:\hospital-intensivet-site\atualizar.ps1'  (opcional: -Mensagem "o que mudou")
param([string]$Mensagem = "Atualiza o protótipo")
$ErrorActionPreference = 'Stop'
Set-Location 'C:\hospital-intensivet-site'
python construir.py
git add -A
if (git status --porcelain) {
  git commit -m $Mensagem | Out-Null
  git push
  Write-Host "Enviado. O site atualiza em 1 a 2 minutos: https://rtc-intensivet-cursos.github.io/hospital-intensivet/"
} else { Write-Host "Nada mudou." }
