let menuData = require('toml').parse(require('fs').readFileSync('../menu/manu_config/menu.toml'));
const fs = require('fs-extra')

let str = '';

async function example(f, text) {
  await fs.outputFile(f, text);
}

async function run() {
  for (const key in menuData) {
    let item = menuData[key];
    for (const v in item) {
      if (!['menuId', 'icon', 'path'].includes(v)) {
        let itemElement = item[v];
        str += `
UPDATE gen_table
SET function_author='Richard',
    package_name='com.ruoyi.${item.path.replace(/[-_]+/g,'')}',
    module_name='${item.path}',
    business_name='${itemElement.path}'
WHERE table_comment = '${key}-${v}';
        `;
      }
    }
  }
  example("./set-gen-table.sql", str);
}

run();
