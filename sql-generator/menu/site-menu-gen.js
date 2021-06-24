var sql = `
    USE ry;

    DELETE
    FROM sys_menu
    WHERE menu_id >= 2000;
`;
var readme = `
# 页面权限信息预设信息

`;
let menuData = require('toml').parse(require('fs').readFileSync('./manu_config/menu.toml'));


genSql(menuData);

function genSql(menuData, M_order_num = 0, parentId = 0) {
    for (let key1 in menuData) {
        M_order_num += 10;
        var M = menuData[key1];
        if (typeof M == "object") {
            M.path = `${M.path}`;
            sql += firstMenu(M, M_order_num, key1, parentId);
        }

        var C_order_nume = 0;
        if (typeof M == "object") {
            for (const key2 in M) {
                let C = M[key2];
                if (C.type == 'm') {
                    C.path = M.path + '/' + C.path;
                    var tmp = {[key2]: C};
                    genSql(tmp, 0, M.menuId);
                } else {
                    if (typeof C == "object") {
                        C_order_nume += 1;
                        sql += secondaryMenu(C, C_order_nume, M, key2);
                        for (let key3 in C) {
                            let buttons = C[key3];
                            if (typeof buttons == "object") {
                                var F_order_num = 0;
                                for (let fkey in buttons) {
                                    F_order_num += 1;
                                    let F = buttons[fkey];
                                    sql += buttonMenu(F, F_order_num, fkey, C, M, key2)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

/**
 *  -- 一级菜单
 */

function firstMenu(M, M_order_num, firstMenuKey, parentId = '0') {
    readme += `
目录名称:${firstMenuKey}
    `;

    return `
      insert into sys_menu values('${M.menuId}', '${firstMenuKey}', '${parentId}', '${M_order_num}', '#',                '',          'M', '0', '1', '', 'fa fa-${M.icon}',           'admin', sysdate(), '', null, '${firstMenuKey}-目录');
    `;
}

/**
 * -- 二级菜单
 */
function secondaryMenu(C, C_order_nume, M, key2) {
    let perms = `${M.path}:${C.path}:list`.replace(/\//g, ':');
    readme += `
    页面名称:${key2}
    路由地址:/${M.path}/${C.path}
    权限字符:${perms}
    `;
    return `
      insert into sys_menu values('${C.menuId}',  '${key2}', '${M.menuId}', '${C_order_nume}', '${M.path}/${C.path}',          '', 'C', '0', '1', '${perms}',         'fa fa-user-o',          'admin', sysdate(), '', null, '${key2}-菜单');
    `;
}

/**
 * -- 管理按钮
 */
function buttonMenu(F, F_order_num, key, C, M, pageName) {
    let perms = `${M.path}:${C.path}:${F.perms}`.replace(/\//g, ':');
    readme += `
        按钮名称:${pageName}-${key}-按钮
        权限字符:${perms}
    `;
    return `
      insert into sys_menu values('${F.menuId}', '${key}', '${C.menuId}', '${F_order_num}',  '#', '',  'F', '0', '1', '${perms}',        '#', 'admin', sysdate(), '', null, '${pageName}-${key}-按钮');
    `;

}

const fs = require('fs-extra')

async function example(f, text) {
    await fs.outputFile(f, text);
}

example("./menu.sql", sql);
example("./Info.md", readme);

