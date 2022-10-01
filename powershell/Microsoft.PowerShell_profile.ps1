# oh my post config
oh-my-posh init pwsh --config $HOME\AppData\Local\Programs\oh-my-posh\themes\bubblesextra.omp.json | Invoke-Expression
Import-Module -Name Terminal-Icons

######## ALIAS ########

# Blog ASIR
Set-Alias cdb changeDirToBlogAsir
Set-Alias blog startBlogAsir
Set-Alias aso createNewPostASO
Set-Alias sadi createNewPostSADi
Set-Alias gitb gitBlogRepo

# Git
Set-Alias gits gitStatus
Set-Alias gitc gitCommit
Set-Alias gita gitAdd
Set-Alias gitp gitPush
Set-Alias gitl gitPull
Set-Alias gitd gitDiff

######## FUNCTIONS ########

# Blog ASIR
function changeDirToBlogAsir {
	Set-Location $HOME\Code\blog-asir
}
function startBlogAsir {
	cdb
	hugo server
}
function createNewPostASO {
	cdb
	Copy-Item .\templates\aso.md .\content\post\aso\index.md
}
function createNewPostSADi {
	cdb
	Copy-Item .\templates\sadi.md .\content\post\sadi\index.md
}
function gitBlogRepo {
	cdb
	git add .
	git commit -m "Add Work"
	git push
}

# Git
function gitStatus { git status $args}
function gitCommit { git commit $args}
function gitAdd { git add $args}
function gitPush { git push $args}
function gitPull { git pull $args}
function gitDiff { git diff $args}