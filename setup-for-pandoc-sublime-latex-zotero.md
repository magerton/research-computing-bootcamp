---
title: Setting up Pandoc, Sublime Text 3, LaTeX, Zotero
colorlinks: true
---

[Sublime Text 3](https://www.sublimetext.com/3) is a fast, cross-platform text editor with support for add-ins. Its LaTeX-related add-ins are especially strong.

[Pandoc](https://pandoc.org/) is a program that converts from one markup format to another.

[Zotero](https://www.zotero.org/download/) manages bibliographies and has support for BibTeX via add-ons

# Using Pandoc

[Pandoc](https://pandoc.org/) can compile things from markdown to LaTeX, PDF, MS Word, etc. [Rmarkdown](https://rmarkdown.rstudio.com/) uses Pandoc under the hood. What's really nice about Pandoc is that (a) files are stored as plain text, so they can be tracked easily in version control, (b) the syntax is way less heavy than LaTeX, and (c) it can output to a lot of different formats. [SublimeText 3](https://www.sublimetext.com/3) and [Atom](https://atom.io/) both have plugins that allow you to do live-updating of markdown documents and seem them as you type, and also Pandoc plugins to automatically compile documents.

- Download [Pandoc](https://pandoc.org/) and make sure it's on your path. You can optionally do this by using the Windows [Chocolatey](https://chocolatey.org/install#installing-chocolatey) package manager (though this requires administrative permissions) or the OS X [Homebrew](https://brew.sh/) package manager.
- (Optional) You'll need [Pandoc-crossref](http://lierdakil.github.io/pandoc-crossref/) if you're going to reference captions for floats or equations. Just download the binary from the [relases page](https://github.com/lierdakil/pandoc-crossref/releases) to your pandoc folder, making sure the binary correpsonds to your version of pandoc (find out by running `pandoc -v` or `pandoc --version`). 

To compile a document from markdown to various file formats, one can run one of the following commands. Just make sure that the BibTeX file and bibliography style file (`.csl`) listed in the markdown file's YAML header have the correct relative path. See [Zotero's repository of .csl files](https://www.zotero.org/styles). I like [Chicago author-date](https://www.zotero.org/styles?q=id%3Achicago-author-date)

## Examples

```bash
pandoc --filter=pandoc-citeproc                FILE.md -o FILE.pdf
pandoc --filter=pandoc-citeproc --wrap=none -s FILE.md -o FILE.tex
pandoc --filter=pandoc-citeproc                FILE.md -o FILE.doc
```

# SublimeText 3 setup with Pandoc

Mark really likes using [SublimeText 3](https://www.sublimetext.com/3) to edit markdown files because it's fast, has decent regular expressions, does syntax highlighting, and allows for a black backround. [Atom](https://atom.io/) is also good for writing, but [the Pandoc plugins](https://atom.io/packages/search?q=pandoc) don't look as fully featured.

1. Install [SublimeText 3](https://www.sublimetext.com/3)
2. Install [Package Control](https://packagecontrol.io/installation) for SublimeText 3
3. Install relevant packages for Pandoc and (if desired, LaTeX). You can find lots of nice packages at [the Package Control site](https://packagecontrol.io/).
 
    Mark likes to do this by going to `Preferences > Package Settings > Package Control > Settings - User` and replacing the file contents with the contents below. This will also install the really lovely LaTeX-related packages. You may need to restart SublimeText a few times.

    ```json
    // Package Control
    {
        "bootstrapped": true,
        "in_process_packages":
        [
        ],
        "installed_packages":
        [
            "A File Icon",
            "Alignment",
            "BracketHighlighter",
            "Colorsublime",
            "LaTeX Snippets",
            "LaTeX-cwl",
            "LaTeXTools",
            "LaTeXYZ",
            "MarkdownEditing",
            "MarkdownPreview",
            "Package Control",
            "sublimetext-Pandoc"
            "Theme - Gravity"
        ],
        "repositories":
        [
            "https://github.com/tbfisher/sublimetext-Pandoc"
        ]
    }
    ```

    Alternatively, go to `Preferences > Package Control > Package Control: Add resository` and enter <https://github.com/tbfisher/sublimetext-Pandoc> in the text box at the bottom of the screen. This adds the master repository for the SublimeText 3 Pandoc packge to Package Control. Then go to `Preferences > Package Control > Install Package` and install the `sublimetext-Pandoc` package. 

    To compile a file using Pandoc in Sublime

    a. (Optional) Open a Sublime Text project, or create one (`Project > Add Folder to Project` and then `Project > Save Project`). Projects in Sublime are really close to those in RStudio. They're the best way to organize stuff in Sublime as you can switch between them quickly under `Project > Quick Switch`. Opening a project will open up a file tree on the left side of the screen and set the working directory to this repo.
    b. Open a markdown file, for example, this one. `:)`
    c. Hit `Ctrl + Shift + p > Pandoc > PDF` and this will compile and open up your new compiled document.
    d. Customize the Pandoc settings (below) to create and save new files with the same base filename next to the `.md` files.

5. Update Sublime Text 3 settings at `Preferences > Settings` if desired. *Just make sure that the `Vintage` package is ignored or the `ESC` key won't work!* Mark likes the general Sublime Text settings below.

    ```json
    // Sublime Settings
    {
        "auto_complete_triggers":
        [
            {
                "characters": "<",
                "selector": "text.html"
            },
            {
                "characters": "\\",
                "selector": "text.tex.latex"
            }
        ],
        "bold_folder_labels": true,
        "color_scheme": "Packages/Theme - Gravity/Monokai Gravity.tmTheme",
        "detect_indentation": true,
        "draw_centered": true,
        "highlight_line": true,
        "ignored_packages":
        [
          "Vintage", // makes ESC work by disabling "Vintage" mode
        ],
        "line_numbers": true,
        "line_padding_bottom": 4,
        "line_padding_top": 4,
        "tab-size": 4,
        "theme": "Gravity.sublime-theme",
        "translate_tabs_to_spaces": true,
        "word_wrap": "auto",
        "wrap_width": 70,    
    }
    ```

6. Update the Pandoc package settings so that (a) it will handle citations, and (b) it will save `<FILE>.md` to `<FILE>.pdf` in the same directory (the `"out-local": true` flag). You can do this by going to `Preferences > Package Settings > Pandoc > Settings - User` and replacing contents with the file below. Just make sure to update paths.

    ```json
    // Pandoc
    {
      "user": {
        // Install location of Pandoc application
        "pandoc-path": "C:/Users/<USER>/AppData/Local/Pandoc/pandoc.exe",
        
        // Pandoc transformations from markdown to file formats specifies
        //    the relevant flags under "pandoc-arguments"
        "transformations": {
          "out-local": true,
          "LaTeX": {
            "new-buffer": 1,
            "scope": {
              "text.html": "html",
              "text.html.markdown": "markdown"
            },
            "pandoc-arguments": [
              "--to=latex",
              "--no-highlight",
              "--standalone",
              "--filter=pandoc-citeproc",
            ]
          },
          "my Microsoft Word": {
            "out-local": true,
            "scope": {
              "text.html": "html",
              "text.html.markdown": "markdown"
            },
            "pandoc-arguments": [
              "-t", "docx",
              "--filter=pandoc-citeproc",
            ]
          },
          "myPDF": {
            "scope": {
              "text.html": "html",
              "text.html.markdown": "markdown"
            },
            "out-local": true,
            "pandoc-arguments": [
              "-t", "pdf",
              "--filter=pandoc-crossref",
              "--filter=pandoc-citeproc",
              // use --latex-engine=engine where engine is
              // pdflatex|lualatex|xelatex. This may need to be specified with a
              // full path, e.g. on a mac with BasicTeX
              // "--latex-engine=/usr/texbin/pdflatex"
              // or on Windows with MiKTeX
              // "--latex-engine=C:/Program Files (x86)/MiKTeX 2.9/miktex/bin/pdflatex.exe"
              // if -o or --output missing, will write to a temporary file
              // "--output=~/Downloads/output.pdf"
            ]
          },
          "myHTML-webpage": {
            "new-buffer": 1,
            "out-ext": "html",
            "out-local": true,
            "scope": {
              "text.html.markdown": "markdown"
            },
            "syntax_file": "Packages/HTML/HTML.tmLanguage",
            "pandoc-arguments": [
              "--to=html5",
              "--no-highlight",
              "--standalone", 
              // "+smart", // "-C"
              // "--include-in-header=pandoc.css",
              "--dpi=300",
              "--self-contained",
              "--filter=pandoc-citeproc",
            ]
          },

          "myBeamer Slides (PDF)": {
            "scope": {
              "text.html": "html",
              "text.html.markdown": "markdown",
            },
            // Use the "out-ext" parameter to define a custom output file extension. Commonly used for pdf.
            "out-ext": "pdf",
            "out-local": true,
            "pandoc-arguments": [
              "-t", "beamer",
              "--filter=pandoc-crossref",
              "--filter=pandoc-citeproc",
              "--pdf-engine=C:/Users/USER/AppData/Local/Programs/MiKTeX 2.9/miktex/bin/x64/pdflatex.exe"
            ]
          },

        },
       "pandoc-format-file": ["docx", "epub", "pdf", "odt", "beamer", "html"],
      }
    }
    ```

7. If desired, make Markdown text formatting have a black background. Open a markdown file (ends in `.md`), make Sublime see a markdown file as "Github Flavored Markdown" `View > Syntax > Markdown Editing > Markdown GFM`, and replace `Preferences > Package Settings > Markdown Editing > Markdown GFM Settings - User` with the file below.

    ```json
    // MarkdownEditing - GFM settings
    {
        "color_scheme": "Packages/Theme - Gravity/Monokai Gravity.tmTheme",
        "line_padding_top": 3,
        "line_padding_bottom": 3,
        "line_numbers": true,
        "highlight_line": true,
    }
    ```

# SublimeText 3 and LaTeX

If using [LaTeXTools](https://latextools.readthedocs.io/en/latest/) in SublimeText 3 on Windows, you should also consider 

- Installing [Sumatra PDF](https://www.sumatrapdfreader.org/free-pdf-reader.html) and set up sync with SublimeText using these [directions](https://latextools.readthedocs.io/en/latest/install/#windows) that involve setting an option in Sumatra to `"C:\Program Files\Sublime Text 3\sublime_text.exe" "%f:%l"`. 
- Running `Preferences > Package Settings > LaTeXTools > Check System` to detect everything.
- On Windows, you'll need to install `latexmk` via the MikTeX package manager. - Mark likes to use use the following Package Settings in ``Preferences > Package Settings > LaTeXTools > Settings - User`

  ```json
  // LatexTools
  {
      "keep_focus": false,
      // Sync PDF to current editor position after building (true) or not
      "forward_sync": true,
      // Ends of the names of temporary files to be deleted
      "temp_files_exts": [
          ".blg",".bbl",".aux",".log",".brf",".nlo",".out",".dvi",".ps",
          ".lof",".toc",".fls",".fdb_latexmk",".pdfsync",".synctex.gz",
          ".ind",".ilg",".idx",".bcf","-blx.bib",".run.xml",".nav",".snm"
      ],
      "windows": {
          "distro" : "texlive",
          "sumatra": "\"C:\\Program Files\\SumatraPDF\\SumatraPDF.exe\" -invert-colors -set-color-range #303030 #F0F0F0",

      },
      "builder": "traditional",
      // image types you use in latex
      // these types will be used for autocompletion and
      // opening of included images, when no extension is written
      "image_types": ["png", "pdf", "jpg", "jpeg", "eps"],
      "bibliography": "new",
  }
  ```

# Zotero

Zotero is a great cross-platform bibliography management tool. I like a few features:

- It can pull citations automagically from JSTOR and other places, as well as from .pdfs directly
- It's searchable
- Shared libraries with co-authors
- It stores copies of the articles
- It will keep your .bibtex file up-to-date
- Drag & drop citation keys to MS Word, Pandoc

Here's how to get started


Install [Zotero](https://www.zotero.org/download/)


Add the [Better Bib(La)Tex](https://github.com/retorquere/zotero-better-bibtex/releases) add-on. 

- Download the `.xpi` file from the releases page, and Go to `Zotero > Tools > Add-ons > Gear Icon > Install add-on from file` and select the add-on. 
- I like to make the following changes to the Better Bib(La)Tex settings under `Zotero > Edit > Prefereneces > Better Bib(La)TeX`
    + Citation keys
        * Citation key format: `[auth:lower][year][veryshorttitle:lower]`
        * Force citation key to plain text
    + Export
        * BibTex
            - unicode as plain-text
            - Add URLS to BibTex export: no
        * BibLaTex
            - Export as plain-text 
        * Fields
            - Export DOI
            - Omit `file,abstract,timestamp,eprinttype,eprint`
    * Auto export
        - When Idle (if big library)
- Also, to rename pdfs as `Author (year) Short Title`
    * `Edit > Prefs > Advanced > Config Editor > attachmentRenameFormatString`  and enter `{%c }{(%y) }{%t{50}}`

+ [Zotfile](http://zotfile.com/) can export .pdfs to Box/Dropbox/OneDrive and also re-import annotated versions


