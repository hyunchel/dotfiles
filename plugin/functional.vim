" Helper functions for semi-functional-programming in VIM
function! Sorted(l)
    let new_list = deepcopy(a:l)
    call sort(new_list)
    return new_list
endfunction

function! Reversed(l)
    let new_list = deepcopy(a:l)
    call reverse(new_list)
    return new_list
endfunction

function! Append(l, val)
    let new_list = deepcopy(a:l)
    call add(new_list, a:val)
    return new_list
endfunction

function! Assoc(obj, key, val)
    let new_object = deepcopy(a:obj)
    let new_object[a:key] = a:val
    return new_object
endfunction

function! Pop(obj, key)
    let new_object = deepcopy(a:obj)
    call remove(new_object, a:key)
    return new_object
endfunction

" Higher Order Functions
function! Mapped(fn, obj)
    let new_object = deepcopy(a:obj)
    call map(new_object, string(a:fn) . '(v:val)')
    return new_object
endfunction

function! Filtered(fn, obj)
    let new_object = deepcopy(a:obj)
    call filter(new_object, string(a:fn) . '(v:val)')
    return new_object
endfunction

function! Removed(fn, obj)
    let new_object = deepcopy(a:obj)
    call filter(new_object, '!' . string(a:fn) . '(v:val)')
    return new_object
endfunction

function! Reduced(fn, obj)
    if len(a:obj) == 0
        return [0]
    elseif len(a:obj) == 1
        if type(a:obj) == v:t_list
            return [a:obj[0]]
        endif
        return [a:obj[keys(a:obj)[0]]]
    else
        let key = 0
        if type(a:obj) == v:t_dict
            let key = a:obj[keys(a:obj)[0]]
        endif
        let new_object = deepcopy(a:obj)
        let initial = remove(new_object, key)
        return Reduced(a:fn, a:fn(initial, remove(new_object, key)) + new_object)
    endif
endfunction
