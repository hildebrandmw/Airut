try
    @eval using Revise
    # Turn on Revise's automatic-evaluation behavior
    Revise.async_steal_repl_backend()
    @info "Starting Revise"
catch err
    @warn "Could not load Revise."
end

atreplinit() do repl
    try
        @eval using OhMyREPL
    catch e
        @warn "error while importing OhMyREPL" e
    end
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
    PackageSpec(name = "OhMyREPL"),
    PackageSpec(name = "Cthulhu"),
    PackageSpec(name = "LanguageServer"),
    PackageSpec(name = "SymbolServer"),
    PackageSpec(name = "StaticLint"),
)

