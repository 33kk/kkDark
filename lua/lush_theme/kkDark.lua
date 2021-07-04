local p = require('colors')
local lush = require('lush')
local hsluv = lush.hsluv

local theme = lush(function()
  return {
    Normal       { fg=p.fg, bg=p.bg }, -- normal text
    NormalFloat  { bg=p.black, Normal }, -- Normal text in floating windows.
    NormalNC     { Normal }, -- normal text in non-current windows
    Comment      { fg=p.green }, -- any comment
    -- ColorColumn  { }, -- used for the columns set with 'colorcolumn'
    -- Conceal      { }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    -- Cursor       { }, -- character under the cursor
    -- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg=p.black }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { CursorColumn }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { Normal }, -- directory names (and other special names in listings)
    DiffAdd      { fg=p.black_dark, bg=p.green_bright }, -- diff mode: Added line |diff.txt|
    DiffChange   { fg=p.black_dark, bg=p.yellow }, -- diff mode: Changed line |diff.txt|
    DiffDelete   { fg=p.black_dark, bg=p.red_bright }, -- diff mode: Deleted line |diff.txt|
    DiffText     { fg=p.black, bg=p.green }, -- diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer  { fg=p.fg.darken(50) }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { }, -- cursor in a focused terminal
    -- TermCursorNC { }, -- cursor in an unfocused terminal
    ErrorMsg     { fg=p.red_bright, Normal }, -- error messages on the command line
    VertSplit    { fg=p.black_bright }, -- the column separating vertically split windows
    LineNr       { fg=p.gray_dark, Normal }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { Normal }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    Folded       { LineNr }, -- line used for closed folds
    FoldColumn   { Folded }, -- 'foldcolumn'
    SignColumn   { Normal }, -- column where |signs| are displayed
    MsgArea      { Normal }, -- Area for messages and cmdline
    MsgSeparator { gui="inverse", MsgArea }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    ModeMsg      { MsgArea }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MoreMsg      { MsgArea }, -- |more-prompt|
    NonText      { fg=p.gray_dark }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Pmenu        { NormalFloat }, -- Popup menu: normal item.
    PmenuSel     { gui="inverse", Pmenu }, -- Popup menu: selected item.
    PmenuSbar    { Pmenu }, -- Popup menu: scrollbar.
    PmenuThumb   { PmenuSel }, -- Popup menu: Thumb of the scrollbar.
    Question     { MsgArea }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { bg=p.cyan, fg=p.black }, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
    IncSearch    { Search }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    Substitute   { Search }, -- |:substitute| replacement text highlighting
    MatchParen   { Search }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    SpecialKey   { NonText }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise. 
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    StatusLine   { bg=p.bg }, -- status line of current window
    StatusLineNC { NormalFloat }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    TabLine      { Pmenu }, -- tab pages line, not active tab page label
    TabLineFill  { Pmenu }, -- tab pages line, where there are no labels
    TabLineSel   { PmenuSel }, -- tab pages line, active tab page label
    Title        { gui="bold", Normal }, -- titles for output from ":set all", ":autocmd" etc.
    Visual       { Search }, -- Visual mode selection
    VisualNOS    { Visual }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { bg=p.yellow, fg=p.black }, -- warning messages
    Whitespace   { NonText }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    WildMenu     { NormalFloat }, -- current match in 'wildmenu' completion

    -- These groups are not listed as default vim groups,
    -- but they are defacto standard group names for syntax highlighting.
    -- commented out groups should chain up to their "preferred" group by
    -- default,
    -- Uncomment and edit if you want more specific syntax highlighting.

    Constant       { fg=p.blue_bright }, -- (preferred) any constant
    String         { fg=p.red_light }, --   a string constant: "this is a string"
    Character      { String }, --  a character constant: 'c', '\n'
    Number         { fg=p.green_bright }, --   a number constant: 234, 0xff
    Float          { Number }, --    a floating point constant: 2.3e10
    Boolean        { Constant, gui="italic" }, --  a boolean constant: TRUE, false

    Identifier     { Constant }, -- (preferred) any variable name
    Function       { Identifier }, -- function name (also: methods for classes)
    Method         { fg=p.yellow }, -- methods for classes

    Statement      { fg=p.magenta }, -- (preferred) any statement
    Conditional    { Statement }, --  if, then, else, endif, switch, etc.
    Repeat         { Statement }, --   for, do, while, etc.
    Label          { fg=p.magenta_bright }, --    case, default, etc.
    Operator       { Normal }, -- "sizeof", "+", "*", etc.
    Keyword        { Statement }, --  any other keyword
    Exception      { Statement }, --  try, catch, throw

    PreProc        { fg=p.purple }, -- (preferred) generic Preprocessor
    Include        { Statement }, --  preprocessor #include
    Define         { PreProc }, --   preprocessor #define
    Macro          { PreProc }, --    same as Define
    PreCondit      { PreProc }, --  preprocessor #if, #else, #endif, etc.

    Type           { fg=p.cyan }, -- (preferred) int, long, char, etc.
    StorageClass   { Type }, -- static, register, volatile, etc.
    Structure      { Type }, --  struct, union, enum, etc.
    Typedef        { Type }, --  A typedef

    Special        { Identifier, gui="italic" }, -- (preferred) any special symbol
    SpecialChar    { Special }, --  special character in a constant
    Tag            { Special }, --    you can use CTRL-] on this
    Delimiter      { Special }, --  character that needs attention
    SpecialComment { Special }, -- special things inside a comment
    Debug          { Special }, --    debugging statements

    Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold       { gui = "bold" },
    Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    Error          { fg=p.red_bright, sp=p.red_bright, gui="undercurl" }, -- (preferred) any erroneous construct

    Todo           { fg=p.yellow_bright, sp=p.yellow_bright, gui="undercurl" }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    LspReferenceText                     { Search }, -- used for highlighting "text" references
    LspReferenceRead                     { Search }, -- used for highlighting "read" references
    LspReferenceWrite                    { Search }, -- used for highlighting "write" references

    LspDiagnosticsDefaultError           { fg=p.red_bright }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultWarning         { fg=p.yellow_bright }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultInformation     { Special }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    LspDiagnosticsDefaultHint            { Special }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    -- LspDiagnosticsVirtualTextError       { }, -- Used for "Error" diagnostic virtual text
    -- LspDiagnosticsVirtualTextWarning     { }, -- Used for "Warning" diagnostic virtual text
    -- LspDiagnosticsVirtualTextInformation { }, -- Used for "Information" diagnostic virtual text
    -- LspDiagnosticsVirtualTextHint        { }, -- Used for "Hint" diagnostic virtual text

    LspDiagnosticsUnderlineError         { sp=p.red_bright, gui="undercurl" }, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning       { sp=p.yellow_bright, gui="undercurl" }, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation   { sp=p.fg, gui="undercurl" }, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint          { sp=p.fg, gui="undercurl" }, -- Used to underline "Hint" diagnostics

    -- LspDiagnosticsFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column

    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    TSAnnotation         { Special };    -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSAttribute          { Special };    -- (unstable) TODO: docs
    TSBoolean            { Boolean };    -- For booleans.
    TSCharacter          { Character };    -- For characters.
    TSComment            { Comment };    -- For comment blocks.
    TSConstructor        { Type };    -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
    TSConditional        { Conditional };    -- For keywords related to conditionnals.
    TSConstant           { Constant };    -- For constants
    TSConstBuiltin       { Constant, gui="italic" };    -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro         { Macro };    -- For constants that are defined by macros: `NULL` in C.
    TSError              { Error };    -- For syntax/parser errors.
    TSException          { Conditional };    -- For exception related keywords.
    TSField              { Identifier };    -- For fields.
    TSFloat              { Float };    -- For floats.
    TSFunction           { Function };    -- For function (calls and definitions).
    TSFuncBuiltin        { Special };    -- For builtin functions: `table.insert` in Lua.
    TSFuncMacro          { Macro };    -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude            { Include };    -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    TSKeyword            { Keyword };    -- For keywords that don't fall in previous categories.
    TSKeywordFunction    { Keyword };    -- For keywords used to define a fuction.
    TSLabel              { Label };    -- For labels: `label:` in C and `:label:` in Lua.
    TSMethod             { Method };    -- For method calls and definitions.
    TSNamespace          { Include };    -- For identifiers referring to modules and namespaces.
    -- TSNone               { };    -- TODO: docs
    TSNumber             { Number };    -- For all numbers
    TSOperator           { Normal };    -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter          { Identifier };    -- For parameters of a function.
    TSParameterReference { Identifier };    -- For references to parameters of a function.
    TSProperty           { Identifier };    -- Same as `TSField`.
    TSPunctDelimiter     { Normal };    -- For delimiters ie: `.`
    TSPunctBracket       { Normal };    -- For brackets and parens.
    TSPunctSpecial       { Normal };    -- For special punctutation that does not fall in the catagories before.
    TSRepeat             { Repeat };    -- For keywords related to loops.
    TSString             { String };    -- For strings.
    TSStringRegex        { String };    -- For regexes.
    TSStringEscape       { Label };    -- For escape characters within a string.
    TSSymbol             { Type };    -- For identifiers referring to symbols or atoms.
    TSType               { Type };    -- For types.
    TSTypeBuiltin        { Type };    -- For builtin types.
    TSVariable           { Constant };    -- Any variable name that does not have another highlight.
    TSVariableBuiltin    { Keyword, gui="italic" };    -- Variable names that are defined by the languages, like `this` or `self`.

    TSTag                { Tag };    -- Tags like html tag names.
    TSTagDelimiter       { Tag };    -- Tag delimiter like `<` `>` `/`
    -- TSText               { };    -- For strings considered text in a markup language.
    -- TSEmphasis           { };    -- For text to be represented with emphasis.
    -- TSUnderline          { };    -- For text to be represented with an underline.
    -- TSStrike             { };    -- For strikethrough text.
    TSTitle              { Title };    -- Text that is part of a title.
    TSLiteral            { String };    -- Literal text.
    TSURI                { gui="underline" };    -- Any URI like a link or email.

    -- Plugins

    GitSignsAdd     { fg=p.green },
    GitSignsChange  { fg=p.yellow_bright },
    GitSignsDelete  { fg=p.red_bright },

    StartifyBracket { Normal },
    StartifyNumber  { Number },
    StartifySelect  { Visual },
    StartifySpecial { Special },
    StartifySlash   { Normal },
    StartifyFile    { Identifier },
    StartifyPath    { Normal },
    StartifyHeader  { Normal },
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap
