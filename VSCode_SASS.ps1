# ======================================================================== #
# NAME: VSCode_SASS.ps1
# AUTHOR: Sebastien CHATEL
# DATE: 02/03/2025
#
# VERSION 1.0
# COMMENTS: Creation d'un projet VSCode pour SAAS.
# My Github: https://github.com/Dev-IT-Seb/"
# ======================================================================== #
Clear-Host                                                                         
# ======================================================================== #
                                # VARIABLES #
# ======================================================================== #
# EXTENSION SASS
$extension_sass = ".scss"
# DOSSIER 2EME LEVEL
$Directory_level = ('assets','css','fonts')
# DOSSIERS DANS ASSETS
$directory_Assets = ('abstracts','vendors','base','layout','components','pages','themes','utils','images')
# DOSSIERS DANS COMPONENTS
$directory_Components = ('buttons','cards','modals')
# DOSSIER RACINE
$directory = (Get-ChildItem $PSScriptRoot).Name
# DOSSIER FONTS
$directory_Fonts = "fonts"
# DOSSIER CSS
$directory_css = "css"
# ======================================================================== #
                            # FICHIERS SCSS #
# ======================================================================== #
$abstracts = ('_variables','_mixins','_functions','_placeholders','_colors','_typography')
$base = ('_reset','_typography','_global')
$layout = ('_header','_footer','_sidebar','_grid','_forms')
$components = ('_alerts','_badges','_breadcrumbs','_dropdown','_pagination','_carousel')
$buttons = ('_primary','_secondary','_icon')
$cards = ('_product-card','_testimonial-card')
$modals = ('_modal')
$pages = ('_home','_about','_contact','_blog','_404')
$themes = ('_light','_dark')
$utils = ('_helpers','_animations','_accessibility','_spacing','_visibility')
$main = ('_main')
# FICHIER HTML 
$html = "index.html"
# FICHIER CSS
$Css = "styles.css"
# FICHIER SCSS
$Scss = "styles.scss"
# FICHIERS ARBORESCENCE
$arborescence = "arborescence-projet.log"
# FICHIERS PAGES + LAYOUT
$pages_use = ('_404.scss','_about.scss','_blog.scss','_contact.scss','_home.scss')
$layout_use = ('_footer.scss','_forms.scss','_grid.scss','_header.scss','_sidebar.scss')
# ======================================================= #
#region ELEVATION ADMIN
try {
	If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
		Write-Host "Auto Elevation du script en tant qu'administrateur"
		$arguments = "-ExecutionPolicy Bypass -command & '" + $myinvocation.mycommand.definition + "'"
		Start-Process powershell -Verb runAs -ArgumentList $arguments -wait
		Break
	}
}
catch {
	Write-Error "Impossible de vérifier ou de pratiquer l'auto élévation du script."
	Write-Error $_.Exception.Message
	Start-Sleep 10
}
#endregion
# ======================================================================== #
    # VERIFICATION DU DOSSIER RACINE AVANT CREATION DE LA STRUCTURE #
# ======================================================================== #
Start-Sleep -Seconds 3
Write-host "

===========================================================
        SCRIPT DE CREATION DE STRUCTURE SASS
                CREATOR : Sebastien CHATEL
                DATE : 01/03/2025
        ------------------------------------
                    
Cette structure vous permettra d'obtenir une structure de base
SASS pour vos projets VsCode.

Vous pourrez si besoin ajouter/modifier d'autres creations de 
fichiers '*.scss' ou autres, dans ce script.
        ---------------------------------
My Github: https://github.com/Dev-IT-Seb/
===========================================================
" -ForegroundColor Green
Start-Sleep -Seconds 7
Pause
# NOM DU DOSSIER
Clear-Host
$Data_User = Read-Host "DEFINISSEZ LE NOM DE VOTRE DOSSIER POUR VOTRE PROJET VSCODE"
# Launch Windows Forms
Add-Type -AssemblyName System.Windows.Forms
$FolderSelect = New-Object System.Windows.Forms.FolderBrowserDialog
Clear-Host
Write-Host "SELECTIONNER L'EMPLACEMENT POUR VOTRE DOSSIER" -ForegroundColor Red -BackgroundColor Black
# ======================================================================== #
If ($FolderSelect.ShowDialog() -eq "OK") {
    Write-Host "DOSSIER SELECTIONNE AVEC SUCCES" -ForegroundColor Green -BackgroundColor Black
    Start-Sleep -Seconds 2
    $Path = $FolderSelect.SelectedPath
    $Directory_Racine = "$Path/$Data_User"
    Write-Host "Le CHEMIN DE VOTRE DOSSIER: $Path" -ForegroundColor Green -BackgroundColor Black
    Pause
    Clear-Host
# ======================================================================== #
                        # CHEMIN DES FICHIERS #                           
# ======================================================================== #
    #PATH ABSTRACTS
    $Files_Abstracts = "$Path\$Data_User\assets\abstracts\"
    #PATH BASE
    $Files_Base = "$Path\$Data_User\assets\base\"
    #PATH LAYOUT
    $Files_Layout = "$Path\$Data_User\assets\layout\"
    #PATH COMPONENTS
    $Files_Components = "$Path\$Data_User\assets\components\"
    #PATH BUTTONS
    $Files_Buttons = "$Path\$Data_User\assets\components\buttons\"
    #PATH CARDS
    $Files_Cards = "$Path\$Data_User\assets\components\cards\"
    #PATH MODAL
    $Files_Modals = "$Path\$Data_User\assets\components\modals\"
    #PATH PAGES
    $Files_Pages = "$Path\$Data_User\assets\components\pages\"
    #PATH THEMES
    $Files_Themes = "$Path\$Data_User\assets\components\themes\"
    #PATH UTILS
    $Files_Utils = "$Path\$Data_User\assets\components\utils\"
    #PATH ASSETS
    $Files_Assets = "$Path\$Data_User\assets\"
# ======================================================================== #
                        # CONTENU DU FICHIER RESET #
# ======================================================================== #
    $reset_data =
        "* {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
}
"
# ======================================================================== #
                        # CONTENU DU FICHIER HTML #
# ======================================================================== #
    $Content_HTML = @"
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="description" content=" Veuillez remplir ici afin que les internautes puissent en savoir plus sur votre entreprise ou produit ">
        <title>Titre de l'onglet</title>
        <link rel="icon" type="image/png" href="Chemin de votre image">
        <link rel="stylesheet" href="./css/styles.css">
        <link rel="stylesheet" href="./fonts/styles.css">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <header>

        </header>
        <main>

        </main>
        <footer>

        </footer>
    </body>
</html>
"@
# ======================================================================== #
                                # VARIABLES #
# ======================================================================== #
    $fonts = @"
/** FONT **/
@font-face {
    font-family:"NOM FONT";
    src: url("CHEMIN");
}
"@
# ======================================================================== #
                        # CONTENU FICHIER FONTS #
# ======================================================================== #
    $main_use = "
/** ABSTRACTS**/
@use'./abstracts/colors' as *;
@use'./abstracts/functions' as *;
@use'./abstracts/mixins' as *;
@use'./abstracts/placeholders' as *;
@use'./abstracts/typography' as *;
@use'./abstracts/variables' as *;

/** BASE **/
@use'./base/global' as *;
@use'./base/reset' as *;
@use'./base/typography' as *;

/** COMPONENTS **/
@use'./components/alerts' as *;
@use'./components/badges' as *;
@use'./components/breadcrumbs' as *;
@use'./components/carousel' as *;
@use'./components/dropdown' as *;
@use'./components/pagination' as *;

/** BUTTONS **/
@use'./components/buttons/icon' as *;
@use'./components/buttons/primary' as *;
@use'./components/buttons/secondary' as *;
/** CARDS **/
@use'./components/cards/product-card' as *;
@use'./components/cards/testimonial-card' as *;

/** MODAL **/
@use'./components/modals/modal' as *;

/** PAGES **/
@use'./components/pages/404' as *;
@use'./components/pages/about' as *;
@use'./components/pages/blog' as *;
@use'./components/pages/contact' as *;
@use'./components/pages/home' as *;

/** THEMES **/
@use'./components/themes/dark' as *;
@use'./components/themes/light' as *;

/** UTILS **/
@use'./components/utils/accessibility' as *;
@use'./components/utils/animations' as *;
@use'./components/utils/helpers' as *;
@use'./components/utils/spacing' as *;
@use'./components/utils/visibility' as *;

/** LAYOUT **/
@use'./layout/footer' as *;
@use'./layout/forms' as *;
@use'./layout/grid' as *;
@use'./layout/header' as *;
@use'./layout/sidebar' as *;
"
# ======================================================================== #
                        # CONTENU FICHIER MAINS.SCSS #
# ======================================================================== #
    $main_scss = "@use'../assets/main' as *;"
# ======================================================================== #
                    # CONTENU FICHIERS PAGES ET LAYOUT #
# ======================================================================== #
# PAGES 
    $pages_data =  
"@use'../../abstracts/variables' as *;
@use'../../abstracts/mixins' as *;"
#
# LAYOUT
    $layout_data =  
"@use'../abstracts/variables' as *;
@use'../abstracts/mixins' as *;"
# ======================================================================== #
                            # STRUCTURE DOSSIERS #                          
# ======================================================================== #
        # CREATION DU DOSSIER RACINE
        Write-Host "CREATION DE VOTRE DOSSIER '$Data_User' POUR VOTRE PROJET VSCODE" -ForegroundColor Red -BackgroundColor Black
        Start-Sleep -Seconds 2
        New-Item -Path "$Path\" -Name "$Data_User" -ItemType Directory -Force -Verbose
        Write-Host "CREATION DE VOTRE DOSSIER '$Data_User' POUR VOTRE PROJET VSCODE OK" -ForegroundColor Green -BackgroundColor Black
        Start-Sleep -Seconds 2
        Clear-Host
# ======================================================================== #
        Write-Host "CREATION DE L'ARBORESCENCE" -ForegroundColor Red -BackgroundColor Black
        Start-Sleep -Seconds 2
        # CREATION DES DOSSIERS DANS 2EME LEVEL
        Foreach ($Directory_level2 in $Directory_level){
            New-Item -Path $Directory_Racine -Name "$($Directory_level2)" -ItemType Directory -Force -Verbose
        }
# ======================================================================== #
        # CREATION DES DOSSIERS DANS ASSETS
        Foreach ($directory_Assets2 in $directory_Assets){
            New-Item -Path "$Path/$Data_User\assets\" -Name "$($directory_Assets2)" -ItemType Directory -Force -Verbose
        }
# ======================================================================== #
        # CREATION DES DOSSIERS DANS COMPONENTS
        Foreach ($directory_Components2 in $directory_Components){
            New-Item -Path "$Path\$Data_User\assets\components/" -Name "$($directory_Components2)" -ItemType Directory -Force -Verbose
        }
        Write-Host "CREATION DE L'ARBORESCENCE OK" -ForegroundColor Green -BackgroundColor Black
        Start-Sleep -Seconds 2
        Clear-Host
# ======================================================================== #
            # CREATIONS FICHIERS SCSS HTML FONT CSS + AJOUT CONTENU #              
# ======================================================================== #
        Write-Host "CREATION DES FICHIERS SAAS" -ForegroundColor Red -BackgroundColor Black
        Start-Sleep -Seconds 2
# ======================================================================== #
        # CREATION DES FICHIERS SASS DANS ABSTRACTS SCSS
        Foreach ($abstracts2 in $abstracts){
            New-Item -Path $Files_Abstracts -ItemType File -Name "$abstracts2$extension_sass" -Force -Verbose
        }
# ======================================================================== #
        # CREATION DES FICHIERS SASS DANS BASE SCSS
        Foreach ($base2 in $base){
            New-Item -Path $Files_Base -ItemType File -Name "$base2$extension_sass" -Force -Verbose
        }
            # AJOUT DU CONTENU RESET SCSS
            $base_condition = "$base2$extension_sass"
            $search_resetFile = (Get-ChildItem -Path $Files_Base).Name
            
            Foreach ($search_resetFile2 in $search_resetFile){

                If ($search_resetFile2 -match "_reset.scss"){
                    Add-Content -Path "$Files_Base$search_resetFile2" -Value "$reset_data" -Force -Verbose
                }
            }
# ======================================================================== #
        # CREATION DES FICHIERS SASS DANS LAYOUT SCSS
        Foreach ($layout2 in $layout){
            New-Item -Path $Files_Layout -ItemType File -Name "$layout2$extension_sass" -Force -Verbose
        }
# ======================================================================== #
        # CREATION DES FICHIERS SASS DANS COMPONENTS SCSS
        Foreach ($components2 in $components){
            New-Item -Path $Files_Components -ItemType File -Name "$components2$extension_sass" -Force -Verbose
        }
# ======================================================================== #
        # CREATION DES FICHIERS SASS DANS BOUTONS SCSS
        Foreach ($buttons2 in $buttons){
            New-Item -Path $Files_Buttons -ItemType File -Name "$buttons2$extension_sass" -Force -Verbose
        }
# ======================================================================== #
        # CREATION DES FICHIERS SASS DANS CARDS SCSS
        Foreach ($cards2 in $cards){
            New-Item -Path $Files_Cards -ItemType File -Name "$cards2$extension_sass" -Force -Verbose
        }
# ======================================================================== #
        # CREATION DU FICHIER MODALS SCSS
        New-Item -Path $Files_Modals -ItemType File -Name "$modals$extension_sass" -Force -Verbose
# ======================================================================== #
        # CREATION DES FICHIERS PAGES SCSS
        Foreach ($pages2 in $pages){
            New-Item -Path $Files_Pages -ItemType File -Name "$pages2$extension_sass" -Force -Verbose
        }
# ======================================================================== #
        # CREATION DES FICHIERS THEMES SCSS
        Foreach ($themes2 in $themes){
            New-Item -Path $Files_Themes  -ItemType File -Name "$themes2$extension_sass" -Force -Verbose
        }
# ======================================================================== #
        # CREATION DES FICHIERS UTILS SCSS
        Foreach ($utils2 in $utils){
            New-Item -Path $Files_Utils  -ItemType File -Name "$utils2$extension_sass" -Force -Verbose
        }
# ======================================================================== #
        # CREATION DU FICHIER MAIN SCSS + AJOUT CONTENU "USE"
        New-Item -Path $Files_Assets -ItemType File -Name "$main$extension_sass" -Force -Verbose
        Add-Content -Path "$Files_Assets$main$extension_sass" -Value $main_use -Force -Verbose
        Start-Sleep -Seconds 2
        Write-Host "CREATION DES FICHIERS SAAS OK" -ForegroundColor Green -BackgroundColor Black
        Start-Sleep -Seconds 2
# ======================================================================== #
        # CREATION DU FICHIER HTML DEFAULT
        Write-Host "CREATION DU FICHIER HTML PAR DEFAUT" -BackgroundColor Black -ForegroundColor Red
        New-Item -Path $Directory_Racine -Name $html -ItemType File -Force -Verbose
        Add-Content -Path "$Directory_Racine\$html" -Value "$Content_HTML" -Force -Verbose
        Write-Host "CREATION DU FICHIER HTML PAR DEFAUT OK" -BackgroundColor Black -ForegroundColor Green
        Start-Sleep -Seconds 2
# ======================================================================== #
        # CREATION DU FICHIER CSS FONTS
        Write-Host "CREATION DU FICHIER FONTS PAR DEFAUT" -BackgroundColor Black -ForegroundColor Red
        Start-Sleep -Seconds 2
        New-Item -Path "$Directory_Racine\$directory_Fonts" -Name $Css -ItemType File -Force -Verbose
        Add-Content -Path "$Directory_Racine\$directory_Fonts\$Css" -Value "$fonts" -Force -Verbose
        Write-Host "CREATION DU FICHIER FONTS PAR DEFAUT OK" -BackgroundColor Black -ForegroundColor Green
        Start-Sleep -Seconds 2
        Clear-Host
# ======================================================================== #
        # CREATION DU FICHIER SCSS + AJOUT CONTENU
        Write-Host "CREATION DU FICHIER SCSS" -BackgroundColor Black -ForegroundColor Red
        Start-Sleep -Seconds 2
        New-Item -Path "$Directory_Racine\$directory_css" -Name $Scss -ItemType File -Force -Verbose
        Add-Content -Path "$Directory_Racine\$directory_css\$Scss" -Value $main_scss -Force -Verbose
        Write-Host "CREATION DU FICHIER SCSS OK" -BackgroundColor Black -ForegroundColor Green
        Start-Sleep -Seconds 2
# ======================================================================== #
        # AJOUT CONTENU USE DANS FICHIERS PAGES
        Write-Host "AJOUT DU CONTENU 'USE' DANS FICHIERS PAGES" -BackgroundColor Black -ForegroundColor Red
        Start-Sleep -Seconds 2
        $search_Pages = (Get-ChildItem -Path "$Path/$Data_User" -Recurse -Force)
        
        Foreach ($pages_use2 in $pages_use){

            Foreach ($search_Pages2 in $search_Pages){

                If ($pages_use2 -match $search_Pages2.name){

                    Add-Content -LiteralPath "$($search_Pages2.fullname)" -Value "$pages_data" -Force -ErrorAction Ignore
                }
            }
        }
        Write-Host "AJOUT DU CONTENU 'USE' DANS FICHIERS PAGES OK" -BackgroundColor Black -ForegroundColor Green
        Start-Sleep -Seconds 2
# ======================================================================== #
        # AJOUT CONTENU USE DANS FICHIERS LAYOUT
        Write-Host "AJOUT DU CONTENU 'USE' DANS FICHIERS LAYOUT" -BackgroundColor Black -ForegroundColor Red
        Start-Sleep -Seconds 2

        Foreach ($layout_use2 in $layout_use){

            Foreach ($search_Pages3 in $search_Pages){

                If ($layout_use2 -match $search_Pages3.name){

                    Add-Content -LiteralPath "$($search_Pages3.fullname)" -Value "$layout_data"  -Force -ErrorAction Ignore

                }
            }
        }
       
        Write-Host "AJOUT DU CONTENU 'USE' DANS FICHIERS LAYOUT OK" -BackgroundColor Black -ForegroundColor Green
        Start-Sleep -Seconds 2
# ======================================================================== #
                    # ARBORESCENCE FINAL DU PROJET #                          
# ======================================================================== #
        Clear-Host
        Start-Transcript -Path "$Directory_Racine/$arborescence" -Force
        Clear-Host
        Write-Host "
        ================================================================
        
                ARBORESCENCE DE VOTRE PROJET VsCode SASS
        
        ================================================================
        " -ForegroundColor Black -BackgroundColor Green
        Start-Sleep -Seconds 3
        TREE $Directory_Racine /F
        Pause
        Clear-Host
        Stop-Transcript     
        # FIN DU SCRIPT
        Clear-Host
        Write-Host "CREATION DE STRUCTURE VsCode SASS OK" -ForegroundColor Black -BackgroundColor Green
        Start-Sleep -Seconds 3
        Clear-Host
        Write-host "
        ================================================================
                            STRUCTURE SASS CREE

         1. Vous pouvez desormais lancer VsCode et ouvrir votre dossier.
           
         2. Installer la version de node.js que vous souhaitez

         3. Choisissez si vous souhaitez installer votre environnement
            en local ou global

            # Terminal dans VsCode:
            # Global
            npm install -g sass
            # Local
            npm install --save-dev sass
         
         4. Pour terminer, compiler votre fichier 
                'styles.scss' en 'styles.css'
            
            npx sass styles.scss styles.css
            ou
            sass styles.scss styles.css 
        ================================================================
        " -ForegroundColor Green
        Start-Sleep -Seconds 3
        Write-Host "My Github : https://github.com/Dev-IT-Seb/" -ForegroundColor Red -BackgroundColor Black
        Start-Sleep -Seconds 3
        pause
        Clear-Host
# ======================================================================== #
}
Else {
    Clear-Host
    Write-Warning "AUCUN DOSSIER SELECTIONNE"
    Start-Sleep -Seconds 1
    Write-Warning "VOUS DEVEZ OBLIGATOIREMENT SELECTIONNER UN DOSSIER"
    Start-Sleep -Seconds 1
    Clear-Host
    Write-Warning "VEUILLEZ RELANCER LE SCRIPT"
    Pause
}
# ======================================================================== #