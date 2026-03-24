return {
  {
    'CRAG666/code_runner.nvim',
    lazy = false,
    config = function()
      require('code_runner').setup {
        filetype = {
          javascript = 'node',
          java = {
            'cd $dir && clear &&',
            'javac *.java && clear &&',
            'java $fileNameWithoutExt',
          },
          c = {
            'cd $dir && clear &&',
            'gcc $fileName',
            '-o $fileNameWithoutExt &&',
            '$dir/$fileNameWithoutExt',
          },
          cpp = {
            'cd $dir && clear &&',
            'g++ $fileName',
            '-o $fileNameWithoutExt &&',
            '$dir/$fileNameWithoutExt',
          },
          python = 'python -u',
          sh = 'bash',
          ruby = 'ruby',
          rust = {
            'cd $dir && clear &&',
            'rustc $fileName &&',
            '$dir/$fileNameWithoutExt',
          },
          asm = {
            'cd $dir && clear &&',
            'java -jar /usr/share/java/mars-mips/Mars.jar nc $fileName',
            -- Install MARS, then use its address (use `pacman -Ql mars-mips`, then get the one with Mars.jar)
          },
          lua = {
            'cd $dir && clear &&',
            'lua $fileName',
          },
        },
        mode = 'toggleterm',
        focus = true,
        startinsert = true,
      }
    end,
  },
}
