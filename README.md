# sfm-paste.nvim

The `sfm-paste` extension is a plugin for the [sfm](https://github.com/dinhhuy258/sfm.nvim) plugin, providing a convenient way to paste text or images into new files within the sfm file explorer.

## Demonstration

Here is a short demonstration of the `sfm-paste` extension in action:

## Prerequisites

Before using `sfm-paste.nvim`, ensure that you have the following prerequisites:

- **macOS**: Install the `pngpaste` command-line tool by running `brew install pngpaste` using [Homebrew](https://brew.sh). This is required for pasting images from the clipboard on macOS.

## Installation

To install the `sfm-paste` extension, you will need to have the [sfm](https://github.com/dinhhuy258/sfm.nvim) plugin installed. You can then install the extension using your preferred plugin manager. For example, using [packer.nvim](https://github.com/wbthomason/packer.nvim):

```lua
{
  "dinhhuy258/sfm.nvim",
  requires = {
    { "dinhhuy258/sfm-paste.nvim" },
  },
  config = function()
    local sfm_explorer = require("sfm").setup {}
    sfm_explorer:load_extension "sfm-paste"
  end
}
```

## Configuration

## Compatibility

`sfm-paste.nvim` is currently supported on macOS only. Contributions to add support for other platforms are welcome.

## Credit

This project was inspired by and includes references to the [clipboard-image.nvim](https://github.com/ekickx/clipboard-image.nvim) project. We would like to thank the author for their contributions and code references.
