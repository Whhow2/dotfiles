let g:ale_fixers = {
    \   'html': ['prettier'],
    \   'javascript': ['prettier', 'eslint'],
    \   'python': ['black'],
    \}

let g:ale_linters = {
    \   'javascript': ['eslint'],
    \}

let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_python_flake8_options = '--max-line-length 88 --extend-ignore=E203'
