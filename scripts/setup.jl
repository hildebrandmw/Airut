# Make directory for local binary/library dependencies to go.
const USR = expanduser("~/usr")
const TMP = expanduser("~/tmp")

mkpath(USR)
mkpath(TMP)

#####
##### Setup `ccls` for C++ language server.
#####

function install_ccls()
    cd(TMP)
    if !isdir("./ccls")
        run(`git clone --depth=1 --recursive https://github.com/MaskRay/ccls`)
    end
    cd("./ccls")
    run(`cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$USR`)
    run(`cmake --build Release --target install`)
end
