let menuData = require('toml').parse(require('fs').readFileSync('./manu_config/origin-menu.toml'));
const {translate} = require('bing-translate-api');
const fs = require('fs-extra')

let str = ``;
let menuId = 2000;

async function trans(text) {
  var res = await translate(text, null, 'en', true);
  let result = res.translation.toLowerCase().replace(/[\s-]+/g, '_').replace(/_+/g, '_');
  str += `
#------------------------${text}(目录)---------------------------
['${text}']
menuId = ${menuId++}
icon = 'system'
path = '${result}'
  `;
}

async function transub(text, parentText) {
  var res = await translate(text, null, 'en', true);
  let result = res.translation.toLowerCase().replace(/[\s-]+/g, '_').replace(/_+/g, '_');
  str += `
#------------------------${text}(二级菜单)---------------------------
['${parentText}'.'${text}']
menuId = ${menuId++}
icon = 'guid'
path = '${result}'

#-----------${parentText}->${text} 按钮权限------------
['${parentText}'.'${text}'.'按钮权限'.'查询']
menuId = ${menuId++}
perms = 'query'

['${parentText}'.'${text}'.'按钮权限'.'添加']
menuId = ${menuId++}
perms = 'add'

['${parentText}'.'${text}'.'按钮权限'.'编辑']
menuId = ${menuId++}
perms = 'edit'

['${parentText}'.'${text}'.'按钮权限'.'删除']
menuId = ${menuId++}
perms = 'remove'

['${parentText}'.'${text}'.'按钮权限'.'导入']
menuId = ${menuId++}
perms = 'import'

['${parentText}'.'${text}'.'按钮权限'.'导出']
menuId = ${menuId++}
perms = 'export'
  `;
}

async function example(f, text) {
  await fs.outputFile(f, text);
}

async function run() {
  for (const key in menuData) {
    await trans(key);
    let item = menuData[key].submenu;
    for (const v of item) {
      await transub(v, key);
    }
  }
  example("./gen-menu.toml", str);

}

run();
