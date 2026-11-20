param(
  [Parameter(Mandatory=$true)][string]$RepoPath
)
$ErrorActionPreference = "Stop"
$indexPath = Join-Path $RepoPath "index.html"
$homePath = Join-Path $PSScriptRoot "home-section.html"
$cssPath = Join-Path $PSScriptRoot "redesign.css"
$swSource = Join-Path $PSScriptRoot "sw.js"
if (!(Test-Path $indexPath)) { throw "Não encontrei index.html em $RepoPath" }
$html = Get-Content $indexPath -Raw -Encoding UTF8
$home = Get-Content $homePath -Raw -Encoding UTF8
$css = Get-Content $cssPath -Raw -Encoding UTF8
$homePattern = '(?s)<section id="home" class="screen active">.*?</section>'
if ([regex]::Matches($html,$homePattern).Count -ne 1) { throw "Não localizei a tela inicial esperada. Nenhum arquivo foi alterado." }
$html = [regex]::Replace($html,$homePattern,[System.Text.RegularExpressions.MatchEvaluator]{ param($m) $home },1)
$galleryStart = '<div class="panel"><div class="eyebrow">Imagens do livro</div>'
$answerStart = '<div class="panel lesson" style="margin-top:16px"><div class="eyebrow">Gabarito de revisão</div>'
$a = $html.IndexOf($galleryStart)
$b = $html.IndexOf($answerStart)
if ($a -lt 0 -or $b -lt $a) { throw "Não localizei a galeria antiga de fotos do livro. Nenhum arquivo foi alterado." }
$newGallery = @'
<div class="panel">
  <div class="eyebrow">Personagens e manifestações</div>
  <h3 style="font-size:24px;margin:8px 0 4px">Conheça quem dá vida às histórias</h3>
  <p style="font-size:13px;color:var(--muted);line-height:1.6">Ilustrações selecionadas do material: sem fotografias de páginas, exercícios ou folhas do livro.</p>
  <div class="study-art-row">
    <figure class="study-art"><img src="assets/pages/auto-do-boi-imagem-detalhe.webp" alt="Ilustração do Auto do Boi"><figcaption>🐂 Auto do Boi — festa, música e tradição</figcaption></figure>
    <figure class="study-art"><img src="assets/pages/xilogravura-joao-grilo.webp" alt="Xilogravura de João Grilo"><figcaption>🎭 João Grilo — esperteza e humor no cordel</figcaption></figure>
  </div>
</div>
'@
$html = $html.Substring(0,$a) + $newGallery + "`r`n" + $html.Substring($b)
$html = $html.Replace('Resumo elaborado a partir das fotografias recebidas.','Explore os temas e observe ilustrações que representam a cultura popular brasileira.')
$styleIndex = $html.LastIndexOf('</style>')
if ($styleIndex -lt 0) { throw "Tag de estilo não encontrada." }
$html = $html.Insert($styleIndex,$css + "`r`n")
Set-Content -Path $indexPath -Value $html -Encoding UTF8
Copy-Item $swSource (Join-Path $RepoPath "sw.js") -Force
Write-Host "Redesign aplicado. Foram atualizados index.html e sw.js." -ForegroundColor Green
Write-Host "As questões, os gabaritos, os jogos e app.js foram preservados."
