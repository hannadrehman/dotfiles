const fs  = require('fs')
const fsPromises = fs.promises;
const homeDir = require('os').homedir();

const NVIM = `${homeDir}/.config/nvim/`;
const ALACRITTY = `${homeDir}/.config/alacritty`
const TMUX = `${homeDir}/.tmux.conf`;
const ZSHRC = `${homeDir}/.zshrc`;
const OPTIONS = {recursive: true, }



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



async function write(source,data='',options){
   try {
    await fsPromises.writeFile(source,data,options)
    console.log('Successfully written ',source)
   }
   catch(e){
    console.log(e);
   }

}


write(ZSHRC)
write(TMUX)

copy(`${process.cwd()}/nvim/`,NVIM, OPTIONS )
copy(`${process.cwd()}/alacritty/`,ALACRITTY, OPTIONS )
copy(`${process.cwd()}/tmux/.tmux.conf`,TMUX, )
copy(`${process.cwd()}/zshell/.zshrc`,ZSHRC, )
