const fs  = require('fs')
const fsPromises = fs.promises;
const homeDir = require('os').homedir();

const NVIM = `${homeDir}/.config/nvim/`;
const ALACRITTY = `${homeDir}/.config/alacritty`
const TMUX = `${homeDir}/.tmux.conf`;
const ZSHRC = `${homeDir}/.zshrc`;
const RECURSIVE = {recursive: true}

async function copy(source,dest,options){
   try {
    if(!fs.existsSync(dest)){
       fs.mkdirSync(dest);
    }
    await fsPromises.cp(source,dest,options)
    console.log('Successfully linked ',dest)
   }
   catch(e){
    console.log(e);
   }

}

copy(`${process.cwd()}/nvim/`,NVIM, RECURSIVE )
copy(`${process.cwd()}/alacritty/`,ALACRITTY, RECURSIVE )
copy(`${process.cwd()}/tmux/.tmux.conf`,TMUX,  )
copy(`${process.cwd()}/zshell/.zshrc`,ZSHRC,  )
