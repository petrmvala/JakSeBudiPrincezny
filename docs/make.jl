using Pkg
Pkg.activate(@__DIR__)
Pkg.instantiate()

using Documenter
using Documenter.Writers: HTMLWriter
using DocumenterTools.Themes: compile

# theme extension
for theme in ["light", "dark"]
    mktemp(@__DIR__) do path, io
        write(io, join([
            read(joinpath(HTMLWriter.ASSETS_THEMES, "documenter-$(theme).css"), String),
            read(joinpath(@__DIR__, "src/assets/theme-$(theme).css"), String)
        ], "\n"))
        compile(path, joinpath(@__DIR__, "src/assets/themes/documenter-$(theme).css"))
    end
end

# outline
contents = [
    "Idealni pripad" => "./idealni_pripad.md",
]

# make docs options
makedocs(;
    authors = "Petr Vala",
    sitename = "Jak se budi princezny",
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        collapselevel = 1,
    ),
    pages = [
        "Obsah" => contents,
    ],
)

deploydocs(;
    repo="github.com/petrmvala/JakSeBudiPrincezny.git",
)
