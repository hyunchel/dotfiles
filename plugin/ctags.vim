" Create and remove tags.
function! ConstructCtags()
    silent :!ctags -R .
endfunction

function! DestroyCtags()
    silent :!rm tags
endfunction

function! s:constructCondaCtags()
    let conda_info = json_decode(system("conda info --json"))
    let conda_lib = conda_info["default_prefix"] . "/lib"
    let python_path = glob(conda_lib . "/python*")
    silent execute "!ctags -R " . python_path
endfunction
