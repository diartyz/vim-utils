function utils#themes#ChangeTheme(next, cmd, config, file)
	let themes = map(split(globpath(&runtimepath, a:file), '\n'), {key, val -> fnamemodify(val, ':t:r')})
	let index = exists(a:config) ? index(themes, eval(a:config)) : 0
	let length = len(themes)
	let index = a:next ? index + 1 : index - 1
	let index = (index + length) % length
	execute a:cmd themes[index]
	echo length index themes[index]
endfunction

function utils#themes#ChangeAirlineTheme(next)
	call utils#themes#ChangeTheme(a:next, 'AirlineTheme', 'g:airline_theme', 'autoload/airline/themes/*.vim')
endfunction

function utils#themes#ChangeColorTheme(next)
	call utils#themes#ChangeTheme(a:next, 'colorscheme', 'g:colors_name', 'colors/*.vim')
endfunction
