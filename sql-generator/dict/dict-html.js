/**
 * 请填写 name,value这是用于生成dict_type表的.
 */
var sys_dict_type = {
    name: '订单管理-状态',
    value: 'orders_orders_status'
}
/**
 * html 元素位置
 */


var data = [];
$('#id_status option').each(function () {
  data.push({label: $(this).text(), value: $(this).val()});
});
console.log(data)

var dictSql = `

    DELETE FROM sys_dict_type WHERE dict_type = '${sys_dict_type.value}';
    DELETE FROM sys_dict_data WHERE dict_type = '${sys_dict_type.value}';

    INSERT INTO sys_dict_type(dict_name, dict_type, status, create_by, create_time, update_by, update_time,
                              remark)
    VALUES ('${sys_dict_type.name}', '${sys_dict_type.value}', '0', 'admin', SYSDATE(), '', NULL, '${sys_dict_type.name}');
`;
var i = 0;
for (let {label, value} of data) {
    if (label) {
        dictSql += `
            INSERT INTO sys_dict_data(dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default,
                                      status, create_by, create_time, update_by, update_time, remark)
            VALUES (${i}, '${label}', '${value}', '${sys_dict_type.value}', '', '', '${i == 0 ? 'Y' : 'N'}', '0',
                    'admin',
                    SYSDATE(),
                    '', NULL, '${label}');
        `;
        i++;
    }
}

console.log(dictSql);
