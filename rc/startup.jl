try
    @eval using Revise
    # Turn on Revise's automatic-evaluation behavior
    Revise.async_steal_repl_backend()
    @info "Starting Revise"
catch err
    @warn "Could not load Revise."
end
ENV["JULIA_EDITOR"] = "vim"

# Custom overwrite for skipping over words.
if isinteractive()
    import REPL
    import REPL.LineEdit

    const mykeys = Dict{Any,Any}(
        # Control Left Arrow.
        "\e\e[D" => (s,o...)->(LineEdit.edit_move_word_left(s)),
        # Control Right Arrow
        "\e\e[C" => (s,o...)->(LineEdit.edit_move_word_right(s)),
    )
    function customize_keys(repl)
        repl.interface = REPL.setup_interface(repl; extra_repl_keymap = mykeys)
    end
    atreplinit(customize_keys)
end

_packages() = (
    PackageSpec(name = "Revise"),
    PackageSpec(url = "https://github.com/vchuravy/Cthulhu.jl"),
)

#####
##### May use at some point
#####
# try
#     @eval using Rebugger
#     # Activate Rebugger's key bindings
#     Rebugger.keybindings[:stepin] = "\e[17~"      # Add the keybinding F6 to step into a function.
#     Rebugger.keybindings[:stacktrace] = "\e[18~"  # Add the keybinding F7 to capture a stacktrace.
#     atreplinit(Rebugger.repl_init)
# catch
#     @warn "Could not load Rebugger."
# end
